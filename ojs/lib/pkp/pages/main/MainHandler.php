<?php

/**
 * @file lib/pkp/pages/main/MainHandler.php
 *
 * @class MainHandler
 * @ingroup pages_main
 *
 * @brief Minimal backend dashboard handler for OJS/PKP.
 */

namespace PKP\pages\main;

use PKP\handler\PKPHandler;
use APP\template\TemplateManager;
use PKP\security\authorization\SubmissionAccessPolicy;
use PKP\security\authorization\UserRequiredPolicy;
use PKP\security\Role;

class MainHandler extends PKPHandler
{

    /** @var bool Halaman ini merupakan halaman backend */
    public $_isBackendPage = true;

    public function __construct()
    {
        parent::__construct();
        $this->addRoleAssignment(
            [
                Role::ROLE_ID_AUTHOR,
                Role::ROLE_ID_SUB_EDITOR,
                Role::ROLE_ID_MANAGER,
                Role::ROLE_ID_SITE_ADMIN,
            ],
            [
                'index',
                'saved',
                'wizard', // @deprecated 3.4
            ]
        );
    }
    /**
     * Authorization check
     */
    public function authorize($request, &$args, $roleAssignments): bool
    {
        $submissionId = (int) $request->getUserVar('id');

        // Creating a new submission
        if ($submissionId === 0) {
            $this->addPolicy(new UserRequiredPolicy($request));
            $this->markRoleAssignmentsChecked();
        } else {
            $this->addPolicy(new SubmissionAccessPolicy($request, $args, $roleAssignments, 'id'));
        }

        return parent::authorize($request, $args, $roleAssignments);
    }

    /**
     * Main Page
     */
    public function index($args, $request)
    {
        $this->setupTemplate($request);
        $templateMgr = TemplateManager::getManager($request);
        $context = $request->getContext();
        
        if (!$context) {
            $request->redirect(null, 'user');
        }

        // Get filter parameter and page number
        $filterStatus = $request->getUserVar('filter');
        $currentPage = max(1, (int) $request->getUserVar('page'));
        $itemsPerPage = 5;
        
        // Count submissions by status
        $contextId = (int) $context->getId();
        
        // Under Review (STATUS_QUEUED and in review stages)
        $underReviewCount = \APP\facades\Repo::submission()->getCollector()
            ->filterByContextIds([$contextId])
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_QUEUED])
            ->getCount();
        
        // Declined/Rejected
        $rejectedCount = \APP\facades\Repo::submission()->getCollector()
            ->filterByContextIds([$contextId])
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_DECLINED])
            ->getCount();
        
        // Published
        $publishedCount = \APP\facades\Repo::submission()->getCollector()
            ->filterByContextIds([$contextId])
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_PUBLISHED])
            ->getCount();
        
        // Scheduled (Accepted - waiting to be published)
        $scheduledCount = \APP\facades\Repo::submission()->getCollector()
            ->filterByContextIds([$contextId])
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_SCHEDULED])
            ->getCount();

        // Get submissions based on filter
        $collector = \APP\facades\Repo::submission()->getCollector()
            ->filterByContextIds([$contextId]);
        
        if ($filterStatus === 'review') {
            $collector->filterByStatus([\PKP\submission\PKPSubmission::STATUS_QUEUED]);
        } elseif ($filterStatus === 'rejected') {
            $collector->filterByStatus([\PKP\submission\PKPSubmission::STATUS_DECLINED]);
        } elseif ($filterStatus === 'accepted') {
            $collector->filterByStatus([\PKP\submission\PKPSubmission::STATUS_SCHEDULED]);
        } elseif ($filterStatus === 'published') {
            $collector->filterByStatus([\PKP\submission\PKPSubmission::STATUS_PUBLISHED]);
        } else {
            // Default: show all recent submissions
            $collector->filterByStatus([
                \PKP\submission\PKPSubmission::STATUS_QUEUED,
                \PKP\submission\PKPSubmission::STATUS_DECLINED,
                \PKP\submission\PKPSubmission::STATUS_SCHEDULED,
                \PKP\submission\PKPSubmission::STATUS_PUBLISHED
            ]);
        }
        
        // Get total count for pagination
        $totalSubmissions = $collector->getCount();
        $totalPages = max(1, ceil($totalSubmissions / $itemsPerPage));
        
        // Ensure current page is within bounds
        if ($currentPage > $totalPages) {
            $currentPage = $totalPages;
        }
        
        // Calculate offset
        $offset = ($currentPage - 1) * $itemsPerPage;
        
        // Get submissions with pagination
        $submissions = $collector
            ->limit($itemsPerPage)
            ->offset($offset)
            ->orderBy(\APP\submission\Collector::ORDERBY_DATE_SUBMITTED, 'DESC')
            ->getMany();
        
        // Format submissions for template
        $latestSubmissions = [];
        foreach ($submissions as $submission) {
            $publication = $submission->getCurrentPublication();
            if (!$publication) continue;
            
            $authorString = '';
            if ($publication->getData('authors')) {
                $authors = $publication->getData('authors');
                if (is_array($authors) && count($authors) > 0) {
                    $authorString = $authors[0]->getFullName();
                    if (count($authors) > 1) {
                        $authorString .= ' et al.';
                    }
                }
            }
            
            $statusMap = [
                \PKP\submission\PKPSubmission::STATUS_QUEUED => 'In Review',
                \PKP\submission\PKPSubmission::STATUS_DECLINED => 'Rejected',
                \PKP\submission\PKPSubmission::STATUS_SCHEDULED => 'Accepted',
                \PKP\submission\PKPSubmission::STATUS_PUBLISHED => 'Published',
            ];
            
            $latestSubmissions[] = [
                'id' => $submission->getId(),
                'title' => $publication->getLocalizedTitle() ?: 'Untitled',
                'author' => $authorString ?: 'Unknown',
                'status' => $statusMap[$submission->getData('status')] ?? 'Unknown',
            ];
        }

        // Generate page numbers array (show max 5 pages)
        $pageNumbers = [];
        $maxPagesToShow = 5;
        $halfRange = floor($maxPagesToShow / 2);
        
        $startPage = max(1, $currentPage - $halfRange);
        $endPage = min($totalPages, $startPage + $maxPagesToShow - 1);
        
        // Adjust start if we're near the end
        if ($endPage - $startPage < $maxPagesToShow - 1) {
            $startPage = max(1, $endPage - $maxPagesToShow + 1);
        }
        
        for ($i = $startPage; $i <= $endPage; $i++) {
            $pageNumbers[] = $i;
        }
        
        // Calculate display indices
        $startIndex = $offset + 1;
        $endIndex = min($offset + $itemsPerPage, $totalSubmissions);

        $templateMgr->assign([
            'pageTitle' => __('navigation.dashboard'),
            'stats' => [
                'underReview' => $underReviewCount,
                'rejectedArticles' => $rejectedCount,
                'acceptedArticles' => $scheduledCount,
                'publishedArticles' => $publishedCount,
            ],
            'latestSubmissions' => $latestSubmissions,
            'activeFilter' => $filterStatus,
            'currentPage' => $currentPage,
            'totalPages' => $totalPages,
            'totalSubmissions' => $totalSubmissions,
            'pageNumbers' => $pageNumbers,
            'startIndex' => $startIndex,
            'endIndex' => $endIndex,
        ]);

        $templateMgr->display('main/index.tpl');
    }
}

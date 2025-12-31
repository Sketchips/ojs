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
use APP\facades\Repo;
use PKP\security\authorization\SubmissionAccessPolicy;
use PKP\security\authorization\UserRequiredPolicy;
use PKP\security\Role;
use PKP\db\DAORegistry;

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

    // Get current user and check if admin/manager
    $user = $request->getUser();
    $userId = $user->getId();
    
    // Check if user has admin/manager role using Repo
    $userGroups = Repo::userGroup()->userUserGroups($userId, $context->getId());
    $isAdminOrManager = false;
    
    foreach ($userGroups as $userGroup) {
        if (in_array($userGroup->getRoleId(), [Role::ROLE_ID_SITE_ADMIN, Role::ROLE_ID_MANAGER])) {
            $isAdminOrManager = true;
            break;
        }
    }

    // Get filter parameter and page number
    $filterStatus = $request->getUserVar('filter');
    $currentPage = max(1, (int) $request->getUserVar('page'));
    $itemsPerPage = 5;
    
    // Count submissions by status
    $contextId = (int) $context->getId();
    
    // Build collector with user filter if not admin
    $buildCollector = function() use ($contextId, $userId, $isAdminOrManager) {
        $collector = \APP\facades\Repo::submission()->getCollector()
            ->filterByContextIds([$contextId]);
        
        // Non-admin users only see submissions where they are authors OR assigned
        if (!$isAdminOrManager) {
            // Use assignedTo which checks stage assignments, editorial assignments, and authorship
            $collector->assignedTo([$userId]);
        }
        
        return $collector;
    };        // Under Review (STATUS_QUEUED and in review stages)
        $underReviewCount = $buildCollector()
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_QUEUED])
            ->getCount();
        
        // Declined/Rejected
        $rejectedCount = $buildCollector()
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_DECLINED])
            ->getCount();
        
        // Published
        $publishedCount = $buildCollector()
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_PUBLISHED])
            ->getCount();
        
        // Scheduled (Accepted - waiting to be published)
        $scheduledCount = $buildCollector()
            ->filterByStatus([\PKP\submission\PKPSubmission::STATUS_SCHEDULED])
            ->getCount();

        // Get submissions based on filter
        $collector = $buildCollector();
        
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
        
        // Get submissions with pagination (ordered by last activity for most recent updates)
        $submissions = $collector
            ->limit($itemsPerPage)
            ->offset($offset)
            ->orderBy(\APP\submission\Collector::ORDERBY_LAST_ACTIVITY, 'DESC')
            ->getMany();
        
        // Format submissions for template
        $latestSubmissions = [];
        foreach ($submissions as $submission) {
            $publication = $submission->getCurrentPublication();
            if (!$publication) continue;
            
            // Get authors info
            $authorString = '';
            $authorCount = 0;
            $contributorsString = '-';
            
            $authors = $publication->getData('authors');
            if ($authors) {
                // Handle both array and Collection/LazyCollection
                $authorsArray = [];
                if (is_array($authors)) {
                    $authorsArray = $authors;
                } elseif (is_object($authors)) {
                    // It's a Collection or LazyCollection
                    foreach ($authors as $author) {
                        $authorsArray[] = $author;
                    }
                }
                
                if (count($authorsArray) > 0) {
                    $authorCount = count($authorsArray);
                    $authorString = $authorsArray[0]->getFullName();
                    
                    // Get all contributors (all authors)
                    $contributorNames = [];
                    foreach ($authorsArray as $author) {
                        $contributorNames[] = $author->getFullName();
                    }
                    $contributorsString = implode(', ', $contributorNames);
                }
            }
            
            // Get assigned reviewers
            $reviewerString = '-';
            $reviewAssignmentDao = DAORegistry::getDAO('ReviewAssignmentDAO');
            $reviewAssignments = $reviewAssignmentDao->getBySubmissionId($submission->getId());
            
            if (!empty($reviewAssignments)) {
                $reviewerNames = [];
                foreach ($reviewAssignments as $reviewAssignment) {
                    $reviewer = \APP\facades\Repo::user()->get($reviewAssignment->getReviewerId());
                    if ($reviewer) {
                        $reviewerNames[] = $reviewer->getFullName();
                    }
                }
                if (!empty($reviewerNames)) {
                    $reviewerString = implode(', ', array_slice($reviewerNames, 0, 2));
                    if (count($reviewerNames) > 2) {
                        $reviewerString .= ' +' . (count($reviewerNames) - 2);
                    }
                }
            }
            
            $statusMap = [
                \PKP\submission\PKPSubmission::STATUS_QUEUED => 'In Review',
                \PKP\submission\PKPSubmission::STATUS_DECLINED => 'Rejected',
                \PKP\submission\PKPSubmission::STATUS_SCHEDULED => 'Accepted',
                \PKP\submission\PKPSubmission::STATUS_PUBLISHED => 'Published',
            ];
            
            // Format submission date
            $dateSubmitted = $submission->getData('dateSubmitted');
            $dateSubmittedFormatted = '-';
            if ($dateSubmitted) {
                $date = new \DateTime($dateSubmitted);
                $dateSubmittedFormatted = $date->format('d M Y');
            }
            
            $latestSubmissions[] = [
                'id' => $submission->getId(),
                'title' => $publication->getLocalizedTitle() ?: 'Untitled',
                'author' => $authorString ?: 'Unknown',
                'authorCount' => $authorCount,
                'contributors' => $contributorsString,
                'dateSubmitted' => $dateSubmittedFormatted,
                'reviewer' => $reviewerString,
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

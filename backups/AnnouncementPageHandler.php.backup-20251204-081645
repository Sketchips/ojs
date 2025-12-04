<?php

/**
 * @file pages/announcement/AnnouncementPageHandler.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class AnnouncementPageHandler
 *
 * @ingroup pages_announcement
 *
 * @brief Handle requests for announcement page.
 */

namespace APP\pages\announcement;

use APP\core\Application;
use APP\facades\Repo;
use APP\handler\Handler;
use APP\template\TemplateManager;
use PKP\announcement\Collector;
use PKP\security\authorization\ContextRequiredPolicy;

class AnnouncementPageHandler extends Handler
{
    /**
     * @see PKPHandler::authorize()
     */
    public function authorize($request, &$args, $roleAssignments)
    {
        $this->addPolicy(new ContextRequiredPolicy($request));
        return parent::authorize($request, $args, $roleAssignments);
    }

    /**
     * Display announcements page.
     *
     * @param array $args
     * @param \PKP\core\PKPRequest $request
     */
    public function index($args, $request)
    {
        $templateMgr = TemplateManager::getManager($request);
        $this->setupTemplate($request);
        $context = $request->getContext();
        
        // Fetch announcements using Repo facade
        $collector = Repo::announcement()
            ->getCollector()
            ->filterByActive();
        
        if ($context) {
            $announcementsEnabled = $context->getData('enableAnnouncements');
            $templateMgr->assign('announcementsEnabled', $announcementsEnabled);
            $collector->filterByContextIds([$context->getId()]);
            
            // Get announcements introduction text
            $announcementsIntroduction = $context->getLocalizedData('announcementsIntroduction');
            $templateMgr->assign('announcementsIntroduction', $announcementsIntroduction);
        } else {
            $collector->withSiteAnnouncements(Collector::SITE_ONLY);
        }
        
        $announcements = $collector->getMany();
        $templateMgr->assign('announcements', $announcements->toArray());
        
        $templateMgr->display('frontend/pages/announcements.tpl');
    }

    /**
     * View announcement details.
     *
     * @param array $args first parameter is the ID of the announcement to display
     * @param \PKP\core\PKPRequest $request
     */
    public function view($args, $request)
    {
        $this->setupTemplate($request);
        $context = $request->getContext();

        $announcementId = (int) array_shift($args);
        $announcement = Repo::announcement()->get($announcementId);
        
        if (
            $announcement
            && $announcement->getAssocType() == Application::getContextAssocType()
            && $announcement->getAssocId() == $context?->getId()
            && (
                $announcement->getDateExpire() == null || strtotime($announcement->getDateExpire()) > time()
            )
        ) {
            $templateMgr = TemplateManager::getManager($request);
            $templateMgr->assign('announcement', $announcement);
            $templateMgr->assign('announcementTitle', $announcement->getLocalizedTitleFull());
            return $templateMgr->display('frontend/pages/announcement.tpl');
        }
        
        $request->redirect(null, 'announcement');
    }
}

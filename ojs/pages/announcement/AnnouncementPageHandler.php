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

use APP\handler\Handler;
use APP\template\TemplateManager;
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
        
        // Get announcements from the context
        if ($context) {
            $announcementsEnabled = $context->getData('enableAnnouncements');
            $templateMgr->assign('announcementsEnabled', $announcementsEnabled);
        }
        
        $templateMgr->display('frontend/pages/announcements.tpl');
    }
}

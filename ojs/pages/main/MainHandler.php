<?php

/**
 * @file pages/main/MainHandler.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class MainHandler
 *
 * @ingroup pages_main
 *
 * @brief Handle requests for main dashboard page.
 */

namespace APP\pages\main;

use APP\core\Application;
use APP\handler\Handler;
use APP\template\TemplateManager;
use PKP\core\PKPRequest;
use PKP\security\authorization\PKPSiteAccessPolicy;
use PKP\security\Role;

class MainHandler extends Handler
{
    /** @copydoc PKPHandler::_isBackendPage */
    public $_isBackendPage = true;

    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();

        $this->addRoleAssignment(
            [Role::ROLE_ID_SITE_ADMIN, Role::ROLE_ID_MANAGER, Role::ROLE_ID_SUB_EDITOR, Role::ROLE_ID_ASSISTANT, Role::ROLE_ID_REVIEWER, Role::ROLE_ID_AUTHOR],
            ['index']
        );
    }

    /**
     * @copydoc PKPHandler::authorize()
     */
    public function authorize($request, &$args, $roleAssignments)
    {
        $this->addPolicy(new PKPSiteAccessPolicy($request, null, $roleAssignments));
        return parent::authorize($request, $args, $roleAssignments);
    }

    /**
     * Display the main dashboard page
     *
     * @param array $args
     * @param PKPRequest $request
     */
    public function index($args, $request)
    {
        $context = $request->getContext();

        if (!$context) {
            $request->redirect(null, 'user');
        }

        $this->setupTemplate($request);
        $templateMgr = TemplateManager::getManager($request);
        
        // Assign any necessary template variables here
        $templateMgr->assign([
            'pageTitle' => __('navigation.dashboard'),
        ]);

        return $templateMgr->display('main/index.tpl');
    }
}

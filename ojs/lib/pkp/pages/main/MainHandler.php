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

class MainHandler extends PKPHandler {

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
    public function index($args, $request) {
        $this->setupTemplate($request);
        $templateMgr = TemplateManager::getManager($request);

        // Data dummy
        $templateMgr->assign([
            'pageTitle' => __('navigation.dashboard'),
            'stats' => [
                'publishedArticles' => 12,
                'myQueue' => 4,
                'archivedArticles' => 7,
            ],
            'latestSubmissions' => [
                [
                    'title' => 'Analisis Tren Digitalisasi Pelayanan Publik di Indonesia',
                    'author' => 'BRIDA',
                    'status' => 'In Review',
                ],
                [
                    'title' => 'Pengembangan Model Ekowisata Berbasis Komunitas Lokal',
                    'author' => 'BRIDA',
                    'status' => 'Awaiting Assignment',
                ],
                [
                    'title' => 'Studi Komparatif Implementasi Kebijakan Energi Terbarukan',
                    'author' => 'BRIDA',
                    'status' => 'Published',
                ],
                [
                    'title' => 'Pemanfaatan Data Besar untuk Perencanaan Tata Ruang Kota',
                    'author' => 'BRIDA',
                    'status' => 'Rejected',
                ],
                [
                    'title' => 'Dampak Perubahan Iklim Terhadap Ketahanan Pangan Wilayah Pesisir',
                    'author' => 'BRIDA',
                    'status' => 'Editing',
                ],
            ],
        ]);

        $templateMgr->display('main/index.tpl');
    }
}

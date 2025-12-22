<?php
/**
 * @file classes/components/form/context/MastheadForm.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class MastheadForm
 *
 * @ingroup classes_controllers_form
 *
 * @brief Add OJS-specific fields to the masthead form.
 */

namespace APP\components\forms\context;

use PKP\components\forms\context\PKPMastheadForm;
use PKP\components\forms\FieldText;

class MastheadForm extends PKPMastheadForm
{
    /**
     * @copydoc PKPMastheadForm::__construct()
     */
    public function __construct($action, $locales, $context, $imageUploadUrl)
    {
        parent::__construct($action, $locales, $context, $imageUploadUrl);

        // Import FieldRichTextarea untuk field peer review
        // Field ini sudah ada di parent class PKPMastheadForm
        
        $this->addField(new FieldText('abbreviation', [
            'label' => __('manager.setup.journalAbbreviation'),
            'isMultilingual' => true,
            'groupId' => 'identity',
            'value' => $context->getData('abbreviation'),
        ]))
            ->addField(new FieldText('publisherInstitution', [
                'label' => __('manager.setup.publisher'),
                'groupId' => 'publishing',
                'value' => $context->getData('publisherInstitution'),
            ]))
            ->addField(new FieldText('publisherUrl', [
                'label' => __('common.url'),
                'groupId' => 'publishing',
                'value' => $context->getData('publisherUrl'),
            ]))
            ->addField(new FieldText('onlineIssn', [
                'label' => __('manager.setup.onlineIssn'),
                'size' => 'small',
                'groupId' => 'publishing',
                'value' => $context->getData('onlineIssn'),
            ]))
            ->addField(new FieldText('printIssn', [
                'label' => __('manager.setup.printIssn'),
                'size' => 'small',
                'groupId' => 'publishing',
                'value' => $context->getData('printIssn'),
            ]))
            ->addField(new \PKP\components\forms\FieldRichTextarea('peerReviewProcess', [
                'label' => __('manager.setup.peerReviewProcess'),
                'description' => __('manager.setup.peerReviewProcess.description'),
                'isMultilingual' => true,
                'size' => 'large',
                'groupId' => 'about',
                'toolbar' => 'bold italic superscript subscript | link | blockquote bullist numlist | image | code',
                'plugins' => 'paste,link,lists,image,code',
                'uploadUrl' => $imageUploadUrl,
                'value' => $context->getData('peerReviewProcess'),
            ]))
            ->addField(new \PKP\components\forms\FieldRichTextarea('focusAndScope', [
                'label' => __('manager.setup.focusAndScope'),
                'description' => __('manager.setup.focusAndScope.description'),
                'isMultilingual' => true,
                'size' => 'large',
                'groupId' => 'about',
                'toolbar' => 'bold italic superscript subscript | link | blockquote bullist numlist | image | code',
                'plugins' => 'paste,link,lists,image,code',
                'uploadUrl' => $imageUploadUrl,
                'value' => $context->getData('focusAndScope'),
            ]))
            ->addField(new \PKP\components\forms\FieldRichTextarea('sectionPolicies', [
                'label' => __('manager.setup.sectionPolicies'),
                'description' => __('manager.setup.sectionPolicies.description'),
                'isMultilingual' => true,
                'size' => 'large',
                'groupId' => 'about',
                'toolbar' => 'bold italic superscript subscript | link | blockquote bullist numlist | image | code',
                'plugins' => 'paste,link,lists,image,code',
                'uploadUrl' => $imageUploadUrl,
                'value' => $context->getData('sectionPolicies'),
            ]));
    }
}

<?php
/**
 * @file classes/components/form/context/AppearanceAdvancedForm.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class AppearanceAdvancedForm
 *
 * @ingroup classes_controllers_form
 *
 * @brief A preset form for general website appearance setup, such as uploading
 *  a logo.
 */

namespace APP\components\forms\context;

use PKP\components\forms\context\PKPAppearanceAdvancedForm;
use PKP\components\forms\FieldUpload;
use PKP\components\forms\FieldText;
use PKP\components\forms\FieldHTML;
use PKP\components\forms\FieldColor;

class AppearanceAdvancedForm extends PKPAppearanceAdvancedForm
{
    /**
     * @copydoc PKPAppearanceAdvancedForm::__construct()
     */
    public function __construct($action, $locales, $context, $baseUrl, $temporaryFileApiUrl, $imageUploadUrl)
    {
        parent::__construct($action, $locales, $context, $baseUrl, $temporaryFileApiUrl, $imageUploadUrl);

        // Instruction for downloadable files
        $this->addField(new FieldHTML('downloadableFilesInstruction', [
            'label' => 'Downloadable Files',
            'description' => '<div class="alert alert-info">
                <strong>How to add downloadable files:</strong>
                <ol>
                    <li>Upload each file below with a custom name</li>
                    <li>Files will be displayed 2 per row on the homepage</li>
                    <li>You can upload up to 6 files (3 rows)</li>
                </ol>
            </div>',
        ]));
        
        // Add multiple PDF upload fields
        for ($i = 1; $i <= 6; $i++) {
            $fieldName = 'downloadFile' . $i;
            $fieldNameLabel = 'downloadFile' . $i . 'Name';
            $fieldColorLabel = 'downloadFile' . $i . 'Color';
            
            $fileData = $context->getData($fieldName);
            $fileName = $context->getData($fieldNameLabel);
            $fileColor = $context->getData($fieldColorLabel) ?: '#27AE60';
            
            $this->addField(new FieldText($fieldNameLabel, [
                'label' => "File {$i} - Display Name",
                'description' => 'Enter a custom name for this file (e.g., "Pedoman Author")',
                'value' => $fileName ?: '',
            ]));
            
            $this->addField(new FieldColor($fieldColorLabel, [
                'label' => "File {$i} - Button Color",
                'description' => 'Pick a color for the button',
                'value' => $fileColor,
            ]));
            
            $this->addField(new FieldUpload($fieldName, [
                'label' => "File {$i} - Document File",
                'description' => 'Upload document file (PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX)',
                'value' => $fileData,
                'options' => [
                    'url' => $temporaryFileApiUrl,
                    'acceptedFiles' => '.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx',
                ],
            ]));
        }
    }
}

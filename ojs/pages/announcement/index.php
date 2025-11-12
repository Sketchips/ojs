<?php

/**
 * @file pages/announcement/index.php
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @ingroup pages_announcement
 *
 * @brief Handle requests for announcement page
 *
 */

switch ($op) {
    case 'index':
    default:
        return new APP\pages\announcement\AnnouncementPageHandler();
}

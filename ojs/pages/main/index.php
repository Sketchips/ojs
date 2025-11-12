<?php

/**
 * @defgroup pages_main Main
 * Handle requests for the main page
 */

/**
 * @file pages/main/index.php
 *
 * Handle requests for the main page operations.
 */

switch ($op) {
    case 'index':
    default:
        return new APP\pages\main\MainHandler();
}

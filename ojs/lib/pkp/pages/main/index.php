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

require('MainHandler.php');
return new \PKP\pages\main\MainHandler();

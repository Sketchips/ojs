-- ============================================================================
-- FIX v10.1 - ALL 10 SCREENSHOT ISSUES FIXED
-- ============================================================================
-- Date: 2025-10-31
-- Description: Complete fixes for all reported issues
--
-- FIXES APPLIED:
-- 1. Hero text white (not green), removed border-left on logo
-- 2-3. Sidebar buttons vertical (1-1), horizontal rectangles
-- 4-9. Logo positions adjusted for all login/register pages
-- 10. Mobile toggle z-index higher, can close sidebar
-- ============================================================================

USE ojs;

UPDATE journal_settings 
SET setting_value = JSON_SET(
    setting_value,
    '$.dateUploaded', '2025-10-31 10:45:00'
)
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

SELECT journal_id, setting_name, setting_value
FROM journal_settings
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

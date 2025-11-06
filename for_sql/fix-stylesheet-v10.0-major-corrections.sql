-- ============================================================================
-- FIX v10.0 - MAJOR CORRECTIONS
-- ============================================================================
-- Date: 2025-10-31
-- Description: Complete revert and proper fixes
--
-- FIXES APPLIED:
-- 1. REVERT login page (don't touch login, only register)
-- 2. Fix about.tpl (remove breadcrumbs, duplicates, columns)
-- 3. Fix description containers (remove Bootstrap constraints)
-- 4. Ensure JavaScript loads (modern-ojs-theme.js)
-- 5. Fix navbar toggle positioning
-- ============================================================================

USE ojs;

-- Update styleSheet.css metadata dengan timestamp baru
UPDATE journal_settings 
SET setting_value = JSON_SET(
    setting_value,
    '$.dateUploaded', '2025-10-31 10:35:00'
)
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

-- Verify update
SELECT 
    journal_id,
    setting_name,
    setting_value
FROM journal_settings
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

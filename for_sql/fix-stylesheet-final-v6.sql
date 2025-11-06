-- ============================================================================
-- UPDATE STYLESHEET METADATA - Final Fixes v6.0
-- ============================================================================
-- Login/Register logo position, Toggle button z-index, Description flexbox
-- Date: 2025-10-30
-- ============================================================================

USE ojs;

-- Update styleSheet.css metadata
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 13:25:00"}'
WHERE journal_id = 1 
  AND setting_name = 'styleSheet';

-- Verify the update
SELECT journal_id, setting_name, setting_value 
FROM journal_settings 
WHERE journal_id = 1 AND setting_name = 'styleSheet';

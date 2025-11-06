-- ============================================================================
-- UPDATE STYLESHEET METADATA - Complete Fix v8.0
-- ============================================================================
-- Description layout fix, About page template, Logo positions, Mobile header
-- Date: 2025-10-31
-- ============================================================================

USE ojs;

-- Update styleSheet.css metadata
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-31 08:50:00"}'
WHERE journal_id = 1 
  AND setting_name = 'styleSheet';

-- Verify the update
SELECT journal_id, setting_name, setting_value 
FROM journal_settings 
WHERE journal_id = 1 AND setting_name = 'styleSheet';

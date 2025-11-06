-- ============================================================================
-- UPDATE STYLESHEET METADATA - Final Fixes v7.0
-- ============================================================================
-- Description horizontal layout, About page fix, Logo positions, Button positions
-- Date: 2025-10-31
-- ============================================================================

USE ojs;

-- Update styleSheet.css metadata
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-31 09:00:00"}'
WHERE journal_id = 1 
  AND setting_name = 'styleSheet';

-- Verify the update
SELECT journal_id, setting_name, setting_value 
FROM journal_settings 
WHERE journal_id = 1 AND setting_name = 'styleSheet';

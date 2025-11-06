-- ============================================================================
-- UPDATE STYLESHEET METADATA - Figma Design Match v5.0
-- ============================================================================
-- Update CSS metadata for OJS to load new Figma-matched design
-- Date: 2025-10-30
-- ============================================================================

-- Removed the USE statement because some SQL dialects (e.g., PostgreSQL) do not support it;
-- ensure you are connected to the 'ojs' database/schema before running this script or
-- fully qualify the table name (e.g., ojs.journal_settings) if needed.
-- USE ojs;

-- Update styleSheet.css metadata
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 12:50:00"}'
WHERE journal_id = 1 
  AND setting_name = 'styleSheet';

-- Verify the update
SELECT journal_id, setting_name, setting_value 
FROM journal_settings 
WHERE journal_id = 1 AND setting_name = 'styleSheet';

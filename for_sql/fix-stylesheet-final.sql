-- Fix stylesheet metadata in database
-- This updates the journal_settings table with proper JSON metadata
-- so OJS can load the CSS file that was uploaded

UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:12:58"}' 
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

-- Verify the update
SELECT journal_id, setting_name, setting_value 
FROM journal_settings 
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

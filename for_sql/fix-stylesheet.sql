-- Fix styleSheet database entry
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:00:00"}' 
WHERE journal_id = 1 AND setting_name = 'styleSheet';

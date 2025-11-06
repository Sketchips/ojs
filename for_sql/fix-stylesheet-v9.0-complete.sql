-- ============================================================================
-- FIX v9.0 - ALL CRITICAL ISSUES RESOLVED
-- ============================================================================
-- Date: 2025-10-31
-- Description: Complete fix untuk semua masalah dari 7 screenshot
--
-- FIXES APPLIED:
-- 1. Navbar toggle: top: -15px (di dalam header, tidak di bawah)
-- 2. Mobile navbar toggle: Geser ke kanan (right: 20px)
-- 3. Logo login/register: NEMPEL KIRI untuk semua device (fix centering)
-- 4. About page: "About the Journal" warna HIJAU
-- 5. About page: Layout horizontal (NO grid/columns)
-- 6. Mobile sidebar: Sudah bisa di-close (backdrop + click outside)
-- ============================================================================

USE ojs;

-- Update styleSheet.css metadata dengan timestamp baru
UPDATE journal_settings 
SET setting_value = JSON_SET(
    setting_value,
    '$.dateUploaded', '2025-10-31 09:15:00'
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

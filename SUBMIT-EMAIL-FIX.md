# Submit Error Fix - Email Exception Handling
**Date**: 2025-11-20 12:17  
**Issue**: Popup error muncul saat klik Submit button pertama kali (walau submission berhasil)

## Problem Identified

### Root Cause
Submit pertama trigger error popup karena email notification gagal kirim dan exception tidak di-handle dengan baik, menyebabkan API response corrupt atau error.

**Evidence dari logs:**
```
04:56:17 - POST /submit → 200 OK 380 bytes (response kecil, tanpa email)
04:56:40 - [php:notice] Connection to "process /usr/sbin/sendmail -bs" has been closed unexpectedly
04:56:34 - POST /submit → 200 OK 3374 bytes (response lengkap dengan email notification)
04:58:24 - POST /submit → 400 Bad Request (validation: already submitted)
```

Response 380 bytes pada submit pertama menunjukkan email acknowledgement **gagal dikirim**, dan exception dari Mail facade **tidak di-catch**, menyebabkan error response yang ditampilkan sebagai popup error di frontend.

### Technical Details

**File**: `ojs/lib/pkp/classes/observers/listeners/SendSubmissionAcknowledgement.php`

**Problem Code** (lines 63-84):
```php
if ($submitterUsers->count()) {
    $mailable = $this->getSubmitterMailable($event, $submitterUsers);
    
    // Setup recipients...
    
    Mail::send($mailable);  // ❌ NO TRY-CATCH - throws exception on sendmail failure
    
    $logDao = DAORegistry::getDAO('SubmissionEmailLogDAO');
    $logDao->logMailable(...);
}
```

When sendmail fails (connection timeout, process crash, config error), `Mail::send()` throws exception that bubbles up and corrupts API JSON response.

## Solution Applied

### Changes Made

1. **Added try-catch around email sending** (2 locations):
   - Line 75: Wrap `Mail::send()` untuk submitter users
   - Line 110: Wrap `Mail::send()` untuk other authors

2. **Added null coalescing** untuk `copySubmissionAckAddress`:
   ```php
   $emails = explode(',', trim($event->context->getData('copySubmissionAckAddress') ?? ''));
   ```

3. **Graceful error handling**:
   - Email failures log error tapi **tidak break submission process**
   - Submission tetap berhasil saved dan status di-update
   - User tidak lihat error popup
   - Admin bisa lihat error di error log untuk troubleshoot email config

### Fixed Code

```php
try {
    Mail::send($mailable);
    
    /** @var SubmissionEmailLogDAO $logDao */
    $logDao = DAORegistry::getDAO('SubmissionEmailLogDAO');
    $logDao->logMailable(
        SubmissionEmailLogEntry::SUBMISSION_EMAIL_AUTHOR_SUBMISSION_ACK,
        $mailable,
        $event->submission
    );
} catch (\Exception $e) {
    // Log email error but don't break submission process
    error_log('Failed to send submission acknowledgement email: ' . $e->getMessage());
}
```

## Files Modified

| File | Backup | Changes |
|------|--------|---------|
| `ojs/lib/pkp/classes/observers/listeners/SendSubmissionAcknowledgement.php` | `backups/SendSubmissionAcknowledgement.php.backup-20251120-122000` | Added try-catch for both email sends + null coalescing fix |

## Testing Instructions

1. **Create NEW submission** (don't reuse existing submission ID)
2. Fill all required fields through wizard steps:
   - Details: title, abstract, keywords
   - Files: upload submission file
   - Contributors: add author info
   - For the Editors: add comments (optional)
   - Review: confirm all data
3. Click **Submit** button
4. **Expected**: 
   - ✅ No error popup appears
   - ✅ Success page shows immediately
   - ✅ Submission appears in dashboard with "Submitted" status
   - ⚠️ Email may fail silently (check logs: `docker-compose logs web | grep -i "failed to send"`)

## Related Fixes

This is the **third fix** in series of PHP 8.1 compatibility issues:

1. **Keyword Error Fix** (2025-11-20 11:42): `ControlledVocabEntryDAO.php` - fixed trim(null) in keyword autocomplete
2. **Submit Deprecated Warnings** (2025-11-20 11:52): Fixed 5 SubmissionDAO files (Keyword, Subject, Agency, Discipline, Language) - fixed trim(null) in vocab deletion
3. **Submit Email Exception** (2025-11-20 12:17): `SendSubmissionAcknowledgement.php` - wrapped email sending in try-catch

## Configuration Notes

If email notifications continue to fail, check:
- Sendmail configuration in container
- SMTP settings in `config.inc.php`
- Email templates in Journal Settings → Workflow → Emails
- Container logs: `docker-compose logs web | grep -i "mail\|sendmail"`

**Note**: Submission workflow will now complete successfully even if email fails - this is intentional design to prevent UX issues from email config problems.

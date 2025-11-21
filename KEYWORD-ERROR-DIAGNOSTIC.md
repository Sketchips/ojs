# Diagnostic Guide: Keyword Field Error on Submission Details

## Problem Summary
Error popup "An unexpected error has occurred. Please reload the page and try again" appears when clicking/typing in the Keywords field during submission process (Details step).

## Root Cause Analysis

### Identified Issue
The frontend Vue component `FieldControlledVocab` calls the API endpoint `/api/v1/vocabs?vocab=submissionKeyword` to fetch keyword suggestions. This API returns **403 Unauthorized** error, which triggers the generic error popup.

### Why 403 Unauthorized?

The API handler (`lib/pkp/api/v1/vocabs/PKPVocabHandler.php`) requires:
1. User must be logged in
2. User must have one of these roles: MANAGER, SITE_ADMIN, SUB_EDITOR, ASSISTANT, or **AUTHOR**
3. CSRF token must be valid in the request header

## Files Involved

### Backend
- `ojs/lib/pkp/api/v1/vocabs/PKPVocabHandler.php` - API handler for controlled vocabulary
- `ojs/lib/pkp/classes/components/forms/publication/Details.php` - Form builder that adds keyword field
- `ojs/lib/pkp/classes/security/authorization/UserRolesRequiredPolicy.php` - Authorization policy

### Frontend
- Vue component `FieldControlledVocab` (compiled in JS bundles)
- `ojs/lib/pkp/templates/submission/wizard.tpl` - Submission wizard template

## Diagnostic Steps

### Step 1: Check Browser Console
1. Open browser Developer Tools (F12)
2. Go to Console tab
3. Reproduce the error (click/type in Keywords field)
4. Look for:
   - Red error messages
   - Failed network requests to `/api/v1/vocabs`
   - Response status code (should be 403 or 401)

### Step 2: Check Network Tab
1. In Developer Tools, go to Network tab
2. Reproduce the error
3. Find the request to `/api/v1/vocabs?vocab=submissionKeyword`
4. Check:
   - Status code (403 = unauthorized, 401 = not authenticated)
   - Request headers (must include `X-CSRF-Token`)
   - Response body (should show error message)

### Step 3: Verify User Role
Run this SQL query to check if the user has AUTHOR role:

```sql
SELECT 
    u.user_id, 
    u.username, 
    ug.user_group_id,
    ugs.setting_value as role_name,
    c.journal_id as context_id
FROM users u
JOIN user_user_groups uug ON u.user_id = uug.user_id
JOIN user_groups ug ON uug.user_group_id = ug.user_group_id
JOIN user_group_settings ugs ON ug.user_group_id = ugs.user_group_id 
    AND ugs.setting_name = 'name' AND ugs.locale = 'en'
LEFT JOIN journals c ON ug.context_id = c.journal_id
WHERE u.username = 'YOUR_USERNAME';
```

Expected result: User should have a row with `role_name` = 'Author' or similar.

### Step 4: Check PHP Error Logs

```powershell
docker-compose logs --tail=100 web | Select-String -Pattern "vocabs|403|Unauthorized" -CaseSensitive:$false
```

## Solutions

### Solution 1: Ensure User Has Author Role
If user doesn't have AUTHOR role in the journal context:

1. Login as Manager/Admin
2. Go to Users & Roles > Users
3. Find the user
4. Click "Edit"
5. Assign "Author" role to the journal context

### Solution 2: Check CSRF Token Configuration
Ensure the application is passing CSRF token in AJAX requests.

Check `ojs/lib/pkp/js/load.js` or main JS initialization for:
```javascript
$.ajaxSetup({
    headers: {
        'X-Csrf-Token': pkp.currentUser.csrfToken
    }
});
```

### Solution 3: Session / Cookie Issues
If cookies are blocked or session expired:

1. Clear browser cookies for localhost:8080
2. Logout and login again
3. Try submission process immediately after login

### Solution 4: Extend API Authorization (If Needed)
If you want to allow unauthenticated keyword suggestions, modify:

**File**: `ojs/lib/pkp/api/v1/vocabs/PKPVocabHandler.php`

Change line 50 from:
```php
'roles' => [Role::ROLE_ID_MANAGER, Role::ROLE_ID_SITE_ADMIN, Role::ROLE_ID_SUB_EDITOR, Role::ROLE_ID_ASSISTANT, Role::ROLE_ID_AUTHOR],
```

To:
```php
'roles' => [Role::ROLE_ID_MANAGER, Role::ROLE_ID_SITE_ADMIN, Role::ROLE_ID_SUB_EDITOR, Role::ROLE_ID_ASSISTANT, Role::ROLE_ID_AUTHOR, Role::ROLE_ID_REVIEWER, Role::ROLE_ID_READER],
```

**⚠️ Warning**: This is not recommended for security reasons. Only apply if you understand the implications.

## Quick Test Command

Test the API endpoint directly (must be logged in via browser first, then get the cookie):

```powershell
# Get your session cookie from browser Developer Tools > Application > Cookies > OJSSID
# Then run:
$headers = @{
    "Cookie" = "OJSSID=YOUR_SESSION_ID_HERE"
}
Invoke-WebRequest -Uri "http://localhost:8080/index.php/jurnaladit/api/v1/vocabs?vocab=submissionKeyword&locale=en" -Headers $headers
```

Expected: HTTP 200 with JSON array of keywords.
If 403: User doesn't have required role or session is invalid.

## Recommended Fix for Production

The proper solution depends on the actual cause. Most common fixes:

1. **User Role Issue**: Assign AUTHOR role to users who need to submit
2. **Session Issue**: Ensure cookies are enabled and session is valid
3. **CSRF Token Issue**: Verify CSRF token is being sent in AJAX headers

## Testing After Fix

1. Clear browser cache and cookies
2. Login as a user with AUTHOR role
3. Start a new submission
4. On Details step, click in the Keywords field
5. Type a few letters
6. Should see autocomplete suggestions appear (or empty dropdown if no existing keywords)
7. No error popup should appear

## Need More Help?

If error persists after trying these solutions:
1. Capture full browser console log
2. Capture Network tab showing the failed API request
3. Run the diagnostic SQL query above
4. Share PHP error logs from container

---

**Document created**: 2025-11-20  
**OJS Version**: 3.4.0.9  
**Issue**: Keyword field error popup during submission

# 🚨 CRITICAL FIX - CSS UPLOAD VIA ADMIN PANEL ISSUE

**Date:** October 30, 2025  
**Status:** ✅ FIXED  
**Issue:** CSS tidak muncul setelah upload via Admin Panel

---

## 🔍 ROOT CAUSE ANALYSIS

### Masalah yang Terjadi:
1. ✅ File CSS **TER-UPLOAD** ke `ojs/public/journals/1/styleSheet.css`
2. ❌ Database metadata **TETAP KOSONG** `[]` setelah upload
3. ❌ OJS **TIDAK LOAD CSS** karena metadata requirement

### Kenapa Ini Terjadi?

OJS menggunakan **DUAL SYSTEM** untuk CSS loading:
```php
// File: ojs/lib/pkp/classes/template/PKPTemplateManager.php (line 237-244)
$contextStyleSheet = $currentContext->getData('styleSheet');
if ($contextStyleSheet) {
    // Load CSS dengan URL + timestamp
    $this->addStyleSheet(
        'contextStylesheet',
        $baseUrl . '/' . $contextPath . '/' . $contextStyleSheet['uploadName'] 
            . '?d=' . urlencode($contextStyleSheet['dateUploaded'])
    );
}
```

**Requirement:**
- ✅ File harus ada di filesystem
- ✅ **Database harus punya JSON metadata:**
  ```json
  {
    "uploadName": "styleSheet.css",
    "dateUploaded": "2025-10-30 09:12:58"
  }
  ```

**Jika database kosong `[]` → CSS TIDAK LOAD!**

---

## ✅ SOLUTION

### Step 1: Verify File Exists
```powershell
Get-ChildItem ojs/public/journals/1/styleSheet.css
```

**Output harus:**
```
Mode    LastWriteTime         Length Name
----    -------------         ------ ----
-a----  10/30/2025  9:12 AM   42347 styleSheet.css
```

### Step 2: Check Database
```powershell
docker-compose exec -T db mysql -uroot -proot ojs -e "SELECT setting_value FROM journal_settings WHERE journal_id = 1 AND setting_name = 'styleSheet';"
```

**Jika output `[]` → INI MASALAHNYA!**

### Step 3: Get File Timestamp
```powershell
(Get-Item ojs/public/journals/1/styleSheet.css).LastWriteTime
```

**Output contoh:**
```
Thursday, October 30, 2025 9:12:58 AM
```

### Step 4: Create SQL Fix
Create file `fix-stylesheet-upload.sql`:
```sql
-- Replace timestamp dengan timestamp file yang sebenarnya!
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:12:58"}' 
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

-- Verify
SELECT setting_value FROM journal_settings 
WHERE journal_id = 1 AND setting_name = 'styleSheet';
```

### Step 5: Execute Fix
```powershell
Get-Content fix-stylesheet-upload.sql | docker-compose exec -T db mysql -uroot -proot ojs
```

**Verify output:**
```
setting_value
{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:12:58"}
```

### Step 6: Clear Cache
```powershell
Remove-Item -Recurse -Force ojs\cache\* -ErrorAction SilentlyContinue
```

### Step 7: Restart Docker
```powershell
docker-compose restart
```

### Step 8: Clear Browser Cache
```
Ctrl + Shift + Delete
→ Clear Cached Images and Files
→ Clear Data
```

### Step 9: Hard Reload
```
Ctrl + F5
```

---

## 🔧 TROUBLESHOOTING

### Issue: Database Kembali ke `[]` Setelah Upload
**Cause:** OJS upload mechanism tidak properly set metadata  
**Solution:** Selalu jalankan SQL fix setelah upload via Admin Panel

### Issue: File Ter-Upload Tapi Metadata Kosong
**Cause:** File permissions atau upload handler issue  
**Solution:** 
1. Check file permissions: `docker-compose exec web ls -la /var/www/html/public/journals/1/`
2. Ensure directory writable
3. Run SQL fix manual

### Issue: CSS Loaded Tapi Tidak Apply
**Cause:** Different issue - CSS syntax error atau specificity problem  
**Solution:**
1. Check browser DevTools (F12) → Console for errors
2. Check Network tab → styleSheet.css status (should be 200 OK)
3. Validate CSS syntax

---

## 📊 DATABASE SCHEMA

### Table: `journal_settings`
```
journal_setting_id | journal_id | locale | setting_name | setting_value
------------------+------------+--------+--------------+---------------
82                | 1          |        | styleSheet   | {"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:12:58"}
```

**Key Fields:**
- `setting_name`: `'styleSheet'`
- `setting_value`: **MUST BE JSON** with:
  - `uploadName`: filename (biasanya `styleSheet.css`)
  - `dateUploaded`: timestamp format `YYYY-MM-DD HH:MM:SS`

**Invalid Values:**
- ❌ `[]` - Empty array
- ❌ `""` - Empty string
- ❌ `NULL` - Null value
- ✅ Valid: `{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:12:58"}`

---

## 🎯 PREVENTION

### Method 1: ALWAYS Use SQL Fix After Admin Upload
Setiap kali upload CSS via Admin Panel:
1. Upload file via Settings → Website → Appearance → Setup
2. **IMMEDIATELY** jalankan SQL fix
3. Restart Docker
4. Clear cache

### Method 2: Manual File + Database Update
Lebih reliable untuk production:
```powershell
# 1. Copy CSS file
Copy-Item journal-riptek-theme.css ojs\public\journals\1\styleSheet.css -Force

# 2. Get current timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 3. Update database
docker-compose exec -T db mysql -uroot -proot ojs -e "UPDATE journal_settings SET setting_value = '{\"uploadName\":\"styleSheet.css\",\"dateUploaded\":\"$timestamp\"}' WHERE journal_id = 1 AND setting_name = 'styleSheet';"

# 4. Clear cache + restart
Remove-Item -Recurse -Force ojs\cache\*
docker-compose restart
```

---

## 📝 COMPLETE FIX SCRIPT

Save as `fix-css-upload.ps1`:
```powershell
# Complete CSS Upload Fix Script
# Usage: .\fix-css-upload.ps1

Write-Host "🔍 Checking CSS file..." -ForegroundColor Yellow

# Check if file exists
if (Test-Path "ojs/public/journals/1/styleSheet.css") {
    $fileInfo = Get-Item "ojs/public/journals/1/styleSheet.css"
    Write-Host "✅ File found: $($fileInfo.Length) bytes" -ForegroundColor Green
    Write-Host "   Last modified: $($fileInfo.LastWriteTime)" -ForegroundColor Cyan
    
    # Get timestamp in MySQL format
    $timestamp = $fileInfo.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
    
    Write-Host "`n🔧 Updating database..." -ForegroundColor Yellow
    
    # Create SQL file
    $sqlContent = @"
UPDATE journal_settings 
SET setting_value = '{\"uploadName\":\"styleSheet.css\",\"dateUploaded\":\"$timestamp\"}' 
WHERE journal_id = 1 
AND setting_name = 'styleSheet';

SELECT setting_value FROM journal_settings 
WHERE journal_id = 1 AND setting_name = 'styleSheet';
"@
    
    $sqlContent | Out-File -FilePath "temp-fix.sql" -Encoding utf8
    
    # Execute SQL
    Get-Content temp-fix.sql | docker-compose exec -T db mysql -uroot -proot ojs
    
    # Clean up
    Remove-Item temp-fix.sql
    
    Write-Host "`n🧹 Clearing cache..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ojs\cache\* -ErrorAction SilentlyContinue
    
    Write-Host "🔄 Restarting Docker..." -ForegroundColor Yellow
    docker-compose restart
    
    Write-Host "`n✅ FIX COMPLETE!" -ForegroundColor Green
    Write-Host "   Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Clear browser cache (Ctrl + Shift + Delete)" -ForegroundColor White
    Write-Host "   2. Hard reload page (Ctrl + F5)" -ForegroundColor White
    Write-Host "   3. Check DevTools Network tab for styleSheet.css" -ForegroundColor White
    
} else {
    Write-Host "❌ Error: styleSheet.css not found!" -ForegroundColor Red
    Write-Host "   Expected location: ojs/public/journals/1/styleSheet.css" -ForegroundColor Yellow
}
```

**Usage:**
```powershell
.\fix-css-upload.ps1
```

---

## ✅ VERIFICATION CHECKLIST

After fix, verify these:

### 1. Database Check ✓
```powershell
docker-compose exec -T db mysql -uroot -proot ojs -e "SELECT setting_value FROM journal_settings WHERE setting_name = 'styleSheet';"
```
**Expected:** JSON object dengan uploadName dan dateUploaded

### 2. File Check ✓
```powershell
Test-Path ojs/public/journals/1/styleSheet.css
```
**Expected:** True

### 3. Browser Network Check ✓
1. Open DevTools (F12)
2. Network tab → Filter: CSS
3. Reload page (Ctrl + F5)
4. Look for: `styleSheet.css?d=2025-10-30%2009%3A12%3A58`
5. Status should be: **200 OK**
6. Size should match file size (~42KB)

### 4. Visual Check ✓
Website should show:
- ✅ Hero section dengan gradient hijau-biru
- ✅ Sidebar kiri dengan tombol hijau
- ✅ Custom fonts (Inria Serif, Poppins)
- ✅ Footer dengan gradient
- ✅ Horizontal description boxes

---

## 📌 SUMMARY

**The Problem:**
OJS upload via Admin Panel tidak properly set database metadata untuk stylesheet.

**The Solution:**
Manually update database dengan JSON metadata yang benar setelah setiap upload.

**The Prevention:**
Gunakan automation script atau selalu jalankan SQL fix setelah upload.

**Key Learning:**
OJS requires BOTH file existence AND database metadata untuk load custom CSS!

---

**Documentation created:** October 30, 2025  
**Last tested:** October 30, 2025  
**Status:** ✅ WORKING  
**Next review:** Check setelah user test

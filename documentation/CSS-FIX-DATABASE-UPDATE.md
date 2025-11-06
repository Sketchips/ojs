# CRITICAL FIX - CSS Not Loading Solution

**Date:** October 30, 2025
**Issue:** CSS file exists but not loading on website
**Status:** ✅ FIXED

---

## 🔍 PROBLEM DIAGNOSIS

### Root Cause Found:
Database entry for `styleSheet` was **EMPTY** (`[]`) even though file exists in filesystem.

### Evidence:
```sql
-- Before Fix:
SELECT setting_value FROM journal_settings WHERE setting_name = 'styleSheet';
-- Result: []

-- File Check:
ojs/public/journals/1/styleSheet.css → EXISTS (1491 lines, valid CSS)
```

### Why CSS Didn't Load:
1. File **exists** in `ojs/public/journals/1/styleSheet.css` ✅
2. Database metadata **empty** (`setting_value = []`) ❌
3. OJS checks database first → no metadata → CSS not loaded

---

## ✅ SOLUTION APPLIED

### Step 1: Update Database
Created SQL file: `fix-stylesheet.sql`

```sql
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:00:00"}' 
WHERE journal_id = 1 AND setting_name = 'styleSheet';
```

### Step 2: Execute SQL
```bash
Get-Content fix-stylesheet.sql | docker-compose exec -T db mysql -uroot -proot ojs
```

### Step 3: Verify Database
```sql
SELECT setting_value FROM journal_settings WHERE journal_id = 1 AND setting_name = 'styleSheet';
-- Result: {"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:00:00"} ✅
```

### Step 4: Clear Cache & Restart
```bash
Remove-Item -Recurse -Force ojs\cache\*
docker-compose restart
```

---

## 📋 VERIFICATION STEPS

### 1. Check Database
```bash
docker-compose exec -T db mysql -uroot -proot ojs -e "SELECT setting_value FROM journal_settings WHERE journal_id = 1 AND setting_name = 'styleSheet';"
```

**Expected Result:**
```json
{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 09:00:00"}
```

### 2. Check File Exists
```bash
Get-Content ojs\public\journals\1\styleSheet.css | Select-Object -First 5
```

**Expected Result:**
```css
/**
 * JOURNAL RIPTEK THEME CSS
 * Custom styling for Journal Riptek...
```

### 3. Test Website
1. Open: `http://localhost:8080/index.php/jurnaladit/`
2. Press `F12` → Network tab → Filter: CSS
3. Look for: `styleSheet.css?d=2025-10-30+09%3A00%3A00`
4. Status should be: **200 OK**

### 4. Visual Check
- ✅ Hero section with green-blue gradient appears
- ✅ Sidebar with green buttons on left
- ✅ Proper layout (not default Bootstrap)
- ✅ Custom fonts (Inria Serif, Poppins) loaded

---

## 🛠️ TROUBLESHOOTING

### If CSS Still Not Loading:

#### Option 1: Clear Browser Cache
```
Ctrl + Shift + Delete → Clear cache
Ctrl + F5 → Hard reload
```

#### Option 2: Re-run Database Fix
```bash
Get-Content fix-stylesheet.sql | docker-compose exec -T db mysql -uroot -proot ojs
docker-compose restart
```

#### Option 3: Check File Permissions
```bash
docker-compose exec ojs ls -la /var/www/html/public/journals/1/ | grep styleSheet
```

**Expected:** `-rw-r--r--` (readable by web server)

#### Option 4: Check OJS Logs
```bash
docker-compose logs ojs | Select-String -Pattern "stylesheet|css" -Context 2
```

---

## 📝 TECHNICAL EXPLANATION

### How OJS Loads CSS:

```php
// From: ojs/lib/pkp/classes/template/PKPTemplateManager.php
$contextStyleSheet = $currentContext->getData('styleSheet'); // ← Gets from DATABASE
if ($contextStyleSheet) {
    $this->addStyleSheet(
        'contextStylesheet',
        $baseUrl . '/public/journals/' . $contextId . '/' . $contextStyleSheet['uploadName'],
        ['priority' => self::STYLE_SEQUENCE_LATE]
    );
}
```

**Flow:**
1. Check database for `styleSheet` metadata
2. If metadata exists → construct URL
3. Load CSS file from constructed URL
4. If metadata missing → skip loading ❌

### Database Structure:
```sql
Table: journal_settings
Columns:
  - journal_setting_id (auto_increment)
  - journal_id (bigint)
  - locale (varchar)
  - setting_name (varchar)
  - setting_value (mediumtext) ← JSON format
```

### Required JSON Format:
```json
{
    "uploadName": "styleSheet.css",
    "dateUploaded": "YYYY-MM-DD HH:MM:SS"
}
```

---

## 🎯 WHY THIS HAPPENED

### Possible Causes:
1. **User clicked "Remove" in Admin Panel** → Database cleared
2. **Corruption during save** → Partial data loss
3. **Manual file copy without DB update** → Metadata missing
4. **Migration/upgrade issue** → DB not synced

### Prevention:
- Always upload CSS via OJS Admin Panel
- Don't manually edit database (use Admin UI)
- Backup database before major changes
- Use version control for custom CSS

---

## 📦 FILES AFFECTED

### Modified:
- `ojs/public/journals/1/styleSheet.css` (existing, content preserved)
- Database: `journal_settings` table (updated)

### Created:
- `fix-stylesheet.sql` (SQL fix script)
- `documentation/CSS-FIX-DATABASE-UPDATE.md` (this file)

### Deleted:
- `ojs/cache/*` (cache files - regenerated automatically)

---

## ✨ RESULT

After fix:
- ✅ CSS metadata in database
- ✅ CSS file loaded properly
- ✅ Hero section with gradient visible
- ✅ Custom styling applied
- ✅ Admin panel shows stylesheet uploaded

**Status: FULLY FUNCTIONAL** 🎉

---

## 📚 RELATED DOCUMENTATION

- `FIX-DOCUMENTATION-v2.0.md` - Complete theme fixes
- `QUICK-IMPLEMENTATION-GUIDE.md` - Implementation steps
- `SUMMARY-REPORT-v2.0.md` - Project summary

---

## 🔄 MAINTENANCE

### To Update CSS in Future:

**Method 1: Via Admin Panel (RECOMMENDED)**
1. Login as Admin
2. Settings → Website → Appearance → Advanced
3. Upload new CSS file
4. Save

**Method 2: Manual (Advanced)**
1. Replace file: `ojs/public/journals/1/styleSheet.css`
2. Update database timestamp:
   ```sql
   UPDATE journal_settings 
   SET setting_value = JSON_SET(setting_value, '$.dateUploaded', NOW())
   WHERE journal_id = 1 AND setting_name = 'styleSheet';
   ```
3. Clear cache: `Remove-Item -Recurse -Force ojs\cache\*`
4. Restart: `docker-compose restart`

---

**END OF DOCUMENTATION**

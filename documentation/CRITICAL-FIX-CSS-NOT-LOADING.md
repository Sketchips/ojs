# 🚨 CRITICAL FIX - CSS Not Loading Issue

## ❌ MASALAH YANG DITEMUKAN

Setelah full scan, masalah utama adalah:

**File `styleSheet.css` ada di filesystem, tapi metadata TIDAK ADA di database!**

### Evidence:
```sql
-- Database check:
SELECT setting_value FROM journal_settings WHERE setting_name = 'styleSheet';
-- Result: [] (empty array)
```

### Bagaimana OJS Load CSS:

1. **OJS check database first** → `$context->getData('styleSheet')`
2. **If database has entry** → Load: `{baseUrl}/public/journals/{id}/{uploadName}?d={date}`
3. **If database empty** → CSS NOT LOADED ❌

```php
// From: ojs/lib/pkp/classes/template/PKPTemplateManager.php (line 237)
$contextStyleSheet = $currentContext->getData('styleSheet');
if ($contextStyleSheet) {  // ← This is FALSE because database is empty!
    $this->addStyleSheet(
        'contextStylesheet',
        $baseUrl . '/' . $publicFileManager->getContextFilesPath() . '/' . $contextStyleSheet['uploadName'],
        ['priority' => self::STYLE_SEQUENCE_LATE]
    );
}
```

---

## ✅ SOLUSI: Upload CSS Via OJS Admin

**CRITICAL:** CSS harus diupload via OJS Admin Panel, BUKAN manual copy!

### Step-by-Step:

#### 1. Login ke OJS Admin
```
URL: http://localhost:8080/index.php/jurnaladit
Username: admin
Password: [your admin password]
```

#### 2. Navigate ke Settings
```
Dashboard → Settings → Website → Appearance → Advanced
```

#### 3. Upload CSS File
- Scroll ke section: **Journal Stylesheet**
- Click **Upload** button
- Select file: `journal-riptek-theme.css` (dari root folder `ojs-docker/`)
- Click **Save**

#### 4. Verify Upload
Setelah save, OJS akan:
- ✅ Copy file ke `public/journals/1/` dengan timestamp
- ✅ Save metadata ke database (uploadName, dateUploaded)
- ✅ Auto-load CSS di semua pages

---

## 🔍 VERIFICATION

### Check Database After Upload:
```bash
docker-compose exec -T db mysql -uroot -proot ojs -e "SELECT setting_value FROM journal_settings WHERE setting_name = 'styleSheet';"
```

**Expected Result:**
```json
{
    "uploadName": "styleSheet_1234567890.css",
    "dateUploaded": "2025-10-30 12:34:56"
}
```

### Check Browser:
1. Clear cache: `Ctrl + Shift + Delete`
2. Reload: `Ctrl + F5`
3. Open DevTools: `F12` → Network tab → Filter: CSS
4. Should see: `styleSheet_xxx.css` loaded with status **200**

---

## 📝 WHY Manual Copy Doesn't Work

| Method | File Exists | Database Entry | CSS Loaded? |
|--------|-------------|----------------|-------------|
| Manual Copy | ✅ Yes | ❌ No | ❌ **NO** |
| Upload via Admin | ✅ Yes | ✅ Yes | ✅ **YES** |

**Reason:** OJS architecture requires database metadata for all uploaded files. Manual copy bypasses this system.

---

## 🎯 QUICK FIX SUMMARY

**Problem:** CSS file exists but not in database → OJS can't find it

**Solution:** Upload via OJS Admin → Database gets populated → CSS loads

**Steps:**
1. Login as Admin
2. Settings → Website → Appearance → Advanced
3. Upload `journal-riptek-theme.css`
4. Save
5. Clear browser cache
6. Done! ✨

---

## 🔧 ALTERNATIVE FIX (Advanced - Direct Database)

**WARNING:** Only for advanced users! Backup database first!

```sql
-- Update database directly (NOT RECOMMENDED)
UPDATE journal_settings 
SET setting_value = '{"uploadName":"styleSheet.css","dateUploaded":"2025-10-30 00:00:00"}' 
WHERE journal_id = 1 AND setting_name = 'styleSheet';
```

**Note:** This is NOT recommended because:
- Manual SQL can break things
- OJS expects specific format
- Better to use admin panel

---

## 📋 FILES TO UPLOAD

Upload this file via OJS Admin:
- ✅ `journal-riptek-theme.css` (from root of ojs-docker folder)

**OR**

Upload this file:
- ✅ `journal-riptek-theme-FIXED-v2.0.css` (the new fixed version)

**OR**

If you already have custom CSS, upload:
- ✅ Your current `styleSheet.css` from `ojs/public/journals/1/`

---

## ✨ AFTER UPLOAD

Hero section dengan gradient hijau-biru akan muncul!
Sidebar buttons akan ada di kiri!
Layout akan perfect seperti desain!

**Done!** 🎉

---

**END OF FIX DOCUMENTATION**

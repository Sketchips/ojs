# Test untuk verifikasi fix keyword error

## Langkah Test Manual

1. **Login ke OJS** sebagai Journal Manager atau Author
   - URL: http://localhost:8080/index.php/jurnaladit
   - Login dengan akun yang punya role Author/Manager

2. **Mulai submission baru atau edit submission draft**
   - Click "New Submission" atau buka submission yang sudah ada
   - Navigate ke step "Details" (step 1)

3. **Test field Keywords**:
   - Click di field "Keywords"
   - Ketik beberapa huruf (misal: "test", "data", dll)
   - Tunggu beberapa detik

**Expected Result (SETELAH FIX)**:
- ✅ **TIDAK** ada popup error "An unexpected error has occurred"
- ✅ Dropdown autocomplete muncul (kosong atau dengan suggestions)
- ✅ Bisa mengetik dan menambah keywords dengan tekan Enter
- ✅ Keywords tersimpan saat save/continue

**If Still Error**:
- Buka Browser Console (F12)
- Pergi ke tab Network
- Cari request ke `/api/v1/vocabs?vocab=submissionKeyword`
- Cek response:
  - Jika masih ada "Deprecated" atau PHP warning → restart container lagi
  - Jika 403 Unauthorized → user tidak punya role Author
  - Jika 401 → session expired, logout dan login lagi

## Test via Browser Console

Buka browser console (F12) saat di halaman submission wizard, lalu paste dan run:

```javascript
// Test API vocab endpoint
fetch('/index.php/jurnaladit/api/v1/vocabs?vocab=submissionKeyword&locale=en')
  .then(r => r.text())
  .then(text => {
    console.log('Response:', text);
    try {
      const json = JSON.parse(text);
      console.log('✅ Valid JSON:', json);
      console.log('✅ Keywords count:', json.length);
    } catch (e) {
      console.error('❌ Invalid JSON - PHP warning/error in response:', e);
      console.log('Raw response:', text);
    }
  });
```

**Expected Output**:
```
Response: ["fjkea","keystroke"]
✅ Valid JSON: (2) ["fjkea", "keystroke"]
✅ Keywords count: 2
```

**Jika masih error**, response akan menunjukkan PHP warning/error yang perlu di-fix.

## Verifikasi Fix dari Terminal (tanpa login)

Karena API butuh authentication, test ini hanya untuk verify syntax error sudah hilang:

```powershell
docker-compose exec web php -l /var/www/html/lib/pkp/classes/controlledVocab/ControlledVocabEntryDAO.php
```

Expected: `No syntax errors detected`

## Rollback (jika diperlukan)

Jika fix menyebabkan masalah lain (unlikely), rollback dengan:

```powershell
# Cari backup file
Get-ChildItem backups\ControlledVocabEntryDAO.php.backup-* | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Restore (ganti YYYYMMDD-HHMMSS dengan timestamp backup terbaru)
Copy-Item -Path "backups\ControlledVocabEntryDAO.php.backup-YYYYMMDD-HHMMSS" -Destination "ojs\lib\pkp\classes\controlledVocab\ControlledVocabEntryDAO.php" -Force

# Restart container
docker-compose restart web
```

---

## Summary of Fix

**File Modified**: `ojs/lib/pkp/classes/controlledVocab/ControlledVocabEntryDAO.php`

**Line 229 - BEFORE**:
```php
$words = array_map(fn (string $word) => '%' . addcslashes($word, '%_') . '%', PKPString::regexp_split('/\s+/', trim($term)));
```

**Line 229 - AFTER**:
```php
$words = array_map(fn (string $word) => '%' . addcslashes($word, '%_') . '%', PKPString::regexp_split('/\s+/', trim($term ?? '')));
```

**What Changed**: 
- `trim($term)` → `trim($term ?? '')`
- Menangani kasus ketika `$term` adalah `null` (PHP 8.1+ strict type enforcement)
- Tidak ada PHP Deprecated warning lagi yang merusak JSON response

**Impact**:
- ✅ API vocab response sekarang **pure JSON** tanpa PHP warning
- ✅ Frontend Vue component bisa parse response dengan benar
- ✅ Tidak ada popup error saat mengetik di field Keywords
- ✅ Autocomplete keywords bekerja normal

**Backup Location**: `backups/ControlledVocabEntryDAO.php.backup-YYYYMMDD-HHMMSS`

**Date Fixed**: 2025-11-20
**PHP Version**: 8.1.33
**OJS Version**: 3.4.0.9

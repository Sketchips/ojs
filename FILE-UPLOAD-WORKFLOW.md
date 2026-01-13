# Alur Kerja Upload File PNG di OJS

## Deskripsi Masalah
Ketika upload file PNG di dashboard OJS dan klik save, muncul error. Ini biasanya terjadi karena validasi gambar gagal atau ada masalah dengan temporary file handling.

## Alur Kerja Upload File di OJS

### 1. **Proses Upload Frontend (JavaScript)**
File: `d:\Code\ojs\ojs\lib\pkp\js\controllers\UploaderHandler.js`

```
User memilih file → Plupload Handler → FilesAdded event → Upload Progress → Complete
```

**Handler Events:**
- `FilesAdded` - Dipanggil saat file ditambahkan
- `UploadProgress` - Menampilkan progress bar
- `Error` - Menangani error upload
- `UploadComplete` - Setelah upload selesai

### 2. **Proses Upload Backend (PHP)**

#### A. Upload ke Temporary Directory
File: `d:\Code\ojs\ojs\lib\pkp\classes\file\TemporaryFileManager.php`

**Method: `handleUpload($fileName, $userId)`**

Alur:
```
1. Parse file extension dari nama file
2. Cek apakah base directory exists, jika tidak buat directory
3. Generate nama file baru dengan tempnam()
4. Upload file ke temporary directory
5. Simpan metadata file ke database (TemporaryFileDAO)
6. Return TemporaryFile object
```

**Validasi di tahap ini:**
- File extension parsing
- Directory permission
- File size dari $_FILES

#### B. Validasi Image
File: `d:\Code\ojs\ojs\lib\pkp\api\v1\_uploadPublicFile\PKPUploadPublicFileHandler.php`

**Method: `uploadFile($slimRequest, $response, $args)`**

**Validasi yang dilakukan:**

1. **Check file exists**
   ```php
   if (empty($_FILES) || empty($_FILES['file'])) {
       return error 400: 'api.files.400.noUpload'
   }
   ```

2. **Check allowed file types**
   ```php
   $allowedFileTypes = ['gif', 'jpg', 'png', 'webp'];
   if (!in_array($extension, $allowedFileTypes)) {
       return error 400: 'api.publicFiles.400.extensionNotSupported'
   }
   ```

3. **Validasi Image dengan getimagesize()**
   ```php
   if (in_array($extension, ['gif', 'jpg', 'jpeg', 'png', 'jpe'])) {
       if (getimagesize($_FILES['file']['tmp_name']) === false) {
           return error 400: 'api.publicFiles.400.invalidImage'
       }
   }
   ```

4. **Check MIME type matches extension**
   ```php
   $extensionFromMimeType = $fileManager->getImageExtension(
       PKPString::mime_content_type($_FILES['file']['tmp_name'])
   );
   if ($extensionFromMimeType !== '.' . $extension) {
       return error 400: 'api.publicFiles.400.mimeTypeNotMatched'
   }
   ```

5. **Check directory size limit**
   ```php
   $allowedDirSize = Config::getVar('files', 'public_user_dir_size', 5000) * 1024;
   if (($currentSize + $_FILES['file']['size']) > $allowedDirSize) {
       return error 413: 'api.publicFiles.413.noDirSpace'
   }
   ```

### 3. **Proses Save/Execute Form**

Bergantung pada konteks upload (Profile Image, Issue Cover, Category Image, dll), ada class form yang berbeda:

#### A. Public Profile Image
File: `d:\Code\ojs\ojs\lib\pkp\classes\user\form\PublicProfileForm.php`

**Method: `uploadProfileImage()`**

```php
1. Check CSRF token
2. Get uploaded file type
3. Get image extension dari MIME type
4. Upload ke site files directory
5. Validasi dimensi dengan getimagesize():
   - Max width: 150px
   - Max height: 150px
   - Min: > 0
6. Save metadata ke user settings
```

**Error yang mungkin terjadi:**
- Extension tidak valid (bukan image)
- `getimagesize()` return false (file corrupt atau bukan image)
- Dimensi terlalu besar/kecil
- Upload gagal (permission issue)

#### B. Issue Cover Image
File: `d:\Code\ojs\ojs\controllers\grid\issues\form\IssueForm.php`

**Method: `validate()`**

```php
1. Get temporary file dari database
2. Check image extension valid:
   $publicFileManager->getImageExtension($temporaryFile->getFileType())
3. Jika tidak valid: addError('coverImage', __('editor.issues.invalidCoverImageFormat'))
```

#### C. Category/Section Images
File: `d:\Code\ojs\ojs\lib\pkp\controllers\grid\settings\category\form\CategoryForm.php`

**Validasi:**
```php
!($this->_sizeArray = getimagesize($temporaryFile->getFilePath())) ||
!$this->_imageExtension = $publicFileManager->getImageExtension($temporaryFile->getFileType())
```

### 4. **File Manager Validation**
File: `d:\Code\ojs\ojs\lib\pkp\classes\file\FileManager.php`

**Key Methods:**

- `uploadedFileExists($fileName)` - Check if file exists in $_FILES
- `uploadError($fileName)` - Check for upload errors
- `getUploadErrorCode($fileName)` - Get error code
- `getUploadedFileType($fileName)` - Get MIME type
- `uploadFile($fileName, $destFileName)` - Move uploaded file

**Upload Error Codes:**
```php
UPLOAD_ERR_INI_SIZE     // File exceeds upload_max_filesize
UPLOAD_ERR_FORM_SIZE    // File exceeds MAX_FILE_SIZE in form
UPLOAD_ERR_PARTIAL      // File partially uploaded
UPLOAD_ERR_NO_FILE      // No file uploaded
UPLOAD_ERR_NO_TMP_DIR   // Missing temp directory
UPLOAD_ERR_CANT_WRITE   // Failed to write to disk
UPLOAD_ERR_EXTENSION    // PHP extension stopped upload
```

## Kemungkinan Penyebab Error "Occurred Error" Saat Save

### 1. **File PNG Corrupt atau Invalid**
**Penyebab:**
- File PNG rusak/corrupt
- File bukan PNG asli (hanya ekstensi .png tapi isinya bukan image)
- Header PNG tidak valid

**Solusi:**
```php
// Tambahkan logging untuk debug
if (getimagesize($filePath) === false) {
    error_log("Invalid image at: " . $filePath);
    error_log("File size: " . filesize($filePath));
    error_log("MIME type: " . mime_content_type($filePath));
}
```

### 2. **MIME Type Mismatch**
**Penyebab:**
- Browser mengirim MIME type yang salah
- File ekstensi .png tapi MIME type berbeda

**Solusi:**
```php
// Di PKPUploadPublicFileHandler.php, baris 171-176
// Bisa di-comment temporary untuk testing:
/*
if ($extensionFromMimeType !== '.' . $extension) {
    return $response->withStatus(400)->withJsonError('api.publicFiles.400.mimeTypeNotMatched');
}
*/
```

### 3. **PHP getimagesize() Gagal**
**Penyebab:**
- PHP GD library tidak terinstall
- File terlalu besar untuk diproses
- Memory limit PHP terlalu kecil

**Cek:**
```bash
# Di terminal PowerShell
php -m | Select-String -Pattern "gd"
php -i | Select-String -Pattern "memory_limit"
```

**Solusi di php.ini:**
```ini
memory_limit = 256M
upload_max_filesize = 20M
post_max_size = 20M
```

### 4. **Permission Issues**
**Penyebab:**
- Directory tidak writable
- Temporary directory tidak ada

**Solusi:**
```bash
# Check permissions
Get-Acl "d:\Code\ojs\ojs\files" | Format-List
```

### 5. **CSRF Token Expired/Invalid**
**Penyebab:**
- Session expired saat upload
- User logout saat proses upload

**Solusi:**
- Refresh halaman sebelum upload
- Check di code: `$request->checkCSRF()`

## Debug Steps untuk Error Upload PNG

### 1. **Enable Error Logging**
Edit `config.inc.php`:
```ini
[debug]
show_stacktrace = On
display_errors = On
deprecation_warnings = On
```

### 2. **Check PHP Error Log**
Lokasi: `files/error.log` atau system error log

### 3. **Add Debug Code**
Tambahkan di `PKPUploadPublicFileHandler.php` sebelum validasi:

```php
// Setelah line 100
error_log("=== DEBUG UPLOAD ===");
error_log("File name: " . $_FILES['file']['name']);
error_log("File size: " . $_FILES['file']['size']);
error_log("File type: " . $_FILES['file']['type']);
error_log("Tmp name: " . $_FILES['file']['tmp_name']);
error_log("Extension: " . $extension);

// Sebelum getimagesize (line 171)
if (in_array($extension, ['gif', 'jpg', 'jpeg', 'png', 'jpe'])) {
    error_log("Checking image validity...");
    $imageInfo = getimagesize($_FILES['file']['tmp_name']);
    error_log("getimagesize result: " . print_r($imageInfo, true));
    
    if ($imageInfo === false) {
        error_log("ERROR: getimagesize returned false!");
        error_log("File exists: " . file_exists($_FILES['file']['tmp_name']));
        error_log("File readable: " . is_readable($_FILES['file']['tmp_name']));
        error_log("File size: " . filesize($_FILES['file']['tmp_name']));
        return $response->withStatus(400)->withJsonError('api.publicFiles.400.invalidImage');
    }
}
```

### 4. **Check Browser Console**
- Buka Developer Tools (F12)
- Tab Network → cari request upload
- Lihat Response untuk error detail

### 5. **Verifikasi File PNG**
```bash
# Di PowerShell
# Check if file is valid PNG
$bytes = [System.IO.File]::ReadAllBytes("path\to\file.png")
$header = [System.Text.Encoding]::ASCII.GetString($bytes[1..3])
Write-Host "PNG header: $header"  # Should be "PNG"
```

## Fixes yang Bisa Dicoba

### Fix 1: Bypass MIME Type Check (Temporary)
File: `d:\Code\ojs\ojs\lib\pkp\api\v1\_uploadPublicFile\PKPUploadPublicFileHandler.php`

```php
// Comment lines 174-176 untuk testing
// if ($extensionFromMimeType !== '.' . $extension) {
//     return $response->withStatus(400)->withJsonError('api.publicFiles.400.mimeTypeNotMatched');
// }
```

### Fix 2: Improve Image Validation
```php
// Replace getimagesize check dengan try-catch
if (in_array($extension, ['gif', 'jpg', 'jpeg', 'png', 'jpe'])) {
    try {
        $imageInfo = @getimagesize($_FILES['file']['tmp_name']);
        if ($imageInfo === false) {
            error_log("Invalid image file uploaded: " . $_FILES['file']['name']);
            return $response->withStatus(400)->withJsonError('api.publicFiles.400.invalidImage');
        }
        
        // Additional check for PNG
        if ($extension === 'png' && $imageInfo[2] !== IMAGETYPE_PNG) {
            error_log("File extension is PNG but image type is not: " . $imageInfo[2]);
            return $response->withStatus(400)->withJsonError('api.publicFiles.400.invalidImage');
        }
    } catch (\Exception $e) {
        error_log("Exception during image validation: " . $e->getMessage());
        return $response->withStatus(400)->withJsonError('api.publicFiles.400.invalidImage');
    }
}
```

### Fix 3: Increase PHP Limits
Edit `php.ini` atau `.htaccess`:

```ini
php_value upload_max_filesize 20M
php_value post_max_size 20M
php_value memory_limit 256M
php_value max_execution_time 300
```

### Fix 4: Clear Temporary Files
```bash
# Di PowerShell
Remove-Item "d:\Code\ojs\ojs\files\temp\*" -Force -Recurse
```

## Testing Upload PNG

### 1. **Test dengan Gambar Valid**
- Buat PNG sederhana di Paint/Photoshop
- Ukuran kecil (< 1MB)
- Dimensi 800x600px

### 2. **Test Edge Cases**
- PNG dengan transparansi
- PNG indexed color
- PNG 24-bit
- PNG dengan EXIF data

### 3. **Monitor Logs**
```bash
# Watch error log
Get-Content "d:\Code\ojs\ojs\files\error.log" -Wait -Tail 50
```

## Diagram Alur Lengkap

```
[User Browser]
    ↓
    ↓ Select PNG file
    ↓
[Plupload JS Handler]
    ↓
    ↓ FilesAdded event
    ↓
[Upload to Server] ← POST multipart/form-data
    ↓
[PHP $_FILES validation]
    ↓
    ├─→ Check file exists
    ├─→ Check upload error code
    ├─→ Check file size
    └─→ Check MIME type
    ↓
[TemporaryFileManager::handleUpload()]
    ↓
    ├─→ Parse extension
    ├─→ Create temp directory
    ├─→ Generate unique filename
    ├─→ Move uploaded file
    └─→ Save to TemporaryFileDAO
    ↓
[Return temporary file ID to frontend]
    ↓
[User clicks SAVE button]
    ↓
[Form Submit with temporaryFileId]
    ↓
[Form Validation - depends on context]
    ↓
    ├─→ PublicProfileForm::uploadProfileImage()
    ├─→ IssueForm::validate()
    ├─→ CategoryForm::readInputData()
    └─→ Others...
    ↓
[Image Validation]
    ↓
    ├─→ getimagesize() ← **ERROR BIASA TERJADI DI SINI**
    ├─→ Check dimensions
    ├─→ Check MIME type
    └─→ Check extension
    ↓
[Move from temp to final location]
    ↓
[Save metadata to database]
    ↓
[Success / Error Response]
```

## Kesimpulan

**Error "occurred error" saat save biasanya terjadi karena:**

1. ✗ File PNG corrupt atau invalid → getimagesize() return false
2. ✗ MIME type tidak match dengan extension
3. ✗ PHP GD library tidak ada/disabled
4. ✗ Memory/upload limit terlalu kecil
5. ✗ Permission issue di temporary directory
6. ✗ CSRF token expired

**Langkah debugging:**
1. Enable error logging
2. Check PHP error log
3. Add debug code di upload handler
4. Test dengan PNG sederhana
5. Check PHP GD extension
6. Verify file permissions

**Quick fix untuk testing:**
- Comment MIME type validation sementara
- Increase PHP limits
- Clear temp directory
- Restart web server/PHP-FPM

Jika masih error, share error log atau screenshot error untuk analisis lebih lanjut.

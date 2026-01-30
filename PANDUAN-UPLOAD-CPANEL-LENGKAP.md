# 🚀 Panduan Lengkap Upload OJS ke cPanel Hosting

## 📋 Hasil Full Scan Project

### **Struktur Project:**
```
ojs/                          ← Core OJS 3.x
├── config.inc.php           ← Konfigurasi utama (DB, URL, Files)
├── index.php                ← Entry point
├── plugins/                 ← Plugin OJS
├── public/                  ← Assets public
├── cache/                   ← Cache (jangan upload)
└── lib/                     ← Library core

files/                        ← Upload files (submissions, images)
ojs_db_clean_20251111.sql    ← Database backup
custom-riptek-theme/         ← Custom theme
style/                       ← Custom CSS/JS
docker-compose.yml           ← Development only (jangan upload)
```

### **Database Info dari config.inc.php:**
- Driver: mysqli (MySQL/MariaDB)
- Host: db (akan diganti ke localhost di hosting)
- Database: ojs
- User: ojsuser
- Files Directory: /var/ojs_files

---

## 📦 PART 1: Persiapan Sebelum Upload

### **Step 1: Backup & Prepare Files**

```powershell
# 1. Buat folder untuk upload package
New-Item -ItemType Directory -Force -Path "D:\Code\ojs-upload-package"

# 2. Copy files yang PERLU diupload
robocopy "D:\Code\ojs\ojs" "D:\Code\ojs-upload-package\ojs" /E /XD cache .git node_modules

# 3. Copy custom files
robocopy "D:\Code\ojs\files" "D:\Code\ojs-upload-package\files" /E
robocopy "D:\Code\ojs\custom-riptek-theme" "D:\Code\ojs-upload-package\custom-riptek-theme" /E
robocopy "D:\Code\ojs\style" "D:\Code\ojs-upload-package\style" /E

# 4. Copy database backup
Copy-Item "D:\Code\ojs\ojs_db_clean_20251111.sql" "D:\Code\ojs-upload-package\"

# 5. Compress menjadi ZIP (untuk upload lebih cepat)
Compress-Archive -Path "D:\Code\ojs-upload-package\*" -DestinationPath "D:\Code\ojs-production.zip" -Force
```

### **Step 2: Cek Ukuran Files**

```powershell
# Cek ukuran total
Get-ChildItem "D:\Code\ojs-upload-package" -Recurse | Measure-Object -Property Length -Sum | Select-Object @{Name="Size (MB)"; Expression={[math]::Round($_.Sum / 1MB, 2)}}
```

**Catatan:** Jika lebih dari 500MB, pertimbangkan upload via FTP langsung daripada ZIP.

---

## 🌐 PART 2: Setup cPanel & Database

### **Step 1: Login ke cPanel**

1. Akses: `https://your-domain.com:2083` atau `https://cpanel.your-hosting.com`
2. Login dengan credentials dari hosting provider

---

### **Step 2: Create Database MySQL**

#### **A. Via cPanel MySQL Database Wizard:**

1. **cPanel Dashboard** → **MySQL Database Wizard**
2. **Step 1 - Create Database:**
   ```
   Database Name: ojs_production
   ```
   Klik **Next Step**

3. **Step 2 - Create User:**
   ```
   Username: ojs_user
   Password: [Generate Strong Password - CATAT INI!]
   ```
   ✅ Klik **Create User**

4. **Step 3 - Add User to Database:**
   - Centang **ALL PRIVILEGES**
   - Klik **Next Step**

5. **Catat informasi:**
   ```
   Database: cpaneluser_ojs_production
   Username: cpaneluser_ojs_user
   Password: [password yang digenerate]
   Host: localhost
   ```

#### **B. Alternative: Via phpMyAdmin**

1. **cPanel** → **phpMyAdmin**
2. Tab **User accounts** → **Add user account**
3. Fill:
   ```
   User name: ojs_user
   Host name: localhost
   Password: [strong password]
   Database for user: Create database with same name
   Global privileges: Check ALL
   ```

---

### **Step 3: Import Database**

#### **A. Via phpMyAdmin (Recommended untuk file < 50MB):**

1. **cPanel** → **phpMyAdmin**
2. Pilih database: `cpaneluser_ojs_production`
3. Tab **Import**
4. **Choose File** → pilih `ojs_db_clean_20251111.sql`
5. Format: **SQL**
6. Klik **Import**

**Tunggu sampai selesai** ✅

#### **B. Via SSH (Untuk file > 50MB):**

```bash
# Login SSH
ssh your-username@your-domain.com

# Import database
mysql -u cpaneluser_ojs_user -p cpaneluser_ojs_production < ojs_db_clean_20251111.sql
# Masukkan password saat diminta
```

#### **C. Via cPanel MySQL Import:**

1. Upload file SQL ke `public_html/temp/`
2. **cPanel** → **MySQL Databases** → **Run SQL Query**
3. Atau gunakan script PHP import (lihat section troubleshooting)

---

### **Step 4: Verify Database Import**

```sql
-- Via phpMyAdmin → SQL tab
SHOW TABLES;
-- Should show 100+ tables

SELECT COUNT(*) FROM users;
-- Should return user count

SELECT * FROM journals LIMIT 1;
-- Should show journal data
```

---

## 📤 PART 3: Upload Files ke Hosting

### **Method A: Via cPanel File Manager (Recommended untuk pemula)**

#### **1. Upload ZIP File:**

1. **cPanel** → **File Manager**
2. Navigate ke `public_html/`
3. Klik **Upload**
4. Pilih `ojs-production.zip`
5. **Tunggu sampai 100%** ✅

#### **2. Extract ZIP:**

1. Kembali ke File Manager
2. Right-click `ojs-production.zip` → **Extract**
3. Extract to: `public_html/`
4. Klik **Extract Files**
5. Delete ZIP setelah selesai

#### **3. Arrange Files:**

Struktur akhir di `public_html/`:
```
public_html/
├── ojs/              ← Core OJS (all PHP files)
├── files/            ← Upload directory
├── custom-riptek-theme/
├── style/
└── .htaccess         ← (akan dibuat di step berikutnya)
```

**ATAU** jika ingin OJS di root domain:

```
public_html/
├── index.php         ← Dari folder ojs/
├── config.inc.php    ← Dari folder ojs/
├── plugins/
├── lib/
├── public/
├── files/
├── custom-riptek-theme/
└── style/
```

---

### **Method B: Via FTP/SFTP (Lebih cepat untuk files besar)**

#### **Software: FileZilla**

1. **Download FileZilla:** https://filezilla-project.org/

2. **Connection Settings:**
   ```
   Host: ftp.your-domain.com
   Username: [cPanel username]
   Password: [cPanel password]
   Port: 21 (FTP) atau 22 (SFTP)
   ```

3. **Upload Process:**
   - Kiri: Local `D:\Code\ojs-upload-package\`
   - Kanan: Remote `public_html/`
   - Drag & drop semua folder ke kanan
   - **Estimated time:** 15-60 menit tergantung koneksi

---

## ⚙️ PART 4: Konfigurasi OJS di Hosting

### **Step 1: Edit config.inc.php**

**Via cPanel File Manager:**

1. Navigate ke `public_html/ojs/config.inc.php`
2. Right-click → **Edit**
3. Update konfigurasi:

```php
; <?php exit; // DO NOT DELETE?>
; DO NOT DELETE THE ABOVE LINE!!!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[general]
installed = On
base_url = "https://your-domain.com"           ; ← UBAH INI!
# Atau jika di subfolder: "https://your-domain.com/ojs"

restful_urls = On   ; Aktifkan untuk URL bersih

[database]
driver = mysqli
host = localhost                                ; ← UBAH dari "db"
username = cpaneluser_ojs_user                  ; ← UBAH sesuai DB user
password = your_strong_password                 ; ← UBAH sesuai DB password
name = cpaneluser_ojs_production                ; ← UBAH sesuai DB name

[files]
files_dir = /home/cpaneluser/ojs_files          ; ← UBAH path absolut
# Atau: files_dir = /home/cpaneluser/public_html/files

public_files_dir = public

[email]
; Konfigurasi email via SMTP (opsional tapi recommended)
default_envelope_sender = noreply@your-domain.com
smtp = On
smtp_server = mail.your-domain.com
smtp_port = 465
smtp_auth = ssl
smtp_username = noreply@your-domain.com
smtp_password = your_email_password

[security]
force_ssl = On       ; Aktifkan HTTPS
```

4. **Save Changes** (Ctrl+S)

---

### **Step 2: Create .htaccess (Apache)**

**Create file:** `public_html/.htaccess`

```apache
# Disable directory browsing
Options -Indexes

# Follow symbolic links
Options +FollowSymLinks

# Enable RewriteEngine
RewriteEngine On

# Redirect to OJS subfolder (jika OJS ada di subfolder)
# RewriteRule ^$ ojs/ [L]

# OJS Restful URLs
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.*)$ index.php/$1 [QSA,L]

# Security Headers
<IfModule mod_headers.c>
    Header set X-Content-Type-Options "nosniff"
    Header set X-Frame-Options "SAMEORIGIN"
    Header set X-XSS-Protection "1; mode=block"
</IfModule>

# PHP Settings (optional)
<IfModule mod_php7.c>
    php_value upload_max_filesize 100M
    php_value post_max_size 100M
    php_value memory_limit 256M
    php_value max_execution_time 300
    php_value max_input_time 300
</IfModule>

# Block access to config file
<FilesMatch "config\.inc\.php$">
    Order allow,deny
    Deny from all
</FilesMatch>

# Block access to cache directories
RedirectMatch 403 ^/cache/
RedirectMatch 403 ^/files/
</apache>
```

**Untuk OJS di root domain, tambahkan di awal .htaccess:**

```apache
# Force HTTPS
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Remove www (optional)
RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
RewriteRule ^(.*)$ https://%1/$1 [R=301,L]
```

---

### **Step 3: Set File Permissions**

**Via cPanel File Manager:**

1. Select folder `ojs/` → **Permissions**
   - Directories: **755** (rwxr-xr-x)
   - Files: **644** (rw-r--r--)

2. Special directories:
   ```
   files/          → 770 atau 777 (writable)
   cache/          → 770 atau 777 (writable)
   public/         → 755
   config.inc.php  → 640 (read-only)
   ```

**Via SSH (lebih cepat):**

```bash
cd ~/public_html/ojs

# Set ownership
chown -R your-username:your-username .

# Set default permissions
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

# Writable directories
chmod -R 770 files/ cache/ public/

# Config security
chmod 640 config.inc.php
```

---

### **Step 4: Create Files Upload Directory**

**Via cPanel File Manager:**

1. Navigate ke `/home/cpaneluser/`
2. **+ Folder** → `ojs_files`
3. Set permissions: **770** atau **777**

**Via SSH:**

```bash
mkdir -p ~/ojs_files
chmod 770 ~/ojs_files
```

---

## 🚀 PART 5: Finalisasi & Testing

### **Step 1: Clear Cache**

**Via cPanel File Manager:**

1. Navigate ke `public_html/ojs/cache/`
2. Select all files/folders → **Delete**

**Via SSH:**

```bash
cd ~/public_html/ojs
rm -rf cache/*
```

---

### **Step 2: Access Website**

1. **Open browser:** `https://your-domain.com`
2. **Expected:** Homepage OJS muncul

---

### **Step 3: Login Admin**

1. Go to: `https://your-domain.com/login`
2. Login dengan credentials dari database lama
3. **Dashboard** → cek semua menu

---

### **Step 4: Update Base URL di Database (Penting!)**

**Via phpMyAdmin → SQL:**

```sql
-- Update site base URL
UPDATE site_settings 
SET setting_value = 'https://your-domain.com' 
WHERE setting_name = 'installedLocales';

-- Update journal base URL (jika ada)
UPDATE journal_settings 
SET setting_value = 'https://your-domain.com' 
WHERE setting_name = 'baseUrl';

-- Update email config
UPDATE site_settings 
SET setting_value = 'noreply@your-domain.com' 
WHERE setting_name = 'contactEmail';
```

---

### **Step 5: Test Upload File**

1. Login sebagai admin
2. **Settings** → **Website** → **Appearance**
3. Upload logo test
4. Verify file tersimpan di `files/` directory

---

### **Step 6: Enable Scheduled Tasks (Cron Jobs)**

**Via cPanel Cron Jobs:**

1. **cPanel** → **Cron Jobs**
2. **Add New Cron Job:**

```bash
# Run every hour
0 * * * * /usr/bin/php /home/cpaneluser/public_html/ojs/tools/runScheduledTasks.php

# Or every 5 minutes for testing
*/5 * * * * /usr/bin/php /home/cpaneluser/public_html/ojs/tools/runScheduledTasks.php
```

3. Email output to: `your-email@domain.com`

---

## 🔧 PART 6: Troubleshooting

### **Problem 1: "500 Internal Server Error"**

**Solution:**

1. Check `.htaccess` syntax
2. Check PHP version (need PHP 7.3+)
   ```bash
   # Via SSH
   php -v
   ```
3. Enable error reporting:
   ```php
   # Add to config.inc.php
   error_reporting(E_ALL);
   ini_set('display_errors', 1);
   ```

---

### **Problem 2: "Database Connection Error"**

**Solution:**

1. Verify database credentials in `config.inc.php`
2. Test connection via PHP script:

Create: `public_html/test-db.php`

```php
<?php
$host = 'localhost';
$db = 'cpaneluser_ojs_production';
$user = 'cpaneluser_ojs_user';
$pass = 'your_password';

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully!";
mysqli_close($conn);
?>
```

Access: `https://your-domain.com/test-db.php`

**Delete file after testing!**

---

### **Problem 3: "Files Upload Not Working"**

**Solution:**

1. Check permissions:
   ```bash
   chmod -R 777 files/
   ```

2. Check PHP upload limits via `phpinfo.php`:

```php
<?php phpinfo(); ?>
```

Look for:
- `upload_max_filesize`
- `post_max_size`
- `memory_limit`

3. Increase via `.htaccess` or `php.ini`:

```ini
upload_max_filesize = 100M
post_max_size = 100M
max_execution_time = 300
```

---

### **Problem 4: "CSS/JS Not Loading"**

**Solution:**

1. Clear browser cache (Ctrl+Shift+Del)
2. Clear OJS cache:
   ```bash
   rm -rf cache/*
   ```
3. Check file paths di browser DevTools (F12)
4. Verify `base_url` di `config.inc.php`

---

### **Problem 5: "Import Database Too Large"**

**Solution via PHP Script:**

Create: `public_html/import-db.php`

```php
<?php
set_time_limit(0);

$host = 'localhost';
$db = 'cpaneluser_ojs_production';
$user = 'cpaneluser_ojs_user';
$pass = 'your_password';
$sqlFile = 'ojs_db_clean_20251111.sql';

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Read SQL file
$sql = file_get_contents($sqlFile);

// Split by semicolon
$queries = array_filter(array_map('trim', explode(';', $sql)));

echo "Starting import...<br>";

foreach ($queries as $i => $query) {
    if (!empty($query)) {
        if (mysqli_query($conn, $query)) {
            echo "Query " . ($i+1) . " executed<br>";
        } else {
            echo "Error: " . mysqli_error($conn) . "<br>";
        }
    }
}

echo "Import completed!";
mysqli_close($conn);
?>
```

Access: `https://your-domain.com/import-db.php`

**Delete file after import!**

---

## 📋 PART 7: Post-Deployment Checklist

### **Security Checklist:**

- [ ] SSL Certificate installed & HTTPS working
- [ ] `config.inc.php` permissions set to 640
- [ ] Remove test files (`test-db.php`, `import-db.php`, `phpinfo.php`)
- [ ] Database user has minimum required privileges
- [ ] `.htaccess` security headers active
- [ ] Disable directory listing
- [ ] Change default admin password
- [ ] Enable reCAPTCHA untuk registrasi

---

### **Functionality Checklist:**

- [ ] Homepage loading correctly
- [ ] Login working
- [ ] User registration working
- [ ] File upload working
- [ ] Email sending working (test reset password)
- [ ] Journal archives accessible
- [ ] Search function working
- [ ] Custom theme active
- [ ] Scheduled tasks running
- [ ] Backup automation setup

---

### **Performance Checklist:**

- [ ] Enable OPcache via cPanel (PHP Extensions)
- [ ] Enable Gzip compression in `.htaccess`:
  ```apache
  <IfModule mod_deflate.c>
      AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/json
  </IfModule>
  ```
- [ ] Set browser caching:
  ```apache
  <IfModule mod_expires.c>
      ExpiresActive On
      ExpiresByType image/jpg "access plus 1 year"
      ExpiresByType image/jpeg "access plus 1 year"
      ExpiresByType image/gif "access plus 1 year"
      ExpiresByType image/png "access plus 1 year"
      ExpiresByType text/css "access plus 1 month"
      ExpiresByType application/javascript "access plus 1 month"
  </IfModule>
  ```
- [ ] Optimize images di `files/` dan `public/`
- [ ] Enable CDN (Cloudflare) untuk static assets

---

## 🔐 PART 8: Backup Automation

### **Setup Automatic Backup via Cron:**

Create: `/home/cpaneluser/scripts/backup-ojs.sh`

```bash
#!/bin/bash

# Configuration
BACKUP_DIR="/home/cpaneluser/backups"
DATE=$(date +%Y%m%d_%H%M%S)
DB_USER="cpaneluser_ojs_user"
DB_PASS="your_password"
DB_NAME="cpaneluser_ojs_production"
OJS_DIR="/home/cpaneluser/public_html/ojs"
FILES_DIR="/home/cpaneluser/ojs_files"

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup database
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_$DATE.sql

# Backup files
tar -czf $BACKUP_DIR/files_$DATE.tar.gz $FILES_DIR

# Backup OJS core (optional)
tar -czf $BACKUP_DIR/ojs_$DATE.tar.gz $OJS_DIR

# Remove backups older than 7 days
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -delete
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -delete

echo "Backup completed: $DATE"
```

**Set executable:**

```bash
chmod +x /home/cpaneluser/scripts/backup-ojs.sh
```

**Add to Cron:**

```bash
# Daily backup at 2 AM
0 2 * * * /home/cpaneluser/scripts/backup-ojs.sh >> /home/cpaneluser/logs/backup.log 2>&1
```

---

## 📞 Support & Resources

### **OJS Official:**
- Documentation: https://docs.pkp.sfu.ca/
- Forum: https://forum.pkp.sfu.ca/
- GitHub: https://github.com/pkp/ojs

### **cPanel Docs:**
- File Manager: https://docs.cpanel.net/cpanel/files/
- MySQL: https://docs.cpanel.net/cpanel/databases/
- Cron Jobs: https://docs.cpanel.net/cpanel/advanced/cron-jobs/

---

## ✅ Summary Commands

```bash
# Quick verification after deployment
cd ~/public_html/ojs

# Check permissions
ls -la files/ cache/ public/

# Check PHP version
php -v

# Check MySQL connection
mysql -u cpaneluser_ojs_user -p cpaneluser_ojs_production -e "SHOW TABLES;"

# Clear cache
rm -rf cache/*

# Check logs
tail -f logs/error.log
```

---

**Deployment Date:** {{ DATE }}  
**OJS Version:** 3.4.x  
**PHP Version:** 8.1+  
**MySQL Version:** 5.7+ / MariaDB 10.6+

**Status:** ✅ Production Ready

---

**Notes:**
- Ganti semua `cpaneluser` dengan username cPanel kamu
- Ganti `your-domain.com` dengan domain aktual
- Ganti semua password dengan yang sebenarnya
- Test setiap step sebelum lanjut ke step berikutnya
- Simpan semua credentials di tempat aman

Good luck bro! 🚀

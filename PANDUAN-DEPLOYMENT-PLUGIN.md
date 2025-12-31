# 🚀 Panduan Deployment & Migrasi ke Plugin

## 📋 Daftar Isi
1. [Deployment ke Production Hosting](#deployment-ke-production-hosting)
2. [Cara Membuat Custom Plugin Theme](#cara-membuat-custom-plugin-theme)
3. [File Management & Safety](#file-management--safety)
4. [Database Migration Safety](#database-migration-safety)
5. [Update OJS Strategy](#update-ojs-strategy)

---

## 🌐 Deployment ke Production Hosting

### **Skenario: Copy Manual Files**

#### **Step 1: Persiapan**

```bash
# 1. Backup production environment
ssh user@production-server
cd /var/www/html/ojs

# 2. Backup core files yang akan diubah
cp lib/pkp/pages/user/RegistrationHandler.php lib/pkp/pages/user/RegistrationHandler.php.backup
cp lib/pkp/classes/template/PKPTemplateManager.php lib/pkp/classes/template/PKPTemplateManager.php.backup
cp lib/pkp/pages/main/MainHandler.php lib/pkp/pages/main/MainHandler.php.backup
cp lib/pkp/templates/layouts/backend.tpl lib/pkp/templates/layouts/backend.tpl.backup
cp lib/pkp/templates/user/profile.tpl lib/pkp/templates/user/profile.tpl.backup

# 3. Backup database
mysqldump -u ojs_user -p ojs_production > backup_ojs_$(date +%Y%m%d_%H%M%S).sql
```

---

#### **Step 2: Upload Files**

**Via SFTP/FTP** (Recommended):
```
Source (Local)                          → Destination (Production)
─────────────────────────────────────────────────────────────────
ojs/lib/pkp/pages/user/
  └─ RegistrationHandler.php            → /var/www/html/ojs/lib/pkp/pages/user/

ojs/lib/pkp/classes/template/
  └─ PKPTemplateManager.php              → /var/www/html/ojs/lib/pkp/classes/template/

ojs/lib/pkp/pages/main/
  └─ MainHandler.php                     → /var/www/html/ojs/lib/pkp/pages/main/

ojs/lib/pkp/templates/layouts/
  └─ backend.tpl                         → /var/www/html/ojs/lib/pkp/templates/layouts/

ojs/lib/pkp/templates/user/
  └─ profile.tpl                         → /var/www/html/ojs/lib/pkp/templates/user/
```

**Via SSH/rsync** (Advanced):
```bash
# From local machine
rsync -avz --progress \
  ojs/lib/pkp/pages/user/RegistrationHandler.php \
  user@production:/var/www/html/ojs/lib/pkp/pages/user/

rsync -avz --progress \
  ojs/lib/pkp/classes/template/PKPTemplateManager.php \
  user@production:/var/www/html/ojs/lib/pkp/classes/template/

rsync -avz --progress \
  ojs/lib/pkp/pages/main/MainHandler.php \
  user@production:/var/www/html/ojs/lib/pkp/pages/main/

rsync -avz --progress \
  ojs/lib/pkp/templates/ \
  user@production:/var/www/html/ojs/lib/pkp/templates/
```

---

#### **Step 3: Set Permissions**

```bash
# SSH ke production server
ssh user@production-server

# Set ownership
cd /var/www/html/ojs
chown -R www-data:www-data lib/pkp/

# Set permissions
find lib/pkp/pages -type f -exec chmod 644 {} \;
find lib/pkp/classes -type f -exec chmod 644 {} \;
find lib/pkp/templates -type f -exec chmod 644 {} \;
```

---

#### **Step 4: Clear Cache**

```bash
# Clear OJS cache
cd /var/www/html/ojs
rm -rf cache/*

# Restart PHP-FPM (optional tapi recommended)
sudo systemctl restart php8.1-fpm

# Restart Nginx/Apache
sudo systemctl restart nginx
# atau
sudo systemctl restart apache2
```

---

#### **Step 5: Verification**

**Test Checklist**:
- [ ] Login as admin → Dashboard works
- [ ] Login as regular user → Dashboard shows 0 items (if no submissions)
- [ ] Click "Home" button → Redirects to homepage
- [ ] Click "Submissions" → Opens new submission page
- [ ] Click "Profile" → Header is green
- [ ] Check error logs: `tail -f /var/log/nginx/error.log`

---

## 🎨 Cara Membuat Custom Plugin Theme

### **Kenapa Pakai Plugin?**

| Aspect | Manual Copy | Plugin Theme |
|--------|------------|-------------|
| **Update Safety** | ❌ Overwritten | ✅ Preserved |
| **Portability** | ❌ Hard | ✅ Easy (zip & install) |
| **Backend Mods** | ✅ Supported | ❌ Not supported |
| **Template Mods** | ✅ Supported | ✅ Supported |
| **CSS/JS** | ✅ Supported | ✅ Supported |

**⚠️ PENTING**: 
- Plugin theme **HANYA untuk FE (templates, CSS, JS)**
- Backend handler modifications **TIDAK BISA dijadikan plugin theme**
- Butuh **hybrid approach**: Plugin untuk FE + Manual copy untuk BE

---

### **Plugin Structure**

```
plugins/themes/customRiptekTheme/
│
├── CustomRiptekThemePlugin.php    # Main plugin class
├── version.xml                     # Version info
├── locale/
│   ├── en/
│   │   └── locale.po              # English translations
│   └── id/
│       └── locale.po              # Indonesian translations
│
├── templates/                      # Override OJS templates
│   ├── layouts/
│   │   └── backend.tpl            # Menu dengan arrow icon
│   └── user/
│       └── profile.tpl            # Green header
│
├── styles/
│   └── custom.css                 # Custom CSS
│
└── js/
    └── custom.js                  # Custom JavaScript (optional)
```

---

### **Step-by-Step: Buat Plugin**

#### **1. Buat Folder Plugin**

```bash
cd /var/www/html/ojs/plugins/themes
mkdir customRiptekTheme
cd customRiptekTheme
```

---

#### **2. Buat Main Plugin File**

**File**: `CustomRiptekThemePlugin.php`

```php
<?php
/**
 * @file plugins/themes/customRiptekTheme/CustomRiptekThemePlugin.php
 *
 * Custom theme untuk Jurnal Riptek dengan:
 * - Green profile header
 * - Custom menu dengan back button
 * - User dashboard filtering
 */

namespace APP\plugins\themes\customRiptekTheme;

use PKP\plugins\ThemePlugin;

class CustomRiptekThemePlugin extends ThemePlugin {
    
    /**
     * Initialize theme
     */
    public function init() {
        // Set parent theme (inherit dari bootstrap3)
        $this->setParent('bootstrap3');
        
        // Add custom stylesheet
        $this->addStyle(
            'custom-riptek-css',
            'styles/custom.css',
            ['contexts' => 'backend']  // Only load in backend
        );
        
        // Optional: Add custom JavaScript
        // $this->addScript(
        //     'custom-riptek-js',
        //     'js/custom.js',
        //     ['contexts' => 'backend']
        // );
    }
    
    /**
     * Get the display name of this plugin
     * @return string
     */
    public function getDisplayName() {
        return __('plugins.themes.customRiptekTheme.name');
    }
    
    /**
     * Get the description of this plugin
     * @return string
     */
    public function getDescription() {
        return __('plugins.themes.customRiptekTheme.description');
    }
    
    /**
     * Check if this plugin is currently enabled
     * @return bool
     */
    public function getEnabled() {
        return $this->getSetting(0, 'enabled');
    }
}
```

---

#### **3. Buat Version File**

**File**: `version.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE version SYSTEM "../../../lib/pkp/dtd/pluginVersion.dtd">
<version>
    <application>customRiptekTheme</application>
    <type>plugins.themes</type>
    <release>1.0.0.0</release>
    <date>2025-12-05</date>
    <lazy-load>0</lazy-load>
    <class>APP\plugins\themes\customRiptekTheme\CustomRiptekThemePlugin</class>
</version>
```

---

#### **4. Copy Template Files**

```bash
# Buat folder templates
mkdir -p templates/layouts
mkdir -p templates/user

# Copy modified templates
cp ../../../../lib/pkp/templates/layouts/backend.tpl templates/layouts/
cp ../../../../lib/pkp/templates/user/profile.tpl templates/user/
```

---

#### **5. Buat Custom CSS**

**File**: `styles/custom.css`

```css
/* Custom Riptek Theme Styles */

/* Green Profile Header */
.app__page.userProfile .app__pageHeading {
    background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%) !important;
    color: white !important;
    padding: 20px 30px !important;
    border-radius: 8px !important;
    box-shadow: 0 4px 6px rgba(46, 204, 113, 0.2) !important;
    margin-bottom: 20px !important;
}

/* Menu Home Icon Enhancement */
.app__nav .app__navItem[href*="index"] {
    font-weight: 500;
}

/* Optional: Style untuk dashboard cards */
.dashboard-stats-card {
    border-radius: 8px;
    transition: transform 0.2s;
}

.dashboard-stats-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}
```

---

#### **6. Buat Translation Files**

**File**: `locale/en/locale.po`

```po
msgid "plugins.themes.customRiptekTheme.name"
msgstr "Custom Riptek Theme"

msgid "plugins.themes.customRiptekTheme.description"
msgstr "Custom theme for Jurnal Riptek with enhanced user interface and green profile headers"
```

**File**: `locale/id/locale.po`

```po
msgid "plugins.themes.customRiptekTheme.name"
msgstr "Tema Custom Riptek"

msgid "plugins.themes.customRiptekTheme.description"
msgstr "Tema kustom untuk Jurnal Riptek dengan tampilan user interface yang ditingkatkan dan header profil hijau"
```

---

#### **7. Activate Plugin**

```bash
# Via SSH
cd /var/www/html/ojs

# Set permissions
chown -R www-data:www-data plugins/themes/customRiptekTheme
chmod -R 755 plugins/themes/customRiptekTheme
```

**Via Admin Dashboard**:
1. Login as Site Admin
2. Go to: **Settings → Website → Appearance → Themes**
3. Find "Custom Riptek Theme"
4. Click **Enable**
5. Set as **Active Theme**

---

## 📦 File Management & Safety

### **Files yang AMAN dijadikan Plugin**

| File Type | Can be Plugin? | Reason |
|-----------|----------------|--------|
| **Templates (.tpl)** | ✅ YES | Plugin override core templates |
| **CSS Files** | ✅ YES | Loaded via plugin init |
| **JavaScript** | ✅ YES | Loaded via plugin init |
| **Images/Assets** | ✅ YES | Stored in plugin folder |

**Cara Override Template via Plugin**:
```
OJS Load Order:
1. Check plugin template first: plugins/themes/customTheme/templates/user/profile.tpl
2. If not found, use core: lib/pkp/templates/user/profile.tpl
```

---

### **Files yang TIDAK BISA dijadikan Plugin**

| File Type | Can be Plugin? | Reason |
|-----------|----------------|--------|
| **Handler (.php)** | ❌ NO | Core logic, bukan theme |
| **Router (index.php)** | ❌ NO | Application routing |
| **Core Classes** | ❌ NO | Not plugin-compatible |

**Workaround untuk BE Files**:
1. **Simpan di Git** (Version Control)
2. **Create Patch Files**:
   ```bash
   diff -u original.php modified.php > modifications.patch
   ```
3. **Re-apply setelah update**:
   ```bash
   patch < modifications.patch
   ```

---

### **Hybrid Approach (Recommended)**

```
Production Deployment Strategy:

┌─────────────────────────────────────┐
│  Frontend (Templates, CSS, JS)     │
│  ✅ Pakai Plugin Theme              │
│  → Safe dari OJS updates           │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  Backend (Handlers, Core Classes)  │
│  ⚠️ Manual Copy + Git Control       │
│  → Perlu re-apply setelah update   │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  Database Schema                    │
│  ✅ No changes needed               │
│  → Fully safe                       │
└─────────────────────────────────────┘
```

---

## 🗄️ Database Migration Safety

### **Perubahan yang Dilakukan**

```sql
-- ❌ TIDAK ADA ALTER TABLE
-- ❌ TIDAK ADA CREATE TABLE
-- ❌ TIDAK ADA INSERT/UPDATE data
-- ✅ HANYA SELECT dengan filter WHERE
```

**Analysis**:

| Modification | DB Impact | Safe? |
|--------------|-----------|-------|
| RegistrationHandler fix | None | ✅ YES |
| PKPTemplateManager menu | None | ✅ YES |
| MainHandler filtering | SELECT query only | ✅ YES |
| Profile template | None | ✅ YES |
| Backend template | None | ✅ YES |

**Kesimpulan**: ✅ **100% Database Safe**
- Tidak ada schema changes
- Tidak ada data modification
- Hanya query filtering (read-only impact)

---

### **Backup Strategy**

#### **Before Deployment**

```bash
# Full database backup
mysqldump -u root -p \
  --single-transaction \
  --routines \
  --triggers \
  ojs_production > backup_pre_deploy_$(date +%Y%m%d).sql

# Compress backup
gzip backup_pre_deploy_$(date +%Y%m%d).sql
```

#### **After Successful Deploy**

```bash
# Incremental backup (only changes)
mysqldump -u root -p \
  --single-transaction \
  --where="date_modified > DATE_SUB(NOW(), INTERVAL 1 DAY)" \
  ojs_production > backup_post_deploy_$(date +%Y%m%d).sql
```

---

### **Restore Plan (Jika Gagal)**

```bash
# Stop web server
sudo systemctl stop nginx

# Restore database
mysql -u root -p ojs_production < backup_pre_deploy_20251205.sql

# Restore files
cp *.backup /path/to/original/location

# Clear cache
rm -rf /var/www/html/ojs/cache/*

# Start web server
sudo systemctl start nginx
```

---

## 🔄 Update OJS Strategy

### **Ketika OJS Release Update Baru**

#### **Scenario 1: Minor Update (e.g., 3.4.0.9 → 3.4.0.10)**

**Risk Level**: 🟡 **MEDIUM**  
**Impact**: Core files might be overwritten, plugin themes usually safe

**Action Plan**:

1. **Backup Everything**
   ```bash
   # Files
   tar -czf backup_before_update_$(date +%Y%m%d).tar.gz /var/www/html/ojs
   
   # Database
   mysqldump -u root -p ojs_production > db_before_update_$(date +%Y%m%d).sql
   ```

2. **Update OJS**
   ```bash
   # Download new version
   wget https://pkp.sfu.ca/ojs/download/ojs-3.4.0.10.tar.gz
   tar -xzf ojs-3.4.0.10.tar.gz
   
   # Merge dengan existing (hati-hati!)
   rsync -av --exclude=files --exclude=public ojs-3.4.0.10/ /var/www/html/ojs/
   ```

3. **Re-apply Backend Modifications**
   ```bash
   # Copy dari backup
   cp backup/RegistrationHandler.php lib/pkp/pages/user/
   cp backup/PKPTemplateManager.php lib/pkp/classes/template/
   cp backup/MainHandler.php lib/pkp/pages/main/
   ```

4. **Verify Plugin Theme**
   - Login as admin
   - Check: Settings → Appearance → Themes
   - Ensure "Custom Riptek Theme" still enabled
   - If not, re-enable

5. **Test Everything**
   - Clear cache: `rm -rf cache/*`
   - Test all functionality
   - Check error logs

---

#### **Scenario 2: Major Update (e.g., 3.4 → 3.5)**

**Risk Level**: 🔴 **HIGH**  
**Impact**: Core structure might change significantly

**Action Plan**:

1. **Test di Staging Dulu** (WAJIB!)
   ```bash
   # Clone production ke staging
   rsync -av /var/www/html/ojs/ /var/www/html/ojs-staging/
   
   # Test update di staging
   # Jangan langsung di production!
   ```

2. **Review Release Notes**
   - Baca: https://docs.pkp.sfu.ca/dev/release-notes/
   - Check breaking changes
   - Check deprecated functions

3. **Update Code Modifications**
   - Compare old vs new core files:
     ```bash
     diff -u ojs-3.4/lib/pkp/pages/user/RegistrationHandler.php \
             ojs-3.5/lib/pkp/pages/user/RegistrationHandler.php
     ```
   - Adjust modifications sesuai struktur baru

4. **Database Migration**
   - OJS biasanya handle otomatis
   - Tapi tetap backup dulu!

5. **Plugin Compatibility**
   - Check plugin version compatibility
   - Update plugin jika perlu

---

### **Git-Based Update Workflow**

**Setup Git untuk Track Changes**:

```bash
# Init git di OJS folder
cd /var/www/html/ojs
git init
git add .
git commit -m "Initial OJS 3.4.0.9 installation"

# Buat branch untuk custom modifications
git checkout -b custom-modifications

# Apply modifications
# ... edit files ...

git add lib/pkp/pages/user/RegistrationHandler.php
git add lib/pkp/classes/template/PKPTemplateManager.php
git add lib/pkp/pages/main/MainHandler.php
git commit -m "Custom modifications: user menu, dashboard filtering, profile header"

# Tag version
git tag -a v1.0-custom -m "Custom modifications v1.0"
```

**Update Workflow dengan Git**:

```bash
# 1. Backup current state
git stash save "Pre-update backup"

# 2. Update OJS core
# ... extract new OJS version ...

# 3. Re-apply custom modifications
git stash pop

# 4. Resolve conflicts jika ada
git mergetool

# 5. Commit hasil
git commit -m "Updated to OJS 3.4.0.10 with custom modifications"
```

---

## 📊 Production Deployment Checklist

### **Pre-Deployment**

- [ ] Backup production database
- [ ] Backup production files
- [ ] Test di staging environment
- [ ] Review all changes dengan tim
- [ ] Siapkan rollback plan
- [ ] Inform users tentang maintenance window

---

### **Deployment**

- [ ] Set maintenance mode
  ```bash
  # Create maintenance message
  touch /var/www/html/ojs/.maintenance
  ```

- [ ] Upload backend files (handlers)
- [ ] Install/activate plugin theme
- [ ] Set file permissions
- [ ] Clear OJS cache
- [ ] Clear PHP opcache
- [ ] Restart web server

---

### **Post-Deployment**

- [ ] Remove maintenance mode
- [ ] Test as admin user
- [ ] Test as regular user
- [ ] Check error logs
- [ ] Monitor server performance
- [ ] Backup successful deployment state
- [ ] Update documentation

---

### **Monitoring (First 24 Hours)**

```bash
# Watch error logs
tail -f /var/log/nginx/error.log

# Check PHP errors
tail -f /var/log/php8.1-fpm.log

# Monitor system resources
htop
```

---

## 🛠️ Troubleshooting Deployment

### **Issue: Plugin Tidak Muncul**

**Symptom**: Custom theme tidak ada di dashboard

**Solution**:
```bash
# Check permissions
ls -la plugins/themes/customRiptekTheme
# Should be: drwxr-xr-x www-data www-data

# Fix if needed
chown -R www-data:www-data plugins/themes/customRiptekTheme
chmod -R 755 plugins/themes/customRiptekTheme

# Clear cache
rm -rf cache/*
```

---

### **Issue: CSS Tidak Load**

**Symptom**: Profile header masih biru, tidak hijau

**Solution**:
1. Check browser console: F12 → Network tab
2. Pastikan `custom.css` loaded
3. Hard refresh: Ctrl+Shift+R
4. Check file path di `CustomRiptekThemePlugin.php`:
   ```php
   $this->addStyle('custom-css', 'styles/custom.css');
   ```

---

### **Issue: Backend Modifications Hilang Setelah Update**

**Symptom**: Menu custom hilang, filtering tidak work

**Solution**:
```bash
# Restore dari backup
cp backup/PKPTemplateManager.php lib/pkp/classes/template/
cp backup/MainHandler.php lib/pkp/pages/main/

# Atau re-apply dari Git
git checkout custom-modifications -- lib/pkp/

# Clear cache
rm -rf cache/*
```

---

## 📞 Support & Maintenance

### **Regular Maintenance Tasks**

| Task | Frequency | Command |
|------|-----------|---------|
| Clear cache | Weekly | `rm -rf cache/*` |
| Backup DB | Daily | `mysqldump > backup.sql` |
| Check logs | Daily | `tail -f error.log` |
| Update plugins | Monthly | Via admin dashboard |
| OJS version check | Monthly | https://pkp.sfu.ca/ojs/download/ |

---

### **Emergency Contacts**

- **OJS Official Support**: https://forum.pkp.sfu.ca/
- **Documentation**: https://docs.pkp.sfu.ca/
- **GitHub Issues**: https://github.com/pkp/ojs/issues

---

## ✅ Final Checklist

**Before Going Live**:
- [ ] All modifications tested
- [ ] Plugin theme created & tested
- [ ] Database backed up
- [ ] Files backed up
- [ ] Rollback plan ready
- [ ] Documentation complete
- [ ] Team trained
- [ ] Monitoring setup

**After Going Live**:
- [ ] Monitor first 24h
- [ ] Collect user feedback
- [ ] Document any issues
- [ ] Schedule regular backups
- [ ] Plan for future updates

---

**END OF DEPLOYMENT GUIDE** 🚀

**Last Updated**: December 5, 2025  
**OJS Version**: 3.4.0.9  
**Author**: GitHub Copilot  

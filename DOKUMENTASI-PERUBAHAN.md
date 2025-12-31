# 📋 Dokumentasi Perubahan OJS - Custom User Interface

## 🎯 Ringkasan Perubahan
Dokumentasi ini menjelaskan **semua perubahan yang dilakukan pada OJS 3.4.0.9** untuk meningkatkan user interface, memperbaiki bug, dan menambahkan fitur custom untuk user non-admin.

---

## 📂 File yang Dimodifikasi

### **1. Backend Core Files (BE)**

#### 📄 `ojs/lib/pkp/pages/user/RegistrationHandler.php`
**Lokasi**: `/var/www/html/lib/pkp/pages/user/RegistrationHandler.php`

**Masalah**: Warning deprecated `str_replace()` pada PHP 8.1+ karena parameter null  
**Perubahan**: Line 126
```php
// SEBELUM
$source = str_replace('@', '', $source);

// SESUDAH
$source = $source ? str_replace('@', '', $source) : '';
```

**Cara Ubah**:
1. Cari line `$source = $request->getUserVar('source');`
2. Tambahkan null check sebelum `str_replace()`
3. Format: `$variable ? operation($variable) : default_value`

**Hardcoded**: ❌ Tidak - Ini logic handler yang aman

---

#### 📄 `ojs/lib/pkp/classes/template/PKPTemplateManager.php`
**Lokasi**: `/var/www/html/lib/pkp/classes/template/PKPTemplateManager.php`

**Perubahan 1**: Line 321 - Register Smarty modifier
```php
// DITAMBAHKAN
$this->registerPlugin('modifier', 'in_array', 'in_array');
```
**Fungsi**: Memperbaiki deprecated warning Smarty untuk modifier `in_array`

**Perubahan 2**: Line 1044-1070 - Menu Navigation untuk User
```php
// DITAMBAHKAN menu Home dengan icon panah kiri
$menu['home'] = [
    'name' => __('navigation.home'),
    'url' => $router->url($request, null, 'index'),
    'isCurrent' => false,
];

// DIUBAH menu Submissions dari 'main' ke 'submission'
$menu['submissions'] = [
    'name' => __('navigation.submissions'),
    'url' => $router->url($request, null, 'submission'), // <- Changed
    'isCurrent' => $router->getRequestedPage($request) === 'submission',
];

// DITAMBAHKAN menu Profile
$menu['profile'] = [
    'name' => __('user.profile'),
    'url' => $router->url($request, null, 'user', 'profile'),
    'isCurrent' => $router->getRequestedPage($request) === 'user' && $router->getRequestedOp($request) === 'profile',
];
```

**Cara Ubah Menu**:
1. Cari method `setupBackendPage()`
2. Temukan block `if (count(array_intersect([Role::ROLE_ID_MANAGER, ...]))`
3. Tambahkan menu item dengan format:
```php
$menu['key_name'] = [
    'name' => __('translation.key'),
    'url' => $router->url($request, null, 'page', 'operation'),
    'isCurrent' => $router->getRequestedPage($request) === 'page_name',
];
```

**Hardcoded**: ⚠️ **Semi-hardcoded** - Menu structure hardcoded, tapi label pakai translation keys

---

#### 📄 `ojs/lib/pkp/pages/main/MainHandler.php`
**Lokasi**: `/var/www/html/lib/pkp/pages/main/MainHandler.php`

**Masalah**: User non-admin melihat semua submissions (seharusnya hanya milik sendiri)  
**Perubahan**: Line 77-108
```php
use APP\facades\Repo; // DITAMBAHKAN import

// DITAMBAHKAN logic role checking
$userGroups = Repo::userGroup()->userUserGroups($userId, $context->getId());
$isAdminOrManager = false;
foreach ($userGroups as $userGroup) {
    if (in_array($userGroup->getRoleId(), [Role::ROLE_ID_SITE_ADMIN, Role::ROLE_ID_MANAGER])) {
        $isAdminOrManager = true;
    }
}

$buildCollector = function() use ($contextId, $userId, $isAdminOrManager) {
    $collector = \APP\facades\Repo::submission()->getCollector()
        ->filterByContextIds([$contextId]);
    
    // Filter untuk non-admin
    if (!$isAdminOrManager) {
        $collector->assignedTo([$userId]); // Array format
    }
    return $collector;
};
```

**Cara Ubah**:
1. Import `APP\facades\Repo` di atas class
2. Tambahkan role checking sebelum build collector
3. Gunakan `assignedTo([$userId])` dengan **array format**

**Hardcoded**: ❌ Tidak - Logic dynamic berdasarkan user role

---

#### 📄 `ojs/lib/pkp/pages/submissions/index.php`
**Lokasi**: `/var/www/html/lib/pkp/pages/submissions/index.php`

**Perubahan**: Line 19-23
```php
// TETAP ADA - Redirect /submissions ke /main
if ($op === 'index') {
    $request = Application::get()->getRequest();
    $request->redirect(null, 'main');
}
```

**Catatan**: File ini redirect `/submissions` ke dashboard, tapi menu sudah langsung arahkan ke `/submission` (singular)

**Hardcoded**: ❌ Tidak - Router logic standar OJS

---

### **2. Frontend Template Files (FE)**

#### 📄 `ojs/lib/pkp/templates/layouts/backend.tpl`
**Lokasi**: `/var/www/html/lib/pkp/templates/layouts/backend.tpl`

**Perubahan**: Line 178-185 - Tambah icon panah untuk menu Home
```smarty
<a v-else class="app__navItem" :class="menuItem.isCurrent ? 'app__navItem--isCurrent' : ''" :href="menuItem.url">
    <span v-if="key === 'home'" style="margin-right: 8px;">←</span>
    {{ menuItem.name }}
</a>
```

**Fungsi**: Menambahkan panah kiri (←) di menu Home agar jelas ini tombol "back to homepage"

**Cara Ubah**:
1. Cari block `{block name="menu"}`
2. Temukan `<a v-else class="app__navItem"`
3. Tambahkan conditional span untuk icon sebelum `{{ menuItem.name }}`

**Hardcoded**: ⚠️ **Yes** - Icon hardcoded inline style

---

#### 📄 `ojs/lib/pkp/templates/user/profile.tpl`
**Lokasi**: `/var/www/html/lib/pkp/templates/user/profile.tpl`

**Perubahan**: Line 13-22 - Custom green header untuk profile page
```smarty
<style>
.app__pageHeading {
    background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%) !important;
    color: white !important;
    padding: 20px 30px !important;
    border-radius: 8px !important;
    box-shadow: 0 4px 6px rgba(46, 204, 113, 0.2) !important;
    margin-bottom: 20px !important;
}
</style>
```

**Fungsi**: Profile page header hijau (berbeda dari admin yang biru)

**Cara Ubah Warna**:
1. Edit gradient color di `linear-gradient()`
2. Ubah `#2ecc71` (light green) dan `#27ae60` (dark green)
3. Sesuaikan `box-shadow` rgba untuk match warna

**Hardcoded**: ✅ **Yes** - CSS hardcoded dengan `!important` flag

---

### **3. Theme Files**

#### 📄 `ojs/plugins/themes/bootstrap3/templates/frontend/components/header.tpl`
**Lokasi**: Theme header template

**Catatan**: File ini di-open user tapi tidak ada perubahan pada file ini dalam session ini.

---

## 🔗 Koneksi Frontend ↔ Backend

### **Flow: User Login → Dashboard**

```
1. USER LOGIN
   ├─ BE: RegistrationHandler.php → Validate user
   └─ Redirect ke: /main

2. LOAD DASHBOARD (/main)
   ├─ BE: MainHandler.php
   │   ├─ Check user role (Admin vs User)
   │   ├─ Filter submissions via assignedTo()
   │   └─ Prepare data untuk template
   │
   └─ FE: backend.tpl
       ├─ PKPTemplateManager setup menu (BE)
       ├─ Render menu via Vue.js
       └─ Display dashboard content

3. CLICK MENU ITEM
   ├─ Home → /index (Homepage)
   ├─ Dashboard → /main (Tetap di dashboard)
   ├─ Submissions → /submission (New submission page)
   └─ Profile → /user/profile
       └─ FE: profile.tpl (green header CSS)
```

### **Mapping: FE Template → BE Handler**

| Template File | Backend Handler | URL Route |
|--------------|----------------|-----------|
| `backend.tpl` | `PKPTemplateManager` | All `/user/*` routes |
| `profile.tpl` | `ProfileHandler.php` | `/user/profile` |
| `indexJournal.tpl` | `indexHandler.php` | `/index` |
| Dashboard stats | `MainHandler.php` | `/main` |

---

## 🛠️ Cara Modifikasi Custom

### **Menambah Menu Item Baru**

**File**: `PKPTemplateManager.php` line ~1050

```php
// Template format
$menu['unique_key'] = [
    'name' => __('locale.key.in.en.po'),  // Translation key
    'url' => $router->url($request, null, 'page_name', 'operation'),
    'isCurrent' => $router->getRequestedPage($request) === 'page_name',
];
```

**Contoh: Tambah menu "Reports"**
```php
$menu['reports'] = [
    'name' => __('navigation.reports'),
    'url' => $router->url($request, null, 'reports', 'index'),
    'isCurrent' => $router->getRequestedPage($request) === 'reports',
];
```

---

### **Ubah Warna Theme**

**File**: `profile.tpl` atau create custom CSS di theme

```css
/* Template */
.class-name {
    background: linear-gradient(135deg, #START_COLOR 0%, #END_COLOR 100%) !important;
    color: #TEXT_COLOR !important;
}

/* Contoh: Header biru */
.app__pageHeading {
    background: linear-gradient(135deg, #3498db 0%, #2980b9 100%) !important;
    color: white !important;
}
```

**⚠️ Penting**: Selalu pakai `!important` karena `build.css` punya specificity tinggi

---

### **Filter Data untuk Role Specific**

**File**: `MainHandler.php` atau handler lain

```php
// Check user role
$userGroups = Repo::userGroup()->userUserGroups($userId, $context->getId());
$hasRole = false;
foreach ($userGroups as $userGroup) {
    if ($userGroup->getRoleId() === Role::ROLE_ID_SOMETHING) {
        $hasRole = true;
    }
}

// Apply filter
if (!$hasRole) {
    $collector->filterByXYZ($userId);
}
```

---

## 📦 Deployment ke Hosting Production

### **Opsi 1: Copy Manual Files**

**Files yang PERLU di-copy**:
```
✅ ojs/lib/pkp/pages/user/RegistrationHandler.php
✅ ojs/lib/pkp/classes/template/PKPTemplateManager.php
✅ ojs/lib/pkp/pages/main/MainHandler.php
✅ ojs/lib/pkp/templates/layouts/backend.tpl
✅ ojs/lib/pkp/templates/user/profile.tpl
```

**Files yang TIDAK PERLU**:
```
❌ docker-compose.yml (local dev only)
❌ Dockerfile (local dev only)
❌ backups/* (development backup)
❌ db_data/* (local database)
```

**Steps**:
1. Backup production files dulu: `cp file.php file.php.backup`
2. Upload modified files via FTP/SFTP
3. Clear OJS cache: `rm -rf cache/*`
4. Clear browser cache: Ctrl+Shift+R

---

### **Opsi 2: Buat Custom Plugin Theme**

**⚠️ REKOMENDASI**: Untuk perubahan BE handler **TIDAK BISA dijadikan plugin theme**. Plugin theme hanya untuk FE template dan CSS.

**Yang bisa dijadikan plugin theme**:
- ✅ `profile.tpl` (template override)
- ✅ `backend.tpl` (template override)
- ✅ Custom CSS files
- ✅ Custom JavaScript files

**Yang TIDAK bisa dijadikan plugin**:
- ❌ Handler files (RegistrationHandler, MainHandler, dll)
- ❌ Core class modifications (PKPTemplateManager)
- ❌ Router logic (submissions/index.php)

**Struktur Plugin Theme**:
```
plugins/themes/customTheme/
├── CustomThemePlugin.php
├── version.xml
├── templates/
│   ├── layouts/
│   │   └── backend.tpl (override)
│   └── user/
│       └── profile.tpl (override)
└── styles/
    └── custom.css
```

**File Plugin Template** (`CustomThemePlugin.php`):
```php
<?php
import('lib.pkp.classes.plugins.ThemePlugin');

class CustomThemePlugin extends ThemePlugin {
    
    public function init() {
        // Override templates
        $this->addStyle('custom-css', 'styles/custom.css');
        
        // Set template path
        $this->setParent('bootstrap3');
    }
    
    public function getDisplayName() {
        return 'Custom OJS Theme';
    }
    
    public function getDescription() {
        return 'Custom theme with green profile header and menu modifications';
    }
}
```

**version.xml**:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<version>
    <application>customTheme</application>
    <type>plugins.themes</type>
    <release>1.0.0.0</release>
    <date>2025-12-05</date>
</version>
```

---

### **⚠️ Keamanan & Maintenance**

#### **1. Backend Modifications (Handler Files)**

| Aspek | Status | Penjelasan |
|-------|--------|-----------|
| **Update OJS** | ⚠️ **AKAN HILANG** | Core files akan di-overwrite saat update |
| **Plugin Safety** | ❌ **TIDAK AMAN** | Tidak bisa dijadikan plugin |
| **Solusi** | 📝 Version Control | Simpan di Git, re-apply setelah update |

**Cara Aman**:
1. Simpan semua modifikasi di Git repository private
2. Sebelum update OJS, backup files:
   ```bash
   cp RegistrationHandler.php RegistrationHandler.php.custom
   cp MainHandler.php MainHandler.php.custom
   cp PKPTemplateManager.php PKPTemplateManager.php.custom
   ```
3. Update OJS
4. Re-apply changes dengan `diff` dan `patch`:
   ```bash
   diff original.php custom.php > changes.patch
   patch original.php < changes.patch
   ```

---

#### **2. Template Modifications (FE Files)**

| Aspek | Status | Penjelasan |
|-------|--------|-----------|
| **Update OJS** | ⚠️ **MUNGKIN HILANG** | Tergantung update scope |
| **Plugin Safety** | ✅ **AMAN** | Bisa dijadikan theme plugin |
| **Solusi** | 🎨 Theme Plugin | Override via plugin theme |

**Cara Aman dengan Plugin**:
1. Buat plugin theme di `plugins/themes/yourTheme/`
2. Copy template files ke `templates/` dalam plugin
3. OJS akan prioritize plugin templates daripada core templates
4. Update OJS tidak akan overwrite plugin

---

#### **3. Database Considerations**

| Aspek | Status | Penjelasan |
|-------|--------|-----------|
| **Struktur DB** | ✅ **AMAN** | Tidak ada perubahan schema |
| **Data Migration** | ✅ **TIDAK PERLU** | Semua logic di application layer |
| **Backup DB** | 📝 **RECOMMENDED** | Backup rutin tetap penting |

**Perubahan yang dilakukan TIDAK mengubah database**:
- ✅ Tidak ada ALTER TABLE
- ✅ Tidak ada CREATE TABLE
- ✅ Tidak ada modifikasi data existing
- ✅ Hanya filter query (SELECT dengan WHERE)

**Backup Database Safe**:
```bash
# Backup production DB
mysqldump -u user -p ojs_db > backup_$(date +%Y%m%d).sql

# Restore jika perlu
mysql -u user -p ojs_db < backup_20251205.sql
```

---

## 🚀 Deployment Checklist

### **Pre-Deployment**
- [ ] Backup semua files yang akan diubah
- [ ] Backup database production
- [ ] Test di staging environment dulu
- [ ] Dokumentasi changes di Git

### **Deployment**
- [ ] Upload modified BE files (handlers)
- [ ] Upload modified FE templates
- [ ] Set correct file permissions (755 untuk folder, 644 untuk files)
- [ ] Clear OJS cache: `rm -rf cache/*`
- [ ] Restart web server (jika pakai PHP-FPM)

### **Post-Deployment**
- [ ] Test login as admin
- [ ] Test login as regular user
- [ ] Verify dashboard filtering works
- [ ] Check menu items muncul semua
- [ ] Test profile page (green header)
- [ ] Clear browser cache dan test

### **Monitoring**
- [ ] Check error logs: `tail -f error.log`
- [ ] Monitor user feedback
- [ ] Backup files setelah confirmed working

---

## 🐛 Troubleshooting

### **Issue 1: Menu tidak muncul**
**Symptom**: Sidebar menu kosong atau tidak ada item

**Solution**:
1. Clear cache: `rm -rf cache/*`
2. Check `PKPTemplateManager.php` line 1044-1070
3. Verify `$router->url()` syntax benar
4. Restart web server

---

### **Issue 2: Profile header masih biru**
**Symptom**: Warna header tidak berubah hijau

**Solution**:
1. Hard refresh browser: `Ctrl+Shift+R`
2. Check `profile.tpl` line 13-22
3. Pastikan pakai `!important` flag
4. Clear OJS cache

---

### **Issue 3: User masih lihat all submissions**
**Symptom**: Dashboard user show semua artikel

**Solution**:
1. Check `MainHandler.php` line 77-108
2. Verify `assignedTo([$userId])` pakai array format
3. Debug dengan logging:
   ```php
   error_log("User ID: " . $userId);
   error_log("Is Admin: " . ($isAdminOrManager ? 'yes' : 'no'));
   ```

---

### **Issue 4: Fatal error after update OJS**
**Symptom**: Error setelah update OJS version

**Solution**:
1. Restore backup files
2. Compare old vs new OJS core files
3. Re-apply changes manually dengan diff
4. Test step by step

---

## 📞 Contact & Support

**Developer**: GitHub Copilot AI  
**Date**: December 5, 2025  
**OJS Version**: 3.4.0.9  
**PHP Version**: 8.1.33  

**Dokumentasi Official OJS**:
- https://docs.pkp.sfu.ca/dev/
- https://docs.pkp.sfu.ca/dev/plugin-guide/

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-12-05 | Initial custom modifications |
| | | - Fix deprecated warnings |
| | | - Add user menu items |
| | | - Green profile header |
| | | - Dashboard user filtering |
| | | - Home button with arrow icon |

---

**END OF DOCUMENTATION** 🎉

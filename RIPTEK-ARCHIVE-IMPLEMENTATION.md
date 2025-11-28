# Riptek Archive UI Implementation Guide

## 📋 Ringkasan Perubahan

Dokumen ini menjelaskan modifikasi yang telah dilakukan pada template OJS 3 Bootstrap3 theme untuk mengikuti referensi visual Jurnal Riptek.

## ✅ File yang Telah Dimodifikasi

### 1. **issueArchive.tpl** 
**Lokasi:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\frontend\pages\issueArchive.tpl`

**Perubahan:**
- ✨ Menambahkan layout dua kolom (sidebar kiri + konten kanan)
- ✨ Sidebar kiri berisi navigasi menu:
  - Editorial Team
  - Peer-Review Process
  - Focus and Scope
  - Section Policies
  - Author Guidelines
  - INDEX BY dengan logo SINTA
- ✨ Konten kanan menampilkan archive list yang dikelompokkan per tahun
- ✨ Header archive dengan judul "Archives" dan breadcrumb "Table of Contents"

**Bagian yang diganti:**
```smarty
{* Sebelumnya: simple list dengan class .issues media-list *}
{* Sekarang: layout .row.archive-layout dengan .col-md-3 dan .col-md-9 *}
```

**Logic OJS yang dipertahankan:**
- `{foreach from=$issues item="issue"}` - loop issue tetap utuh
- `{include file="frontend/objects/issue_summary.tpl"}` - include template
- Pagination logic tetap sama
- Semua variable OJS ($issues, $prevPage, $nextPage, dll) tidak berubah

---

### 2. **issue_summary.tpl**
**Lokasi:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\frontend\objects\issue_summary.tpl`

**Perubahan:**
- ✨ Mengubah dari layout `media` menjadi Bootstrap `card`
- ✨ Layout horizontal: cover di kiri (col-md-3), info di kanan (col-md-9)
- ✨ Hover effect pada card
- ✨ Typography yang lebih modern

**Bagian yang diganti:**
```smarty
{* Sebelumnya: <div class="issue-summary media"> *}
{* Sekarang: <div class="issue-summary-card"> dengan .card dan .row.no-gutters *}
```

**Logic OJS yang dipertahankan:**
- Semua `{assign}` variable tetap sama
- Conditional `{if $issue->getLocalizedCoverImage()}` tetap berfungsi
- Link `{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}` tidak berubah
- Display logic untuk $issueTitle, $issueSeries, $issueDescription tetap utuh

---

### 3. **issue_toc.tpl**
**Lokasi:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\frontend\objects\issue_toc.tpl`

**Perubahan:**
- ✨ Menambahkan wrapper class untuk styling lebih baik
- ✨ Cover issue dalam card styling
- ✨ Spacing dan alignment yang lebih rapi
- ✨ Section header dengan warna hijau sesuai tema Riptek

**Bagian yang diganti:**
```smarty
{* Sebelumnya: <div class="thumbnail col-md-4"> *}
{* Sekarang: <div class="col-md-4 issue-cover-wrapper"> dengan .issue-cover-card *}
```

**Logic OJS yang dipertahankan:**
- Preview notification logic tetap sama
- Cover image conditional rendering tidak berubah
- PubID plugins loop tetap utuh
- Published date display tidak berubah
- Issue galleys logic tetap sama
- Articles sections loop tetap berfungsi

---

### 4. **footer.tpl**
**Lokasi:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\frontend\components\footer.tpl`

**Perubahan:**
- ✨ Background gradient hijau sesuai referensi screenshot
- ✨ Full width footer dengan `container-fluid`
- ✨ Overlay effect untuk depth visual
- ✨ Icon untuk kontak (envelope, phone, globe, fax, map-marker)
- ✨ Typography yang lebih jelas dan terstruktur

**Bagian yang diganti:**
```html
<!-- Sebelumnya: <footer class="footer"> dengan <div class="container"> -->
<!-- Sekarang: <footer class="footer footer-riptek"> dengan <div class="container-fluid"> -->
```

**Logic OJS yang dipertahankan:**
- Sidebar hook `{call_hook name="Templates::Common::Sidebar"}` tidak berubah
- Footer structure tetap dalam `pkp_structure_page`
- Script loading `{load_script}` tetap sama
- PageFooter hook tetap berfungsi

---

### 5. **BootstrapThreeThemePlugin.php**
**Lokasi:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\BootstrapThreeThemePlugin.php`

**Perubahan:**
- ✨ Menambahkan loading CSS custom: `riptek-archive-custom.css`

**Baris yang ditambahkan:**
```php
// Add custom Riptek archive styles
$this->addStyle('riptek-archive-custom', 'styles/riptek-archive-custom.css');
```

**Posisi:** Setelah `$this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');`

---

### 6. **riptek-archive-custom.css** (FILE BARU)
**Lokasi:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\styles\riptek-archive-custom.css`

**Isi:**
File CSS lengkap untuk styling semua perubahan, mencakup:

#### Archive Page Layout
- `.archive-layout` - Container layout
- `.archive-sidebar` - Sidebar kiri dengan navigasi
- `.sidebar-nav-item` - Tombol navigasi hijau
- `.sidebar-indexby` - Section INDEX BY dengan logo SINTA
- `.archive-content` - Area konten kanan
- `.archive-header` - Header dengan judul dan breadcrumb
- `.archive-year-group` - Grouping per tahun
- `.year-heading` - Heading tahun

#### Issue Summary Card
- `.issue-summary-card` - Container card
- `.issue-card` - Card Bootstrap dengan hover effect
- `.issue-cover-col` - Kolom cover image
- `.issue-cover-image` - Styling image cover
- `.issue-info` - Info issue (title, series, description)
- `.issue-title` - Title dengan hover effect
- `.issue-series` - Series dengan warna hijau
- `.issue-description` - Deskripsi issue

#### Issue TOC Page
- `.issue-heading-wrapper` - Wrapper heading issue
- `.issue-cover-wrapper` - Wrapper cover card
- `.issue-cover-card` - Card untuk cover
- `.issue-details` - Detail issue (description, DOI, date)
- `.issue-galleys-section` - Section galley
- `.article-sections` - Container sections artikel
- `.article-section` - Individual section
- `.section-header` - Header section dengan warna hijau

#### Footer Riptek
- `.footer-riptek` - Footer dengan gradient hijau
- `.footer-overlay` - Overlay SVG untuk depth effect
- `.footer-container` - Container full width
- `.footer-title` - Title "REDAKSI JURNAL RIPTEK"
- `.footer-info` - Info kontak
- `.footer-org` - Organisasi
- `.footer-address` - Alamat dengan icon
- `.footer-contact` - Kontak (email, web, telp, fax) dengan icon

#### Responsive Design
- Media queries untuk tablet (max-width: 991px)
- Media queries untuk mobile (max-width: 767px)
- Media queries untuk small mobile (max-width: 480px)

#### Pagination
- Custom styling untuk pagination dengan warna hijau

#### Utility Classes
- `.no-gutters` - Remove gutters dari Bootstrap grid

---

## 🎨 CSS Styling Highlights

### Color Palette
- **Primary Green:** `#28a745`
- **Dark Green:** `#1e7e34`
- **Light Green:** `#48b461`
- **Text Color:** `#333`
- **Secondary Text:** `#666`
- **Border:** `#e0e0e0`
- **Background:** `#f8f9fa`

### Typography
- **Footer Title:** 28px, 700 weight, uppercase, letter-spacing 1.5px
- **Archive Title:** 32px, 700 weight
- **Year Heading:** 24px, 700 weight
- **Issue Title:** 20px, 700 weight

### Effects
- Card hover: `transform: translateY(-3px)` + box-shadow
- Button hover: `transform: translateY(-2px)`
- Smooth transitions: `0.3s ease`
- Footer gradient: `linear-gradient(135deg, #1e7e34 0%, #28a745 50%, #48b461 100%)`

---

## 📦 File Tambahan yang Diperlukan

### Logo SINTA
**Path yang diharapkan:** `d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\images\sinta-logo.png`

**Cara menambahkan:**
1. Buat folder `images` di dalam `templates/` jika belum ada:
   ```
   mkdir d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\images
   ```

2. Download logo SINTA dari website resmi atau gunakan logo yang sudah ada

3. Simpan dengan nama `sinta-logo.png` di folder tersebut

4. Ukuran recommended: max-width 120px (akan auto-resize by CSS)

**Alternatif jika tidak ada logo:**
Ubah pada `issueArchive.tpl` baris sidebar INDEX BY:
```smarty
{* Ganti ini: *}
<img src="{$baseUrl}/plugins/themes/bootstrap3/templates/images/sinta-logo.png" alt="SINTA" class="img-responsive index-logo">

{* Dengan ini: *}
<p style="text-align: center; font-size: 18px; font-weight: bold; color: #28a745;">SINTA</p>
```

---

## 🚀 Cara Menerapkan Perubahan

### 1. Refresh Cache OJS
Setelah semua file dimodifikasi, clear cache OJS:

```bash
# Via command line
cd d:\Code\ojs\ojs
php tools/runScheduledTasks.php

# Atau via browser
# Akses: http://localhost:8080/index.php/index/admin/settings
# Klik "Clear Data Caches" atau "Clear Template Cache"
```

### 2. Reload Browser
- Hard refresh: `Ctrl + Shift + R` (Chrome/Firefox)
- Clear browser cache jika perlu

### 3. Verifikasi Perubahan

**Archive Page** (`/index.php/journaldit/issue/archive`)
- ✅ Sidebar kiri muncul dengan 5 tombol navigasi hijau
- ✅ Section INDEX BY muncul di bawah sidebar
- ✅ Issues dikelompokkan per tahun
- ✅ Card issue dengan cover di kiri dan info di kanan

**Issue TOC Page** (`/index.php/journaldit/issue/view/123`)
- ✅ Cover dalam card styling
- ✅ Spacing dan alignment rapi
- ✅ Section header berwarna hijau

**Footer** (Semua halaman)
- ✅ Background gradient hijau
- ✅ Full width layout
- ✅ Icon muncul di setiap kontak
- ✅ Text berwarna putih

---

## 🔧 Troubleshooting

### Problem: CSS tidak load
**Solution:**
1. Cek apakah file `riptek-archive-custom.css` ada di: 
   `d:\Code\ojs\ojs\plugins\themes\bootstrap3\styles/`
2. Cek apakah `BootstrapThreeThemePlugin.php` sudah di-save
3. Clear cache OJS
4. Restart server Docker jika menggunakan Docker:
   ```bash
   docker-compose restart
   ```

### Problem: Sidebar tidak muncul
**Solution:**
1. Cek apakah template `issueArchive.tpl` sudah tersimpan dengan benar
2. Verifikasi tidak ada syntax error di Smarty template
3. Cek error log OJS di `files/error.log`

### Problem: Footer masih tampilan lama
**Solution:**
1. Hard refresh browser: `Ctrl + Shift + R`
2. Clear template cache di admin panel
3. Verifikasi file `footer.tpl` sudah di-overwrite

### Problem: Logo SINTA tidak muncul
**Solution:**
1. Pastikan file `sinta-logo.png` ada di path yang benar
2. Cek permission file (harus readable)
3. Gunakan alternative text jika logo tidak tersedia (lihat section File Tambahan)

---

## 📝 Catatan Penting

### ⚠️ Backup
Semua file original sudah ada backup di folder `backups/` dengan timestamp.

### ⚠️ Upgrade OJS
Jika upgrade OJS ke versi baru:
1. Backup semua file yang sudah dimodifikasi
2. Setelah upgrade, cek apakah template masih berfungsi
3. Re-apply perubahan jika ada conflict

### ⚠️ Child Theme (Recommended)
Untuk production, disarankan membuat child theme agar tidak tertimpa saat update OJS:
1. Copy folder `bootstrap3` menjadi `bootstrap3-riptek`
2. Rename plugin class
3. Update file `version.xml`
4. Aktifkan child theme di admin panel

### ⚠️ Testing
Test pada:
- ✅ Desktop (1920x1080, 1366x768)
- ✅ Tablet (768px)
- ✅ Mobile (375px, 480px)
- ✅ Different browsers (Chrome, Firefox, Safari, Edge)

---

## 📸 Referensi Visual

Semua perubahan mengikuti screenshot yang diberikan:
1. **Archive Page:** Layout dua kolom dengan sidebar navigasi dan card issue modern
2. **Footer:** Background hijau gradient dengan layout full width

---

## 👤 Author & Maintenance

**Modified by:** GitHub Copilot  
**Date:** November 17, 2025  
**Version:** 1.0  
**OJS Version:** 3.x  
**Theme:** Bootstrap 3  

---

## 📞 Support

Jika ada pertanyaan atau issue:
1. Cek dokumentasi OJS: https://docs.pkp.sfu.ca/
2. Forum OJS: https://forum.pkp.sfu.ca/
3. Check error log: `files/error.log`

---

**✨ Selamat! Semua perubahan UI Jurnal Riptek sudah selesai diimplementasikan! ✨**

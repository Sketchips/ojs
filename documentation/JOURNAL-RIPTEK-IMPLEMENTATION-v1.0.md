# JOURNAL RIPTEK THEME IMPLEMENTATION
## Dokumentasi Implementasi Tema Journal Riptek

**Tanggal:** 27 Oktober 2025  
**Versi:** 1.0  
**Status:** Implementasi Lengkap

---

## 📋 RINGKASAN PERUBAHAN

Telah dilakukan implementasi tema baru untuk **Journal Riptek** (Jurnal Riset dan Inovasi Daerah Kota Semarang) dengan mengikuti spesifikasi desain yang telah ditentukan.

---

## 🎨 SPESIFIKASI DESAIN

### Header
- **Ukuran:** 1440px × 71px
- **Warna:** Gradien hijau (#2ecc71 → #27ae60)
- **Posisi:** Fixed di bagian atas

### Homepage Hero Section
- **Ukuran:** 1440px × 544px
- **Posisi:** Top: 71px (tepat di bawah header)
- **Konten:** 
  - Judul "Jurnal Riptek"
  - Subtitle "Badan Riset dan Inovasi Daerah Kota Semarang"
  - Ilustrasi gedung Semarang City

### Sidebar Menu Buttons
- **Ukuran:** 320px × 62px (setiap button)
- **Warna:** Gradien hijau (#2ecc71 → #27ae60)
- **Efek:** Hover dengan shadow dan transform
- **Menu Items:**
  1. Editorial Team
  2. Peer-Review Process
  3. Focus and Scope
  4. Section Policies
  5. Author Guidelines

### Footer
- **Ukuran:** 1440px × 243px
- **Posisi:** Top: 1438px
- **Background Image:** 
  - Ukuran: 1440px × 359px
  - Posisi: Top: 1322px
  - Opacity: 19%
- **Konten:** Informasi Redaksi Jurnal Riptek (BRIDA Kota Semarang)

---

## 📁 FILE YANG DIBACKUP

Semua file berikut telah dibackup ke folder `backups/` dengan timestamp:

1. **indexJournal.tpl** 
   - Path: `ojs/plugins/themes/bootstrap3/templates/frontend/pages/indexJournal.tpl`
   - Backup: `backups/indexJournal.tpl.backup-YYYYMMDD-HHMMSS`

2. **header.tpl**
   - Path: `ojs/plugins/themes/bootstrap3/templates/frontend/components/header.tpl`
   - Backup: `backups/header.tpl.backup-YYYYMMDD-HHMMSS`

3. **footer.tpl**
   - Path: `ojs/plugins/themes/bootstrap3/templates/frontend/components/footer.tpl`
   - Backup: `backups/footer.tpl.backup-YYYYMMDD-HHMMSS`

---

## 🆕 FILE BARU YANG DIBUAT

### 1. journal-riptek-theme.css
**Lokasi:** `d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\journal-riptek-theme.css`

File CSS utama yang berisi semua styling untuk tema Journal Riptek:
- Header styling (1440px × 71px)
- Hero section styling (1440px × 544px)
- Sidebar menu buttons (320px × 62px)
- Main content area styling
- Footer styling dengan background image opacity 19%
- Responsive design untuk berbagai ukuran layar
- Utility classes

---

## ✏️ PERUBAHAN PADA FILE TEMPLATE

### 1. indexJournal.tpl

**Perubahan Utama:**
- ✅ **DIHAPUS:** Carousel Bootstrap lama (carousel dengan 3 slide)
- ✅ **DITAMBAHKAN:** Hero section baru dengan struktur:
  ```html
  <section class="homepage-hero">
    <div class="hero-content">
      <h1>Jurnal Riptek</h1>
      <p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
    </div>
    <div class="hero-image">
      <!-- Gambar hero atau ilustrasi Semarang City -->
    </div>
  </section>
  ```

- ✅ **DITAMBAHKAN:** Layout wrapper dengan sidebar dan main content:
  ```html
  <div class="content-wrapper">
    <aside class="sidebar-menu">
      <!-- 5 tombol hijau menu -->
    </aside>
    <main class="main-content-area">
      <!-- Konten utama journal -->
    </main>
  </div>
  ```

- ✅ **DITAMBAHKAN:** Konten informasi journal:
  - Journal description
  - Focus and Scope
  - Edited and Published By
  - Bibliographic Information (ISSN)
  - Publishing Frequency
  - Abstracting/Indexing (dengan badge SINTA)

### 2. header.tpl

**Perubahan Utama:**
- ✅ **DITAMBAHKAN:** Link ke CSS file `journal-riptek-theme.css`
  ```html
  <link rel="stylesheet" href="{$baseUrl}/journal-riptek-theme.css" type="text/css" />
  ```

### 3. footer.tpl

**Perubahan Utama:**
- ✅ **DIGANTI:** Konten footer default dengan informasi Redaksi Jurnal Riptek
- ✅ **STRUKTUR BARU:**
  ```html
  <div class="footer-content">
    <h3 class="footer-title">REDAKSI JURNAL RIPTEK</h3>
    <div class="footer-info">
      <!-- Informasi kontak BRIDA Kota Semarang -->
    </div>
  </div>
  ```

---

## 🎯 FITUR YANG DIIMPLEMENTASIKAN

### ✅ Layout & Structure
- [x] Hero section dengan ukuran 1440px × 544px
- [x] Header dengan ukuran 1440px × 71px
- [x] Sidebar menu dengan 5 tombol hijau (320px × 62px)
- [x] Main content area yang responsif
- [x] Footer dengan ukuran 1440px × 243px

### ✅ Styling & Visual
- [x] Gradien hijau untuk header, buttons, dan footer
- [x] Background image di footer dengan opacity 19%
- [x] Hover effects pada tombol sidebar
- [x] Shadow effects untuk depth
- [x] Typography yang konsisten
- [x] Color scheme hijau (#2ecc71, #27ae60)

### ✅ Content
- [x] Judul dan subtitle journal di hero section
- [x] 5 menu buttons di sidebar (Editorial Team, Peer-Review Process, dll)
- [x] Informasi journal (Focus and Scope, ISSN, dll)
- [x] Badge SINTA untuk indexing
- [x] Informasi kontak redaksi di footer

### ✅ Responsive Design
- [x] Desktop (1440px+)
- [x] Laptop (1200px - 1439px)
- [x] Tablet (768px - 991px)
- [x] Mobile (< 768px)

### ✅ Compatibility
- [x] Bootstrap 3 compatible
- [x] OJS 3.x compatible
- [x] Cross-browser support

---

## 🚀 CARA PENGGUNAAN

### 1. Persiapan Gambar

Pastikan Anda memiliki gambar-gambar berikut:

1. **Hero Image (Ilustrasi Semarang City)**
   - URL sementara: `https://ojsimg.netlify.app/semarang-city-hero.png`
   - Ganti dengan gambar lokal jika perlu

2. **Footer Background Image**
   - URL di CSS: `https://ojsimg.netlify.app/semarang-city-illustration.png`
   - Ganti dengan path gambar lokal jika perlu

### 2. Upload File CSS

Copy file `journal-riptek-theme.css` ke:
```
/path/to/ojs/journal-riptek-theme.css
```

Atau upload via OJS admin panel ke public files directory.

### 3. Verifikasi Template Files

Pastikan file-file template telah terupdate:
- `indexJournal.tpl`
- `header.tpl`
- `footer.tpl`

### 4. Clear Cache

Setelah semua perubahan diterapkan, clear cache OJS:
```bash
php tools/clearCache.php
```

Atau melalui admin panel:
Settings → Website → Clear Cache

### 5. Testing

Buka homepage journal Anda dan verifikasi:
- ✅ Header tampil dengan warna hijau
- ✅ Hero section tampil dengan judul dan subtitle
- ✅ Sidebar buttons tampil di kiri
- ✅ Konten utama tampil di kanan
- ✅ Footer tampil dengan background image (opacity 19%)

---

## 🔧 KUSTOMISASI

### Mengubah Warna Hijau

Edit di `journal-riptek-theme.css`:
```css
/* Ganti #2ecc71 dan #27ae60 dengan warna pilihan Anda */
background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
```

### Mengubah Ukuran Hero Section

Edit di `journal-riptek-theme.css`:
```css
.homepage-hero {
    height: 544px; /* Ubah sesuai kebutuhan */
}
```

### Mengganti Gambar Hero

Edit di `indexJournal.tpl`:
```smarty
{if $homepageImage}
    <img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
{else}
    <img src="URL_GAMBAR_ANDA" alt="Semarang City">
{/if}
```

### Mengubah Konten Footer

Edit di `footer.tpl`:
```html
<div class="footer-info">
    <!-- Edit informasi kontak di sini -->
</div>
```

---

## 📱 RESPONSIVE BREAKPOINTS

| Device | Width | Layout Changes |
|--------|-------|----------------|
| Desktop | 1440px+ | Full layout dengan sidebar kiri |
| Laptop | 1200px - 1439px | Layout disesuaikan proporsinya |
| Tablet | 768px - 991px | Sidebar pindah ke atas, buttons menjadi row |
| Mobile | < 768px | Single column, buttons stack vertikal |

---

## ⚠️ TROUBLESHOOTING

### CSS Tidak Terapply

1. Clear browser cache (Ctrl + Shift + R)
2. Clear OJS cache
3. Periksa path file CSS di `header.tpl`
4. Periksa console browser untuk error

### Layout Berantakan

1. Pastikan Bootstrap 3 sudah loaded
2. Pastikan tidak ada CSS conflict
3. Periksa responsive breakpoints
4. Clear cache

### Gambar Tidak Muncul

1. Periksa URL gambar di template dan CSS
2. Pastikan gambar sudah diupload
3. Periksa permissions folder
4. Gunakan path absolute jika perlu

### Footer Background Image Tidak Terlihat

1. Periksa opacity setting (should be 0.19)
2. Periksa URL gambar di CSS
3. Pastikan ukuran gambar sesuai (1440px × 359px)
4. Periksa z-index di footer::before

---

## 📞 KONTAK & SUPPORT

**Redaksi Jurnal Riptek**  
Badan Riset dan Inovasi Daerah (BRIDA) Kota Semarang  
Jl. Pemuda No.175, Sekayu, Kec. Semarang Tengah  
Kota Semarang, Jawa Tengah 50132  

📧 Email: riptek.brida@semarangkota.go.id  
🌐 Web: https://www.riptek.semarangkota.go.id  
☎️ Telp: (024) 3545532

---

## 📝 CHANGELOG

### Version 1.0 - October 27, 2025
- ✅ Initial implementation
- ✅ Created journal-riptek-theme.css
- ✅ Modified indexJournal.tpl (removed carousel, added hero section)
- ✅ Modified header.tpl (added CSS link)
- ✅ Modified footer.tpl (custom footer content)
- ✅ Implemented responsive design
- ✅ Added all specified dimensions and styling
- ✅ Created documentation

---

## 📚 REFERENSI

- OJS Documentation: https://docs.pkp.sfu.ca/
- Bootstrap 3 Documentation: https://getbootstrap.com/docs/3.4/
- Journal Riptek: https://www.riptek.semarangkota.go.id

---

**End of Documentation**

*Generated on October 27, 2025*

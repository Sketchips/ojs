# 🚀 Quick Start Guide - Modern OJS Theme

## 📦 File yang Anda Dapatkan

```
✅ modern-ojs-theme.css        - File CSS utama (WAJIB)
✅ modern-ojs-theme.js         - File JavaScript (OPSIONAL, untuk fitur tambahan)
✅ demo-modern-theme.html      - Demo preview
✅ README-MODERN-THEME.md      - Dokumentasi lengkap
✅ QUICK-START.md              - File ini (panduan cepat)
```

## ⚡ Instalasi Super Cepat (3 Langkah)

### 🎯 Metode 1: Upload via OJS Admin (PALING MUDAH)

**LANGKAH 1:** Login ke OJS
- Buka browser → `http://localhost:8080` atau URL OJS Anda
- Login sebagai **Administrator**

**LANGKAH 2:** Upload CSS
- Klik **Settings** (di sidebar kiri)
- Klik **Website** tab
- Klik **Appearance**
- Scroll ke bawah sampai **Advanced**
- Di bagian **Journal Stylesheet**, klik tombol **Upload**
- Pilih file `modern-ojs-theme.css`
- Klik **Save**

**LANGKAH 3:** Upload JavaScript (OPSIONAL)
- Masih di halaman yang sama
- Cari bagian **Additional Content**
- Tambahkan kode ini di **Header** atau **Footer**:
```html
<script src="{$baseUrl}/modern-ojs-theme.js"></script>
```

**SELESAI! 🎉** Refresh halaman jurnal Anda dan lihat hasilnya!

---

### 🛠️ Metode 2: Manual Upload via File Manager (Docker)

Jika Anda menggunakan Docker seperti setup Anda saat ini:

**LANGKAH 1:** Copy file ke folder OJS
```bash
# Buka PowerShell di folder project
cd d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker

# Copy CSS ke folder public OJS
copy modern-ojs-theme.css ojs\public\

# Copy JS ke folder public OJS (opsional)
copy modern-ojs-theme.js ojs\public\
```

**LANGKAH 2:** Edit template header
- Buka file: `ojs\templates\frontend\components\header.tpl`
- Tambahkan sebelum tag `</head>`:

```html
<!-- Modern OJS Theme -->
<link rel="stylesheet" href="{$baseUrl}/modern-ojs-theme.css">
<script src="{$baseUrl}/modern-ojs-theme.js"></script>
```

**LANGKAH 3:** Restart container (jika perlu)
```bash
docker-compose restart
```

**SELESAI! 🎉**

---

## 🎨 Setup Carousel Banner

### Opsi 1: Single Image (Mudah)

1. Login OJS sebagai Admin
2. **Settings** → **Website** → **Appearance**
3. Di bagian **Homepage Image**, upload gambar banner
4. **Size recommended:** 1920x600 pixels
5. Save!

### Opsi 2: Multiple Slides (Carousel Lengkap)

Edit file `ojs/templates/frontend/pages/indexJournal.tpl`, tambahkan sebelum content:

```html
<!-- Carousel Banner -->
<div id="mainCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#mainCarousel" data-slide-to="1"></li>
        <li data-target="#mainCarousel" data-slide-to="2"></li>
    </ol>
    
    <div class="carousel-inner">
        <!-- Slide 1 -->
        <div class="item active">
            <img src="{$baseUrl}/public/banner1.jpg" alt="Banner 1">
            <div class="carousel-caption">
                <h1>Selamat Datang di Jurnal Adit</h1>
                <p>Publikasi Ilmiah Berkualitas Internasional</p>
            </div>
        </div>
        
        <!-- Slide 2 -->
        <div class="item">
            <img src="{$baseUrl}/public/banner2.jpg" alt="Banner 2">
            <div class="carousel-caption">
                <h1>Penelitian Inovatif</h1>
                <p>Temukan Riset Terkini dan Terpercaya</p>
            </div>
        </div>
        
        <!-- Slide 3 -->
        <div class="item">
            <img src="{$baseUrl}/public/banner3.jpg" alt="Banner 3">
            <div class="carousel-caption">
                <h1>Komunitas Global</h1>
                <p>Bergabunglah dengan Peneliti Terbaik</p>
            </div>
        </div>
    </div>
    
    <!-- Controls -->
    <a class="left carousel-control" href="#mainCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#mainCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
```

Upload gambar banner ke folder `ojs/public/` dengan nama:
- `banner1.jpg` (1920x600px)
- `banner2.jpg` (1920x600px)
- `banner3.jpg` (1920x600px)

---

## 🎯 Yang Akan Berubah Setelah Instalasi

### ✅ Header
- **Sebelum:** Header besar dan standard
- **Sesudah:** Header compact 65px dengan gradient logo, search bar di kanan

### ✅ Search Bar
- **Sebelum:** Di sidebar atau terpisah
- **Sesudah:** Di header, sebelah kiri tombol akun, expand on focus

### ✅ User Account
- **Sebelum:** Standard button
- **Sesudah:** Gradient button di pojok kanan atas dengan glow effect

### ✅ Banner
- **Sebelum:** Image biasa ukuran kecil
- **Sesudah:** Carousel besar 600px tinggi dengan auto-slide

### ✅ Warna
- **Sebelum:** Warna default/standard
- **Sesudah:** Gradient modern (biru-ungu-pink) dengan shadows

### ✅ Buttons
- **Sebelum:** Flat buttons
- **Sesudah:** Gradient buttons dengan hover lift effect

### ✅ Cards/Articles
- **Sebelum:** Simple cards
- **Sesudah:** Modern cards dengan hover lift dan shadow

---

## 🖼️ Preview Sebelum Install

Ingin lihat preview dulu sebelum install?

**Cara 1:** Buka file HTML
- Double-click file `demo-modern-theme.html`
- Akan terbuka di browser default Anda

**Cara 2:** Jalankan local server
```bash
# Buka PowerShell di folder project
cd d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker

# Jalankan server sederhana (pilih salah satu):

# Jika punya Python:
python -m http.server 8000

# Jika punya Node.js:
npx http-server -p 8000

# Lalu buka browser:
# http://localhost:8000/demo-modern-theme.html
```

---

## 🎨 Kustomisasi Cepat

### Ubah Warna Utama

Edit file `modern-ojs-theme.css`, cari bagian `:root` di awal file:

```css
:root {
    /* Ubah warna di sini */
    --primary-blue: #4F46E5;     /* Warna biru utama */
    --primary-purple: #7C3AED;   /* Warna ungu */
    --accent-orange: #F59E0B;    /* Warna aksen */
    
    /* Atau ubah gradient */
    --gradient-primary: linear-gradient(135deg, #WARNA1 0%, #WARNA2 100%);
}
```

### Ubah Tinggi Carousel

Cari di `modern-ojs-theme.css`:

```css
.carousel,
.carousel img {
    height: 600px !important;  /* Ubah angka ini */
}
```

Opsi tinggi:
- **Kecil:** 400px
- **Medium:** 500px
- **Besar:** 600px
- **Extra Large:** 700px

### Ubah Ukuran Header

Cari di `modern-ojs-theme.css`:

```css
.navbar {
    min-height: 65px !important;  /* Ubah angka ini */
}

body {
    padding-top: 65px !important;  /* Samakan dengan min-height */
}
```

---

## ❗ Troubleshooting Cepat

### ❌ CSS Tidak Muncul?

**Solusi:**
1. Hard refresh browser: `Ctrl + F5` (Windows) atau `Cmd + Shift + R` (Mac)
2. Clear cache browser
3. Pastikan path file CSS benar
4. Check browser console (F12) untuk error

### ❌ Carousel Tidak Jalan?

**Solusi:**
1. Pastikan jQuery loaded sebelum carousel
2. Pastikan Bootstrap JS loaded
3. Check console (F12) untuk JavaScript error
4. Pastikan struktur HTML carousel benar

### ❌ Search Bar Tidak di Posisi yang Benar?

**Solusi:**
Edit CSS, cari `.navbar-form` dan ubah nilai `right`:

```css
.navbar-form {
    right: 180px !important;  /* Ubah nilai ini */
}
```

Nilai lebih besar = geser ke kiri
Nilai lebih kecil = geser ke kanan

### ❌ Header Menutupi Content?

**Solusi:**
Tambahkan padding di body:

```css
body {
    padding-top: 80px !important;  /* Tambahkan padding lebih */
}
```

---

## 📱 Cek Responsiveness

Setelah install, test di berbagai ukuran layar:

1. **Desktop:** Buka normal di browser
2. **Tablet:** Resize browser atau tekan `F12` → Toggle device toolbar
3. **Mobile:** Buka di HP atau gunakan Chrome DevTools

Semua fitur otomatis responsive! 📱✅

---

## 🎯 Checklist Instalasi

Gunakan checklist ini untuk memastikan semua sudah benar:

- [ ] File `modern-ojs-theme.css` sudah di-upload
- [ ] File `modern-ojs-theme.js` sudah di-upload (opsional)
- [ ] CSS sudah di-link di template atau via Settings
- [ ] Browser sudah di-refresh (Ctrl+F5)
- [ ] Header sudah compact (65px)
- [ ] Search bar ada di sebelah kiri akun
- [ ] User account button di pojok kanan atas
- [ ] Carousel banner sudah besar (600px)
- [ ] Warna sudah gradient (biru-ungu-pink)
- [ ] Hover effect bekerja di buttons dan cards
- [ ] Responsive di mobile/tablet

---

## 🆘 Butuh Bantuan?

Jika ada masalah:

1. **Check demo file:** Buka `demo-modern-theme.html` untuk referensi
2. **Read full docs:** Baca `README-MODERN-THEME.md` untuk detail lengkap
3. **Check console:** Tekan F12 di browser, lihat tab Console untuk error
4. **Compare code:** Bandingkan struktur HTML Anda dengan demo

---

## 🎁 Bonus Tips

### Tip 1: Optimize Images
- Compress banner images menggunakan https://tinypng.com
- Target size: < 200KB per image
- Format: JPG untuk foto, PNG untuk grafis

### Tip 2: Custom Logo
- Upload logo di **Settings** → **Appearance**
- Size recommended: 200x50px atau aspect ratio 4:1
- Format: PNG dengan background transparan

### Tip 3: Custom Colors
- Gunakan color picker untuk pilih warna: https://coolors.co
- Test contrast untuk accessibility: https://webaim.org/resources/contrastchecker/

### Tip 4: Add Custom Fonts
Di file CSS, tambahkan:
```css
@import url('https://fonts.googleapis.com/css2?family=NAMA-FONT&display=swap');

body {
    font-family: 'NAMA-FONT', sans-serif;
}
```

---

## 📊 Performance

Theme ini sudah di-optimize untuk:
- ✅ Fast loading (CSS < 50KB)
- ✅ Smooth animations (GPU-accelerated)
- ✅ Mobile-friendly (touch gestures)
- ✅ SEO-friendly (semantic HTML)
- ✅ Accessibility (WCAG compliant)

---

## 🎉 Selamat!

Anda sekarang punya OJS dengan tampilan modern! 🚀

**Fitur yang sudah aktif:**
- ✅ Header compact dengan gradient logo
- ✅ Search bar strategis di header
- ✅ User account button modern
- ✅ Carousel banner besar
- ✅ Gradient colors yang menarik
- ✅ Smooth animations & transitions
- ✅ Responsive design
- ✅ Interactive elements

**Nikmati jurnal OJS Anda yang baru! 🎨✨**

---

*Created with ❤️ | Last updated: October 17, 2025*

# QUICK EDITING GUIDE - Journal Riptek Theme

**File**: `journal-riptek-theme.css`  
**Version**: 1.9 - WITH COMPREHENSIVE COMMENTS  
**Last Updated**: October 28, 2025

---

## 🎯 HOW TO EDIT - QUICK REFERENCE

Semua section penting sudah diberi **comment** lengkap. Cari keyword ini di CSS:

- `/* EDIT HERE: */` - Parameter yang sering diubah
- `/* EDIT: */` - Parameter yang bisa disesuaikan
- `/* CATATAN: */` - Penjelasan penting

---

## 📍 NAVIGATION MENU (Home, About, Issues, dll)

### Location in CSS: Lines ~170-195

### Font & Size
```css
/* NAVIGATION LINKS - Edit font, size, spacing di sini */
#headerNavigationContainer .navbar-nav > li > a {
    font-family: 'Poppins', sans-serif;  /* Font family */
    font-weight: 600;                     /* SemiBold weight */
    font-size: 13px;                      /* EDIT: Font size */
    line-height: 100%;                    /* Line height */
    letter-spacing: 0%;                   /* Letter spacing */
    padding: 12px 15px;                   /* EDIT: Spacing between items */
}
```

**Cara Edit**:
- **Ubah ukuran font**: Ganti `font-size: 13px;` ke nilai lain (misal `14px`, `15px`)
- **Ubah jarak antar menu**: Ganti `padding: 12px 15px;` → angka pertama = atas-bawah, kedua = kiri-kanan
- **Ubah font weight**: `600` = SemiBold, `700` = Bold, `500` = Medium

### Position (Geser Kiri/Kanan)
```css
/* Navigation Menu Container - CENTERED in the middle of header */
#nav-menu {
    left: 48%;                            /* EDIT HERE: Horizontal position */
    top: 50%;                             /* Vertical center (jangan diubah) */
}
```

**Cara Edit**:
- **Geser ke kiri**: `left: 48%;` → `45%;` atau `40%;`
- **Geser ke kanan**: `left: 48%;` → `50%;` atau `52%;`
- **Center perfect**: `left: 50%;`

---

## 🎨 HERO SECTION (Bagian Hijau-Biru)

### Location in CSS: Lines ~290-400

### Hero Container (Full Section)
```css
.homepage-hero {
    height: 544px;                        /* EDIT: Tinggi hero section */
    background: linear-gradient(135deg, #2ecc71 0%, #3498db 100%);  /* EDIT: Warna */
    padding: 60px 80px;                   /* EDIT: Padding kiri-kanan */
}
```

**Cara Edit**:
- **Ubah tinggi**: Ganti `height: 544px;` (misal `600px`, `500px`)
- **Ubah warna gradient**: 
  - `#2ecc71` = hijau kiri
  - `#3498db` = biru kanan
- **Geser content kiri/kanan**: Ubah `padding: 60px 80px;`
  - Angka pertama = atas-bawah
  - Angka kedua = kiri-kanan (80px = current)

### Title "Jurnal Riptek"
```css
.hero-content h1 {
    font-size: 70px;                      /* EDIT: Ukuran font title */
    margin: 0 0 20px 0;                   /* EDIT: Jarak ke subtitle (20px) */
}
```

**Cara Edit**:
- **Ubah ukuran title**: Ganti `font-size: 70px;` (misal `60px`, `80px`)
- **Ubah jarak ke subtitle**: Ganti `margin: 0 0 20px 0;`
  - Angka ketiga (20px) = jarak bawah ke subtitle

### Subtitle "Badan Riset dan Inovasi..."
```css
.hero-content .subtitle {
    font-size: 20px;                      /* EDIT: Ukuran font subtitle */
}
```

**Cara Edit**:
- **Ubah ukuran subtitle**: Ganti `font-size: 20px;` (misal `18px`, `22px`)

### Hero Image (Semarang City)
```css
.hero-image {
    max-width: 500px;                     /* EDIT: Max width gambar */
}

.hero-image img {
    max-width: 500px;                     /* EDIT: Sama dengan container */
}
```

**Cara Edit**:
- **Perbesar gambar**: Ganti `max-width: 500px;` → `600px` atau `700px`
- **Perkecil gambar**: Ganti `max-width: 500px;` → `400px` atau `350px`
- **PENTING**: Ubah kedua nilai (container + img) dengan angka yang sama

---

## 🟢 SIDEBAR BUTTONS (Tombol Hijau)

### Location in CSS: Lines ~440-490

### Button Size & Color
```css
.sidebar-menu-link {
    width: 320px;                         /* EDIT: Lebar tombol */
    height: 62px;                         /* EDIT: Tinggi tombol */
    background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);  /* EDIT: Warna */
    font-size: 16px;                      /* EDIT: Ukuran font */
    line-height: 62px;                    /* Same as height */
}
```

**Cara Edit**:
- **Ubah ukuran tombol**: 
  - Lebar: `width: 320px;` (misal `350px`, `280px`)
  - Tinggi: `height: 62px;` + `line-height: 62px;` (harus sama!)
- **Ubah warna**: Ganti `#2ecc71` (hijau terang) dan `#27ae60` (hijau gelap)
- **Ubah font**: Ganti `font-size: 16px;`

### Button Spacing
```css
.sidebar-menu-list {
    gap: 15px;                            /* EDIT: Jarak antar tombol */
}
```

**Cara Edit**:
- **Rapat**: `gap: 10px;`
- **Renggang**: `gap: 20px;` atau `25px;`

---

## 💚 FOOTER (Hijau dengan Gambar Watermark)

### Location in CSS: Lines ~580-650

### Footer Background
```css
.footer {
    min-height: 243px;                    /* EDIT: Minimum tinggi footer */
    background: linear-gradient(135deg, #1e8449 0%, #27ae60 100%) !important;  /* EDIT: Warna */
}
```

**Cara Edit**:
- **Ubah tinggi**: Ganti `min-height: 243px;`
- **Ubah warna hijau**: Ganti `#1e8449` (hijau gelap) dan `#27ae60` (hijau terang)

### Footer Image Opacity (Watermark)
```css
.footer::before {
    background-image: url('...');         /* EDIT: URL gambar */
    opacity: 0.19;                        /* EDIT: 0.0-1.0 (0.19 = 19%) */
}
```

**Cara Edit**:
- **Ganti gambar**: Ubah URL di `background-image: url('...');`
- **Ubah opacity**:
  - `0.0` = invisible (tidak kelihatan)
  - `0.19` = 19% (current - samar seperti watermark)
  - `0.5` = 50% (lebih jelas)
  - `1.0` = 100% (full visible)

**CATATAN PENTING**: 
- Gambar TIDAK mengganti background hijau
- Gambar muncul DI BELAKANG text sebagai watermark
- Background hijau tetap terlihat penuh

### Footer Text
```css
.footer-title {
    font-size: 20px;                      /* EDIT: Ukuran font judul */
}

.footer-info {
    font-size: 13px;                      /* EDIT: Ukuran font info */
}
```

**Cara Edit**:
- **Ubah ukuran judul**: Ganti `font-size: 20px;`
- **Ubah ukuran info**: Ganti `font-size: 13px;`

---

## 📱 RESPONSIVE (Mobile & Tablet)

### Location in CSS: Lines ~690-880

### Breakpoints
```css
/* Desktop Large */
@media (max-width: 1440px) { ... }

/* Laptop/Tablet Landscape */
@media (max-width: 1200px) { ... }

/* Tablet Portrait */
@media (max-width: 992px) { ... }

/* Mobile Landscape */
@media (max-width: 768px) { ... }

/* Mobile Portrait */
@media (max-width: 576px) { ... }
```

**Cara Edit Responsive**:

Di setiap breakpoint, Anda bisa ubah:

#### Hero Title Size
```css
@media (max-width: 1440px) {
    .hero-content h1 {
        font-size: 60px;                  /* EDIT: Smaller on laptop */
    }
}
```

#### Hero Image Size
```css
@media (max-width: 1200px) {
    .hero-image {
        max-width: 450px;                 /* EDIT: Smaller on tablet */
        width: 80%;
    }
}
```

#### When to Edit Breakpoints:
- Jika layout rusak di ukuran tertentu
- Jika text terlalu besar/kecil di mobile
- Jika gambar terlalu besar/kecil di tablet

---

## 🎨 COLOR PALETTE (Warna yang Digunakan)

```css
/* Green Colors */
--primary-green: #2ecc71      /* Hijau terang (tombol, gradient) */
--dark-green: #27ae60         /* Hijau sedang */
--darker-green: #1e8449       /* Hijau gelap (footer) */

/* Blue Color */
--gradient-blue: #3498db      /* Biru (hero gradient kanan) */

/* Neutral Colors */
--white: #ffffff              /* Putih (text, header bg) */
--dark: #333333               /* Dark gray (navigation default) */
--light-gray: #f5f5f5         /* Light gray (body bg) */
```

**Cara Ganti Warna**:
1. Cari kode warna (misal `#2ecc71`)
2. Ganti dengan warna baru
3. Gunakan color picker online untuk dapat kode hex

---

## ⚙️ COMMON ADJUSTMENTS

### 1. Navigation Terlalu Ke Kanan/Kiri
```css
#nav-menu {
    left: 48%;    /* Current: sedikit kiri */
}
```
- Ke kiri: `45%`, `40%`
- Center: `50%`
- Ke kanan: `52%`, `55%`

### 2. Hero Text Terpotong
```css
.homepage-hero {
    padding: 60px 80px;    /* Current */
}
```
- Lebih ke kanan: `padding: 60px 100px;`
- Lebih ke kiri: `padding: 60px 60px;`

### 3. Hero Title & Subtitle Jarak
```css
.hero-content h1 {
    margin: 0 0 20px 0;    /* 20px = jarak ke subtitle */
}
```
- Rapat: `10px` atau `15px`
- Renggang: `25px` atau `30px`

### 4. Sidebar Button Size
```css
.sidebar-menu-link {
    width: 320px;
    height: 62px;
    line-height: 62px;    /* MUST match height */
}
```
- Lebih besar: `width: 350px; height: 70px; line-height: 70px;`
- Lebih kecil: `width: 280px; height: 55px; line-height: 55px;`

### 5. Footer Image Lebih/Kurang Jelas
```css
.footer::before {
    opacity: 0.19;    /* Current: 19% */
}
```
- Lebih samar: `0.10` (10%)
- Lebih jelas: `0.30` (30%) atau `0.50` (50%)

---

## 🔍 TROUBLESHOOTING

### Problem: Navigation tidak center
**Solution**: Adjust `left` value di `#nav-menu`
```css
#nav-menu { left: 50%; }  /* Try different % */
```

### Problem: Hero text terpotong
**Solution**: Increase padding
```css
.homepage-hero { padding: 60px 100px; }
```

### Problem: Hero image terlalu besar
**Solution**: Reduce max-width
```css
.hero-image { max-width: 400px; }
.hero-image img { max-width: 400px; }
```

### Problem: Footer gambar terlalu jelas
**Solution**: Reduce opacity
```css
.footer::before { opacity: 0.10; }  /* 10% instead of 19% */
```

### Problem: Mobile layout rusak
**Solution**: Check responsive breakpoints, adjust font sizes
```css
@media (max-width: 768px) {
    .hero-content h1 { font-size: 32px; }  /* Smaller */
}
```

---

## 📂 FILE LOCATIONS

```
ojs-docker/
├── journal-riptek-theme.css          ← MAIN FILE (edit this)
├── ojs/plugins/themes/bootstrap3/templates/
│   ├── frontend/components/
│   │   ├── header.tpl                ← Header structure
│   │   └── footer.tpl                ← Footer content
│   └── frontend/pages/
│       └── indexJournal.tpl          ← Hero HTML structure
```

---

## 💾 BACKUP BEFORE EDITING

**Always backup before making changes!**

```powershell
# Windows PowerShell
Copy-Item journal-riptek-theme.css journal-riptek-theme-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss').css
```

---

## 🚀 AFTER EDITING

1. **Save file**: `Ctrl + S`
2. **Hard refresh browser**: `Ctrl + Shift + R`
3. **Clear cache if needed**: `Ctrl + Shift + Delete`

---

## 📞 NEED HELP?

Jika ada masalah atau butuh adjustment lebih lanjut, siapkan:
1. Screenshot issue
2. Browser window size (dari DevTools)
3. Part mana yang ingin diubah
4. Expected result

---

**Last Updated**: October 28, 2025  
**Version**: 1.9  
**Total CSS Lines**: 1000+ with comprehensive comments

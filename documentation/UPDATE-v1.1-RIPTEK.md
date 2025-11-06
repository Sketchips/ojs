# JOURNAL RIPTEK THEME - UPDATE v1.1

## 📅 Update Log - October 27, 2025

### 🔄 PERUBAHAN YANG DILAKUKAN

---

## ✨ UPDATE TERBARU (v1.1)

### 1. **Hero Section - Full Width** ✅
- Hero section sekarang **keluar dari grid Bootstrap**
- Menggunakan `width: 100vw` untuk full width
- Tidak terbatas oleh container Bootstrap

### 2. **Typography Updates** ✅

#### Hero Title "Jurnal Riptek"
- **Font:** Inria Serif (imported dari Google Fonts)
- **Size:** 128px
- **Weight:** 700 (Bold)
- **Color:** #ffffff (WHITE) ✅
- **Dimensions:** 804px × 153px
- **Position:** Top 246px, Left 89px
- **Line Height:** 100%
- **Letter Spacing:** 0%

#### Logo Header "Jurnal Riptek"
- **Font:** Poppins (imported dari Google Fonts)
- **Size:** 32px
- **Weight:** 700 (Bold)
- **Color:** #000000 (BLACK) ✅
- **Dimensions:** 222px × 47px
- **Position:** Top 13px, Left 39px
- **Line Height:** 100%
- **Letter Spacing:** 0%

### 3. **Header Navigation Updates** ✅
- **Default State:** WHITE (#ffffff)
- **Hover State:** GREEN (#2ecc71) ✅
- **Active/Current Page:** GREEN (#2ecc71) ✅
- **Fixed Position:** Header tetap di atas saat scroll
- **Logo:** Mengikuti header (fixed)

### 4. **Search Form** ✅
- **DIHAPUS** dari header
- Commented out di template
- Hidden via CSS

### 5. **Homepage Content** ✅
- **Articles & Issues:** DISEMBUNYIKAN ✅
- Hanya menampilkan:
  - Hero section
  - Sidebar menu
  - Journal information (Focus & Scope, ISSN, dll)
  - Announcements (jika ada)

### 6. **Navigation Menu Items** ✅
Menu sesuai spesifikasi:
- Home
- About
- Issues
- Submissions
- Announcements
- Contact
- Login (dengan icon 👤)

---

## 📁 FILE YANG DIUBAH

### 1. `journal-riptek-theme.css`
**Perubahan:**
- ✅ Import Google Fonts (Inria Serif & Poppins)
- ✅ Header fixed position dengan proper z-index
- ✅ Header navigation: white default, green on hover/active
- ✅ Logo header: Poppins 32px, black color, positioned
- ✅ Hero section: full width (100vw), absolute positioning
- ✅ Hero title: Inria Serif 128px, white color, positioned
- ✅ Search form hidden via CSS
- ✅ Articles/Issues hidden via CSS
- ✅ Body padding-top untuk fixed header
- ✅ Responsive updates

### 2. `header.tpl`
**Perubahan:**
- ✅ Search form commented out
- ✅ Navigation structure intact

### 3. `indexJournal.tpl`
**Perubahan:**
- ✅ Current issue section commented out
- ✅ Articles tidak ditampilkan di homepage

---

## 🎨 SPESIFIKASI DESAIN FINAL

### Header (71px height)
```
┌─────────────────────────────────────────────────────┐
│ Jurnal Riptek    Home About Issues ... Login 👤   │
│ (Poppins 32px)   (White, hover: Green)              │
└─────────────────────────────────────────────────────┘
Position: Fixed top
Background: Green gradient
Logo: Black, 222px × 47px
Navigation: White (hover/active: Green)
```

### Hero Section (544px height, Full Width)
```
╔═══════════════════════════════════════════════════╗
║                                                   ║
║   Jurnal Riptek                    [Semarang]   ║
║   (Inria Serif 128px, White)        [City Img]  ║
║                                                   ║
║   Badan Riset dan Inovasi...                     ║
║                                                   ║
╚═══════════════════════════════════════════════════╝
Width: 100vw (Full viewport width)
Background: Green-Blue gradient
Title: 804px × 153px at (89px, 246px)
```

### Main Content
```
┌──────────┬────────────────────────────────────┐
│ Sidebar  │  Journal Information               │
│ Buttons  │  (No Articles/Issues shown)        │
│ (Green)  │  - Focus & Scope                   │
│          │  - Publication Info                │
│          │  - ISSN                            │
│          │  - Indexing (SINTA)                │
└──────────┴────────────────────────────────────┘
```

---

## 🔧 CSS UPDATES DETAIL

### Google Fonts Import
```css
@import url('https://fonts.googleapis.com/css2?family=Inria+Serif:wght@700&family=Poppins:wght@700&display=swap');
```

### Header Fixed Position
```css
#headerNavigationContainer {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    width: 100%;
}

body {
    padding-top: 71px; /* Compensate for fixed header */
}
```

### Hero Full Width
```css
.homepage-hero {
    width: 100vw;
    max-width: 100%;
    margin-left: calc(-50vw + 50%);
}
```

### Typography Specifications
```css
/* Hero Title */
.hero-content h1 {
    font-family: 'Inria Serif', serif;
    font-size: 128px;
    font-weight: 700;
    line-height: 100%;
    letter-spacing: 0%;
    color: #ffffff;
    width: 804px;
    height: 153px;
}

/* Header Logo */
#headerNavigationContainer .navbar-brand {
    font-family: 'Poppins', sans-serif;
    font-size: 32px;
    font-weight: 700;
    line-height: 100%;
    letter-spacing: 0%;
    color: #000000;
    width: 222px;
    height: 47px;
    top: 13px;
    left: 39px;
}
```

### Navigation States
```css
/* Default - White */
#headerNavigationContainer .navbar-nav > li > a {
    color: #ffffff !important;
}

/* Hover - Green */
#headerNavigationContainer .navbar-nav > li > a:hover {
    color: #2ecc71 !important;
}

/* Active - Green */
#headerNavigationContainer .navbar-nav > li.active > a {
    color: #2ecc71 !important;
}
```

### Hide Elements
```css
/* Hide search */
.pull-md-right,
div[class*="search"] {
    display: none !important;
}

/* Hide articles/issues */
.page_index_journal .current_issue,
.page_index_journal .issue-toc,
.page_index_journal .articles {
    display: none !important;
}
```

---

## ✅ CHECKLIST FITUR

- [x] Hero section full width (keluar dari grid)
- [x] Search form dihapus
- [x] Hero title: Inria Serif 128px, white
- [x] Header logo: Poppins 32px, black
- [x] Navigation: white → green (hover/active)
- [x] Header fixed position dengan logo
- [x] Articles/Issues disembunyikan di homepage
- [x] Login dengan icon 👤
- [x] Menu items sesuai spesifikasi
- [x] Responsive design updated

---

## 🚀 CARA TESTING

### 1. Clear Cache
```bash
php tools/clearCache.php
```

### 2. Hard Refresh Browser
- Chrome/Edge: `Ctrl + Shift + R`
- Firefox: `Ctrl + F5`

### 3. Verifikasi
- ✅ Hero section full width (no padding sides)
- ✅ "Jurnal Riptek" di hero berwarna putih (Inria Serif 128px)
- ✅ Logo header berwarna hitam (Poppins 32px)
- ✅ Navigation links putih, hijau saat hover
- ✅ Search box tidak terlihat
- ✅ Tidak ada articles/issues di homepage
- ✅ Header tetap di atas saat scroll

---

## 📱 RESPONSIVE BEHAVIOR

### Desktop (1440px+)
- Hero full width dengan text positioned absolute
- Header fixed dengan logo kiri

### Laptop (1200px - 1439px)
- Hero title ukuran disesuaikan (96px)
- Hero section starts centering

### Tablet (768px - 991px)
- Hero section stacked vertical
- Header relative position (not fixed)
- Sidebar buttons horizontal

### Mobile (< 768px)
- Hero title 48px
- Single column layout
- Navigation collapsed

---

## ⚠️ CATATAN PENTING

1. **Google Fonts**: Membutuhkan koneksi internet untuk load fonts
2. **Fixed Header**: Body padding-top disesuaikan
3. **Full Width Hero**: Menggunakan viewport width calculation
4. **Absolute Positioning**: Hero content menggunakan absolute positioning
5. **CSS Specificity**: Menggunakan `!important` untuk override Bootstrap

---

## 🔮 FUTURE IMPROVEMENTS

- [ ] Add fallback fonts untuk offline
- [ ] Optimize font loading (font-display: swap)
- [ ] Add animation to hero section
- [ ] Implement sticky navigation on mobile
- [ ] Add loading states

---

**Update Complete! ✨**

*Version 1.1 - October 27, 2025*

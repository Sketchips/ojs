# Hero Section Customization Guide

## Overview
Hero section sekarang punya 3 elemen baru di pojok:
1. **Logo** - pojok kiri atas
2. **BRIDA Text** - di samping logo
3. **ISSN** - pojok kanan atas

---

## Cara Menambahkan Logo

### Metode 1: Via Template (Direkomendasikan)
Edit file template OJS yang render homepage hero section, biasanya ada di:
- `ojs/templates/frontend/pages/indexJournal.tpl` atau
- `ojs/lib/pkp/templates/frontend/components/header.tpl`

Tambahkan HTML ini di dalam `.homepage-hero`:

```html
<div class="hero-logo-wrapper">
    <img src="path/to/logo.png" alt="Logo" class="hero-logo">
    <div class="hero-brida-text">
        Badan Riset dan Inovasi Daerah Kota Semarang<br>
        Pemerintah Kota Semarang
    </div>
</div>
```

### Metode 2: Via CSS Background (Quick Fix)
Edit `styleSheet.css`, cari `.homepage-hero .hero-logo` (sekitar baris 598-601), ganti dengan:

```css
.homepage-hero .hero-logo {
    width: 60px;
    height: 60px;
    background-image: url('path/to/logo.png');
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
}
```

**Path Options:**
- Local: `../images/logo-brida.png` (simpan di `ojs/public/journals/1/images/`)
- External: `https://example.com/logo.png`

---

## Cara Mengubah Text BRIDA

Edit `styleSheet.css`, cari `.homepage-hero .hero-brida-text` (sekitar baris 603-612).

**Font Settings:**
- Font Family: `'Inria Serif', serif`
- Weight: `700` (Bold)
- Size: `13px` (PC), `11px` (Tablet), `9px` (Mobile)
- Line Height: `100%`
- Color: `#ffffff` (White with shadow)

**Mengubah Teks via HTML:**
Edit template homepage hero, ganti teks di dalam `.hero-brida-text`.

---

## Cara Mengubah ISSN

### Via Template (Direkomendasikan)
Tambahkan HTML ini di dalam `.homepage-hero`:

```html
<div class="hero-issn">
    ISSN: 2716-3482 (E) 1978-8320 (P)
</div>
```

### Via CSS ::before (Quick Fix)
Edit `styleSheet.css`, cari `.homepage-hero .hero-issn` (sekitar baris 615-624), tambahkan:

```css
.homepage-hero .hero-issn::before {
    content: "ISSN: 2716-3482 (E) 1978-8320 (P)";
}
```

---

## Responsive Breakpoints

| Breakpoint | Logo Size | BRIDA Text Size | ISSN Size |
|------------|-----------|-----------------|-----------|
| PC (≥993px) | 60px | 13px | 12px |
| Tablet (768-992px) | 50px | 11px | 10px |
| Mobile (≤767px) | 40px | 9px | 9px |

Edit di `styleSheet.css` baris:
- **Tablet**: Sekitar baris 1901-1916
- **Mobile**: Sekitar baris 2152-2176

---

## About Page Hero Image

About page sudah punya hero image Semarang City yang di-inject via CSS `::after` pseudo-element (baris 554-567).

**Current URL:**
```
https://ojsimg.netlify.app/semarang-landmark.png
```

**Cara Ganti Gambar:**
1. Upload foto baru ke server atau hosting
2. Edit `styleSheet.css` baris 562
3. Ganti URL: `background-image: url('NEW-URL-HERE') !important;`

**Jika Upload Lokal:**
- Simpan gambar di: `ojs/public/journals/1/images/semarang-city.png`
- Ganti URL jadi: `url('../images/semarang-city.png')`

---

## Troubleshooting

### Logo tidak muncul
- Cek path gambar benar (relative atau absolute)
- Pastikan file gambar ada di server
- Cek console browser untuk error 404

### Text BRIDA terlalu panjang/pendek
- Adjust `max-width` di `.hero-brida-text` (default: 280px PC, 220px tablet, 180px mobile)
- Tambahkan `<br>` untuk line break di HTML

### ISSN posisi salah
- Adjust `top` dan `right` values di `.hero-issn`
- Default: `top: 20px; right: 30px;`

### About page hero image tidak muncul
- Hero image di-inject via CSS `::after`, tidak perlu HTML element
- Gambar sudah load dari external URL (Netlify)
- Kalau mau ganti, edit baris 562 di `styleSheet.css`

---

## Backup & Rollback

Backup otomatis dibuat di:
```
backups/styleSheet-backup-20251110-072913.css
```

**Cara Rollback:**
```powershell
Copy-Item "backups\styleSheet-backup-20251110-072913.css" "ojs\public\journals\1\styleSheet.css"
```

Lalu refresh browser dengan **Ctrl+F5** (hard refresh).

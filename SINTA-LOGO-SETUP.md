# SINTA Logo Setup Guide

## Lokasi File

Logo SINTA harus disimpan di:
```
ojs/public/journals/1/sinta-logo.png
```

## Cara Upload Logo SINTA

### Option 1: Manual Upload via File Manager
1. Download logo SINTA dari: https://sinta.kemdikbud.go.id/assets/img/site/logo.png
2. Simpan file dengan nama: `sinta-logo.png`
3. Copy file ke folder: `ojs/public/journals/1/`

### Option 2: Via Docker Command
```bash
# Jika punya akses internet dari container
docker exec ojs-web wget https://sinta.kemdikbud.go.id/assets/img/site/logo.png -O /var/www/html/public/journals/1/sinta-logo.png

# Atau copy dari host ke container
docker cp sinta-logo.png ojs-web:/var/www/html/public/journals/1/
```

### Option 3: Via Host File System
Copy langsung file ke path:
```
d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\ojs\public\journals\1\sinta-logo.png
```

## Fallback Mechanism

Jika file `sinta-logo.png` tidak ditemukan, sistem akan otomatis menggunakan URL external:
```
https://sinta.kemdikbud.go.id/assets/img/site/logo.png
```

Ini sudah dikonfigurasi menggunakan `onerror` handler di semua template:
```html
<img src="{$publicFilesDir}/sinta-logo.png" 
     onerror="this.onerror=null; this.src='https://sinta.kemdikbud.go.id/assets/img/site/logo.png';" 
     alt="SINTA">
```

## Halaman yang Menggunakan Logo SINTA

Logo SINTA muncul di sidebar pada halaman berikut:
1. **Home** (`/index.php/jurnaladit`)
2. **About** dan sub-halaman (`/about`, `/about/editorialTeam`, dll)
3. **Announcements** (`/announcement`)
4. **Submissions** (`/about/submissions`)

## Files yang Sudah Diupdate

Template files yang menggunakan logo SINTA:
- `ojs/plugins/themes/bootstrap3/templates/frontend/pages/indexJournal.tpl`
- `ojs/plugins/themes/bootstrap3/templates/frontend/pages/submissions.tpl`
- `ojs/plugins/themes/bootstrap3/templates/frontend/components/sidebar.tpl` (untuk announcements)
- `ojs/plugins/themes/bootstrap3/templates/frontend/components/aboutSidebar.tpl` (untuk about pages)

## Verifikasi

Setelah upload, cek di browser:
1. Buka halaman home
2. Scroll ke sidebar
3. Logo SINTA harus muncul di bawah menu sidebar

Jika logo tidak muncul, buka browser console (F12) untuk cek error loading image.

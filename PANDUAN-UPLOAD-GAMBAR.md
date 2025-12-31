# 📸 Panduan Upload Gambar - Jurnal Riptek

## 🎯 Untuk Pengguna Awam (Non-Teknis)

Dokumen ini menjelaskan cara mengganti gambar-gambar di website Jurnal Riptek dengan **bahasa sederhana**.

---

## 📋 Daftar Gambar yang Bisa Diganti

Website Jurnal Riptek memiliki **3 gambar utama** yang bisa Anda ganti:

### 1. 🏛️ **Gambar Hero Homepage** (Semarang City)
- **Lokasi**: Halaman utama/homepage, bagian atas setelah header
- **Ukuran Ideal**: 550px x 450px
- **Format**: PNG atau JPG
- **Fungsi**: Menampilkan ilustrasi/foto kota Semarang

### 2. 🎓 **Logo SINTA** 
- **Lokasi**: Sidebar kiri, di bawah menu "Author Guidelines"
- **Ukuran Ideal**: 320px lebar (tinggi otomatis)
- **Format**: PNG (dengan background transparan)
- **Fungsi**: Badge/logo indeksasi SINTA

### 3. 🌆 **Background Footer**
- **Lokasi**: Bagian bawah website (footer hijau)
- **Ukuran Ideal**: 1440px x 359px
- **Format**: PNG atau JPG
- **Fungsi**: Background dekoratif dengan opacity 19%

---

## 🔧 Cara Upload Gambar

### **Metode 1: Upload Melalui Dashboard OJS** (MUDAH)

#### A. Login ke Dashboard Admin

1. Buka browser (Chrome/Firefox/Edge)
2. Ketik di address bar: `localhost:8080/index.php/jurnaladit`
3. Klik tombol **Login** di pojok kanan atas
4. Masukkan username dan password admin Anda
5. Anda akan masuk ke **Dashboard**

---

#### B. Upload Gambar Hero Homepage

**Langkah-langkah:**

1. Di Dashboard, klik menu **Settings** (Pengaturan)
2. Pilih **Website**
3. Cari bagian **Appearance** atau **Homepage Image**
4. Klik tombol **Upload** atau **Browse**
5. Pilih file gambar dari komputer Anda
   - Pastikan ukuran tidak lebih dari **2MB**
   - Format: JPG atau PNG
   - Resolusi ideal: **550 x 450 pixel**
6. Klik **Save** atau **Simpan**
7. Refresh halaman homepage untuk melihat perubahan

**💡 Tips:**
- Gunakan gambar ilustrasi Semarang City atau landmark kota
- Background gambar sebaiknya berwarna cerah karena akan ditampilkan di atas background hijau-biru
- Hindari gambar terlalu gelap agar tetap kontras

---

#### C. Ganti Logo SINTA

**Cara Manual (Edit File):**

1. Buka File Explorer
2. Pergi ke folder: `D:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\ojs\plugins\themes\bootstrap3\templates\frontend\pages\`
3. Cari file: `indexJournal.tpl`
4. Buka dengan **Notepad++** atau **VS Code**
5. Cari baris yang berisi:
   ```html
   <img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA">
   ```
6. Ganti URL dengan path gambar baru Anda:
   ```html
   <img src="http://localhost:8080/files/site/sinta-badge.png" alt="SINTA">
   ```
7. Save file (Ctrl+S)
8. Refresh browser

**💡 Tips:**
- Download logo SINTA resmi dari website SINTA
- Pastikan format PNG dengan background transparan
- Ukuran lebar maksimal 320px agar tidak terlalu besar

---

#### D. Ganti Background Footer

**Cara Manual (Edit CSS):**

1. Buka File Explorer
2. Pergi ke folder: `D:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\`
3. Cari file: `journal-riptek-theme.css`
4. Buka dengan **Notepad++** atau **VS Code**
5. Tekan `Ctrl+F` dan cari: `Footer Background Image`
6. Anda akan menemukan baris seperti ini:
   ```css
   background-image: url('https://ojsimg.netlify.app/semarang-landmark.png');
   ```
7. Ganti URL dengan path gambar baru:
   ```css
   background-image: url('http://localhost:8080/files/site/footer-bg.png');
   ```
8. Save file (Ctrl+S)
9. Refresh browser dengan **Ctrl+Shift+R** (hard refresh)

**💡 Tips:**
- Gunakan gambar siluet/ilustrasi landmark Semarang
- Gambar akan muncul dengan opacity 19% (transparan)
- Jangan gunakan gambar terlalu ramai/detail karena akan blur

---

### **Metode 2: Upload Gambar ke Server** (UNTUK YANG LEBIH PAHAM)

#### A. Siapkan File Gambar

1. Siapkan 3 file gambar dengan nama:
   - `semarang-city-hero.png` (untuk homepage hero)
   - `sinta-badge.png` (untuk logo SINTA)
   - `footer-background.png` (untuk background footer)

2. **Resize gambar** ke ukuran yang tepat:
   - Hero: 550 x 450 pixel
   - SINTA: lebar 320px (tinggi bebas)
   - Footer: 1440 x 359 pixel

**Tools untuk resize:**
- Windows: Paint, Paint 3D
- Online: photopea.com, pixlr.com
- Software: GIMP, Photoshop

---

#### B. Upload ke Folder `files/site/`

**Via File Manager (Windows Explorer):**

1. Buka File Explorer
2. Navigasi ke: `D:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\files\site\`
3. Copy-paste 3 file gambar Anda ke folder ini
4. Pastikan nama file **TIDAK ADA SPASI** (gunakan `-` atau `_`)

**Via FTP (jika server online):**

1. Buka FileZilla atau WinSCP
2. Connect ke server FTP Anda
3. Navigasi ke folder `/files/site/`
4. Upload 3 file gambar
5. Set permission file ke `644` (read-only)

---

#### C. Update Path di File Template dan CSS

Setelah upload gambar, Anda perlu update path-nya:

**1. Update Hero Image (indexJournal.tpl):**

Buka file: `ojs/plugins/themes/bootstrap3/templates/frontend/pages/indexJournal.tpl`

Cari baris:
```html
<img src="https://ojsimg.netlify.app/semarang-city-hero.png" alt="Semarang City">
```

Ganti dengan:
```html
<img src="http://localhost:8080/files/site/semarang-city-hero.png" alt="Semarang City">
```

**2. Update SINTA Badge (indexJournal.tpl):**

Cari baris:
```html
<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA">
```

Ganti dengan:
```html
<img src="http://localhost:8080/files/site/sinta-badge.png" alt="SINTA">
```

**3. Update Footer Background (journal-riptek-theme.css):**

Buka file: `journal-riptek-theme.css`

Cari baris:
```css
background-image: url('https://ojsimg.netlify.app/semarang-landmark.png');
```

Ganti dengan:
```css
background-image: url('http://localhost:8080/files/site/footer-background.png');
```

---

## ✅ Checklist Setelah Upload

Setelah mengganti gambar, lakukan pengecekan berikut:

- [ ] **Clear Browser Cache**: Tekan `Ctrl+Shift+R` di browser
- [ ] **Cek Hero Image**: Apakah gambar Semarang City muncul penuh tanpa terpotong?
- [ ] **Cek SINTA Badge**: Apakah logo SINTA muncul di sidebar kiri?
- [ ] **Cek Footer**: Apakah background footer terlihat dengan opacity yang tepat?
- [ ] **Cek Responsive**: Buka di HP/tablet, apakah gambar tetap bagus?
- [ ] **Cek Loading Speed**: Apakah website tidak terlalu lambat loading?

---

## 🚨 Troubleshooting (Jika Ada Masalah)

### ❌ Masalah: Gambar Tidak Muncul

**Solusi:**
1. Cek path/URL gambar apakah sudah benar
2. Pastikan nama file **tidak ada spasi**
3. Cek apakah file benar-benar ada di folder `files/site/`
4. Clear cache browser dengan `Ctrl+Shift+R`
5. Cek permission file (harus readable)

---

### ❌ Masalah: Gambar Terpotong

**Solusi:**
1. Cek ukuran gambar apakah sesuai rekomendasi
2. Gunakan tools resize untuk adjust ukuran
3. Pastikan rasio aspek gambar benar (landscape untuk hero, square untuk SINTA)
4. Gunakan format PNG untuk gambar dengan transparansi

---

### ❌ Masalah: Gambar Terlalu Besar (Lambat Loading)

**Solusi:**
1. Compress gambar menggunakan:
   - TinyPNG.com (online, gratis)
   - Compressor.io (online, gratis)
   - GIMP (software gratis)
2. Pastikan ukuran file maksimal **500KB** per gambar
3. Gunakan format JPG untuk foto (bukan PNG)
4. Gunakan format PNG hanya untuk logo/gambar dengan transparansi

---

### ❌ Masalah: Gambar Pecah/Blur

**Solusi:**
1. Gunakan gambar dengan resolusi lebih tinggi
2. Untuk hero image, gunakan minimal **1100 x 900px** lalu resize otomatis
3. Jangan zoom/perbesar gambar kecil
4. Export gambar dengan quality 90-100%

---

## 📐 Rekomendasi Ukuran Gambar

| Gambar | Lebar | Tinggi | Format | Ukuran File |
|--------|-------|--------|--------|-------------|
| Hero Homepage | 550px | 450px | PNG/JPG | < 300KB |
| SINTA Badge | 320px | Auto | PNG | < 50KB |
| Footer BG | 1440px | 359px | PNG/JPG | < 500KB |

---

## 🎨 Tools Gratis untuk Edit Gambar

### **Online (Tidak Perlu Install):**
1. **Photopea** (photopea.com) - Seperti Photoshop tapi gratis
2. **Pixlr** (pixlr.com) - Editor foto online mudah
3. **Canva** (canva.com) - Desain grafis untuk pemula
4. **TinyPNG** (tinypng.com) - Compress gambar
5. **Remove.bg** (remove.bg) - Hapus background gambar

### **Software Desktop (Gratis):**
1. **GIMP** - Alternatif Photoshop gratis
2. **Paint.NET** - Editor foto Windows yang mudah
3. **Krita** - Untuk ilustrasi dan painting

---

## 📞 Butuh Bantuan?

Jika Anda masih kesulitan atau ada pertanyaan:

1. **Cek Dokumentasi Teknis**: Lihat file `UPDATE-v1.3-FIXES.md`
2. **Contact Developer**: Hubungi tim IT/developer Anda
3. **Forum OJS**: https://forum.pkp.sfu.ca/
4. **Email Support**: [email support Anda]

---

## 📚 Referensi Gambar

### Sumber Gambar Gratis (Free to Use):

1. **Unsplash** (unsplash.com) - Foto gratis berkualitas tinggi
2. **Pexels** (pexels.com) - Stock photo gratis
3. **Freepik** (freepik.com) - Ilustrasi dan vektor (perlu credit)
4. **Pixabay** (pixabay.com) - Foto dan ilustrasi gratis

### Keywords untuk Cari Gambar Semarang:
- "Semarang city illustration"
- "Semarang landmark"
- "Lawang Sewu illustration"
- "Semarang skyline"
- "Java Indonesia architecture"

---

## 🔐 Keamanan File

**PENTING:**

✅ **DO (Lakukan):**
- Gunakan format JPG atau PNG saja
- Scan file dengan antivirus sebelum upload
- Backup file asli sebelum edit
- Gunakan nama file yang jelas (contoh: `hero-image.png`)

❌ **DON'T (Jangan):**
- Upload file .exe, .php, .js atau file script
- Gunakan gambar yang melanggar copyright
- Upload gambar pribadi/sensitif
- Gunakan nama file dengan karakter aneh (@#$%^)

---

**Selamat mencoba! Jika berhasil, website Jurnal Riptek Anda akan terlihat lebih profesional dengan gambar yang sesuai.** 🎉

---

*Dokumen ini dibuat untuk memudahkan pengguna non-teknis dalam mengelola gambar website Jurnal Riptek.*
*Terakhir diperbarui: Oktober 2024*

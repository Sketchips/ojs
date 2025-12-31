# 📘 Jurnal Riptek Theme - Quick Reference

Tema custom untuk Open Journal Systems (OJS) 3.x - Jurnal Riptek BRIDA Kota Semarang

---

## 🚀 Quick Start

### Untuk Pengguna Awam (Ganti Gambar)
👉 **Baca**: `PANDUAN-UPLOAD-GAMBAR.md`

### Untuk Developer (Technical Details)
👉 **Baca**: `documentation/UPDATE-v1.4-COMPLETE.md`

---

## 📁 Struktur File Penting

```
ojs-docker/
├── journal-riptek-theme.css          ← File CSS utama
├── PANDUAN-UPLOAD-GAMBAR.md         ← Panduan user-friendly
├── documentation/
│   ├── UPDATE-v1.4-COMPLETE.md      ← Technical documentation
│   ├── UPDATE-v1.4-SUMMARY.md       ← Quick summary
│   └── ...
├── ojs/
│   └── plugins/themes/bootstrap3/templates/
│       ├── frontend/components/
│       │   ├── header.tpl           ← Header template
│       │   └── footer.tpl           ← Footer template
│       └── frontend/pages/
│           └── indexJournal.tpl     ← Homepage template
└── files/site/                       ← Upload gambar di sini
```

---

## 🎨 Design Specs

- **Header**: 1440px × 71px, white background
- **Hero**: Full-width × 544px, gradient green-blue
- **Footer**: Full-width × 243px, green with 19% opacity background

---

## 📸 Gambar yang Bisa Diganti

| Gambar | Ukuran | Format | Lokasi File |
|--------|--------|--------|-------------|
| Hero (Semarang City) | 550x450px | PNG/JPG | `files/site/` |
| SINTA Badge | 320px width | PNG | `files/site/` |
| Footer Background | 1440x359px | PNG/JPG | `files/site/` |

**Panduan lengkap**: Lihat `PANDUAN-UPLOAD-GAMBAR.md`

---

## 🔧 Development

### Clear Cache
```powershell
# Browser: Ctrl+Shift+R
# Docker clear cache (jika perlu):
docker exec ojs-web php ojs/tools/clearCache.php
```

### Docker Commands
```powershell
# Start containers
docker-compose up -d

# Stop containers
docker-compose down

# View logs
docker-compose logs -f web
```

---

## 📚 Dokumentasi

1. **PANDUAN-UPLOAD-GAMBAR.md** - Untuk pengguna non-teknis
2. **documentation/UPDATE-v1.4-COMPLETE.md** - Technical details
3. **documentation/UPDATE-v1.4-SUMMARY.md** - Quick summary

---

## ✅ Current Version: v1.4

### What's New in v1.4:
- ✅ Hero section full-width (tidak terpotong)
- ✅ Navigation centered di tengah header
- ✅ Logo & text layout fixed (tidak bertabrakan)
- ✅ Dokumentasi lengkap untuk pengguna awam

---

## 🐛 Troubleshooting

### Masalah: Perubahan tidak muncul
**Solusi**: Clear browser cache dengan `Ctrl+Shift+R`

### Masalah: Gambar tidak muncul
**Solusi**: 
1. Cek path gambar di file template/CSS
2. Pastikan file gambar ada di folder `files/site/`
3. Cek permission file (readable)

### Masalah: Layout berantakan
**Solusi**: 
1. Clear browser cache
2. Cek console browser (F12) untuk error
3. Pastikan file CSS ter-load dengan benar

---

## 📞 Support

- **Dokumentasi**: Folder `documentation/`
- **OJS Forum**: https://forum.pkp.sfu.ca/
- **OJS Docs**: https://docs.pkp.sfu.ca/

---

## 📝 Change Log

- **v1.4** (27 Oct 2024): Hero full-width, navigation centered, dokumentasi lengkap
- **v1.3** (27 Oct 2024): Header white, subtitle update, SINTA repositioned
- **v1.2** (Previous): Navigation menu, footer green, user menu fix
- **v1.1** (Previous): Typography updates, hero outside grid
- **v1.0** (Initial): Complete theme implementation

---

## 🎯 Production Checklist

Sebelum deploy ke production:

- [ ] Test di browser: Chrome, Firefox, Edge
- [ ] Test responsive: Desktop, Tablet, Mobile
- [ ] Clear cache: Browser dan OJS
- [ ] Backup database dan files
- [ ] Test semua link navigation
- [ ] Verify gambar loading dengan baik
- [ ] Check page load speed
- [ ] Test user login/register

---

**Theme by**: [Your Name/Team]  
**Last Updated**: 27 Oktober 2024  
**OJS Version**: 3.x (Bootstrap 3 Theme)

---

🎉 **Selamat menggunakan tema Jurnal Riptek!**

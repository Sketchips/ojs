# 🚨 CSS TIDAK MUNCUL? BACA INI! 🚨

## Quick Fix (2 Menit)

Jika CSS tidak muncul setelah upload via Admin Panel:

### Option 1: Automated Fix
```powershell
.\fix-css-upload.ps1
```

### Option 2: Manual Fix
```powershell
# 1. Execute SQL fix
Get-Content fix-stylesheet-final.sql | docker-compose exec -T db mysql -uroot -proot ojs

# 2. Clear cache
Remove-Item -Recurse -Force ojs\cache\*

# 3. Restart Docker
docker-compose restart

# 4. Clear browser cache (Ctrl + Shift + Delete)
# 5. Hard reload (Ctrl + F5)
```

---

## 📚 Full Documentation

Lihat folder `documentation/` untuk:
- **CRITICAL-CSS-UPLOAD-FIX.md** - Complete troubleshooting guide
- **QUICK-FIX-CSS.md** - Quick reference
- **CSS-FIX-DATABASE-UPDATE.md** - Technical deep dive
- **README.md** - Documentation index

---

## ⚠️ IMPORTANT

**Setiap kali upload CSS via Admin Panel, jalankan fix script!**

Kenapa? OJS tidak properly set database metadata saat upload.

---

## 🎯 Current Status

**Date:** October 30, 2025  
**Version:** 2.0 FIXED  
**Status:** ✅ Database updated, cache cleared, Docker restarted

**Next:** Clear browser cache dan test!

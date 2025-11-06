# QUICK FIX GUIDE - CSS Not Loading

**Problem:** CSS tidak muncul meskipun file ada
**Solution:** Update database metadata untuk styleSheet
**Time:** 2 menit

---

## 🚀 LANGKAH CEPAT

### 1. Execute SQL Fix
```bash
Get-Content fix-stylesheet.sql | docker-compose exec -T db mysql -uroot -proot ojs
```

### 2. Clear Cache & Restart
```bash
Remove-Item -Recurse -Force ojs\cache\*
docker-compose restart
```

### 3. Test Browser
```
Ctrl + Shift + Delete → Clear cache
Ctrl + F5 → Hard reload
```

**DONE!** ✨

---

## ✅ CHECKLIST

- [x] Database updated
- [x] Cache cleared
- [x] Docker restarted
- [ ] Browser cache cleared
- [ ] Page reloaded
- [ ] CSS loading confirmed

---

## 🔍 VERIFY

Check CSS loaded:
```
F12 → Network → Filter: CSS → Look for "styleSheet.css"
Status should be: 200
```

---

## 📝 WHAT WAS FIXED

**Before:**
- Database: `setting_value = []` (empty)
- CSS: Not loaded

**After:**
- Database: `setting_value = {"uploadName":"styleSheet.css",...}`
- CSS: Loaded successfully

---

## 📚 FULL DOCUMENTATION

See: `documentation/CSS-FIX-DATABASE-UPDATE.md`

---

**Status: FIXED** 🎉

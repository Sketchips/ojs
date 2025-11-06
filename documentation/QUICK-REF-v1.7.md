# ⚡ QUICK REFERENCE v1.7

## 📦 FILE INFO
- **File:** modern-ojs-theme.css
- **Version:** 1.7 FINAL
- **Size:** 72.8 KB
- **Lines:** 2,349
- **Status:** ✅ READY

---

## ✅ FIXES v1.7

| Fix | Before | After | Line |
|-----|--------|-------|------|
| **Logo Position** | top: 12px | top: 8px (lebih ke atas) | ~1708 |
| **Carousel Right** | calc(-50vw + 50%) | calc(-50vw + 50% + 15px) | ~1739 |
| **Dropdown BG** | Black box bug | Clean white | ~1786 |
| **Comments** | Minimal | Detailed Indonesian | All |

---

## 🎯 ADJUSTMENT POINTS

### Logo (Naik/Turun)
**Line ~1708:**
```css
top: 8px !important; /* Kurangi = naik, tambah = turun */
```

### Carousel (Kanan/Kiri)
**Line ~1739:**
```css
margin-left: calc(-50vw + 50% + 15px) !important;
/* +15px = kanan, -15px = kiri, 0px = center */
```

### Carousel (Tinggi)
**Line ~1741:**
```css
height: 550px !important; /* Desktop height */
```

### Navigation (Horizontal)
**Line ~1871:**
```css
left: 200px !important; /* Jarak dari logo */
```

---

## 🚀 UPLOAD STEPS

1. **Login:** OJS Admin
2. **Go to:** Settings → Website → Appearance → Stylesheet
3. **Upload:** modern-ojs-theme.css (v1.7)
4. **Save** 
5. **Clear:** Ctrl + Shift + R

---

## ✅ TEST CHECKLIST

- [ ] Logo lebih ke atas
- [ ] Carousel extend ke kanan
- [ ] About dropdown white (no black box)
- [ ] Carousel full-width
- [ ] Gambar tidak zoom

---

## 📝 COMMON ADJUSTMENTS

### Logo lebih tinggi lagi?
```css
top: 5px !important; /* Atau 4px, 3px */
```

### Carousel lebih ke kanan?
```css
margin-left: calc(-50vw + 50% + 25px) !important;
margin-right: calc(-50vw + 50% - 25px) !important;
```

### Carousel lebih tinggi?
```css
height: 600px !important; /* Desktop */
```

---

## 🐛 TROUBLESHOOTING

### Issue: About dropdown masih black box

**Add to Additional Content:**
```html
<style>
.dropdown-menu {
    background: #ffffff !important;
}
.dropdown-menu::before,
.dropdown-menu::after {
    display: none !important;
}
</style>
```

### Issue: Logo belum cukup tinggi

**Add to Additional Content:**
```html
<style>
.navbar-brand,
.pkp_site_name {
    top: 5px !important;
}
</style>
```

### Issue: Carousel belum sentuh kanan

**Add to Additional Content:**
```html
<style>
.carousel {
    margin-left: calc(-50vw + 50% + 25px) !important;
    margin-right: calc(-50vw + 50% - 25px) !important;
}
</style>
```

---

## 📂 BACKUP LOCATION

**Latest:**
- `backups/modern-ojs-theme-v1.7-FINAL.backup`

**Previous:**
- `backups/modern-ojs-theme-v1.6-before-final-adjustments.backup`

---

## 📞 DOCUMENTATION

**Full Guide:** `documentation/FINAL-UPDATE-v1.7.md`  
**Quick Upload:** `documentation/QUICK-GUIDE-v1.6.md`  
**Changelog:** `documentation/CHANGELOG.md`

---

**Ready to deploy!** 🚀

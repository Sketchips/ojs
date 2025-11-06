# ⚡ QUICK GUIDE v1.6 - MEGA CAROUSEL

## 🎯 WHAT'S NEW IN v1.6

### MEGA CAROUSEL (Like Riptek)
✅ Full-width carousel (nyaris sentuh kiri-kanan)  
✅ Gambar tidak zoom (object-fit: contain)  
✅ Height 550px desktop, responsive mobile

### NAVIGATION FIX
✅ Naik masuk header sepenuhnya (perfect center)  
✅ Sejajar dengan logo, search, account

### DROPDOWN FIXES
✅ About dropdown **STAY** saat diklik (tidak hilang)  
✅ Background dropdown clean & rapi  
✅ Account dropdown simple (no heavy box)

---

## 🚀 UPLOAD & TEST (3 MENIT)

### Step 1: Upload CSS (1 menit)
1. Login OJS Admin
2. **Settings → Website → Appearance → Stylesheet**
3. Upload: `modern-ojs-theme.css`
4. Save

### Step 2: Clear Cache (1 menit)
- Browser: **Ctrl + Shift + R**
- OJS: **Settings → Website → Clear Cache**

### Step 3: Test (1 menit)
- [ ] Carousel full-width? (hampir sentuh kiri-kanan viewport)
- [ ] Gambar normal? (tidak zoom/crop)
- [ ] Navigation di header? (sejajar logo)
- [ ] About dropdown stay? (klik, pilih submenu)

---

## ✅ EXPECTED RESULT

```
┌───────────────────────────────────────────────────────┐
│ [Logo] [Current] [Archives] [About]    [🔍] [👤]     │ ← IN HEADER!
├───────────────────────────────────────────────────────┤
│                                                       │
│  [◄]         MEGA CAROUSEL FULL-WIDTH          [►]   │
│            Gambar normal, tidak zoom                 │
│                                                       │
└───────────────────────────────────────────────────────┘
```

**About Dropdown:** Klik "About" → Menu stay open → Bisa pilih submenu

---

## 🐛 TROUBLESHOOTING

### Carousel masih kecil?

Go: **Settings → Website → Appearance → Additional Content**

Paste:
```html
<style>
.carousel {
    width: 100vw !important;
    margin-left: calc(-50vw + 50%) !important;
    margin-right: calc(-50vw + 50%) !important;
}
</style>
```

### Gambar masih zoom?

Add:
```html
<style>
.carousel img {
    object-fit: contain !important;
    background: #000 !important;
}
</style>
```

### About dropdown tidak stay?

Add:
```html
<script>
$('.pkp_navigation_primary li').click(function(){
    $(this).toggleClass('open');
});
</script>
```

---

## 📂 FILES

**Main:** `modern-ojs-theme.css` (v1.6)  
**Backup:** `backups/modern-ojs-theme-v1.6-mega-carousel.backup`  
**Docs:** `documentation/UPDATE-LOG-v1.6-MEGA.md`

---

## 💡 KEY CHANGES

| Feature | v1.5 | v1.6 |
|---------|------|------|
| Carousel Width | Container (~1200px) | **Full-width (~1920px)** ✅ |
| Gambar | Zoom (cover) | **Normal (contain)** ✅ |
| About Dropdown | Hilang saat mouse away | **Stay saat diklik** ✅ |
| Navigation | Belum full header | **Perfect center** ✅ |

---

**Version:** 1.6 MEGA CAROUSEL  
**Ready:** Production ✅  
**Time:** 3 menit upload + test

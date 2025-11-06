# 🚀 QUICK IMPLEMENTATION GUIDE
## Journal Riptek Theme v2.0 - Fixed Version

---

## ⚡ CARA CEPAT IMPLEMENTASI

### Option 1: Manual Copy (RECOMMENDED)

```bash
# 1. Backup file lama
cp ojs/public/journals/1/styleSheet.css ojs/public/journals/1/styleSheet.css.backup

# 2. Copy CSS baru
cp journal-riptek-theme-FIXED-v2.0.css ojs/public/journals/1/styleSheet.css

# 3. Copy template About page baru
cp about-FIXED-v2.0.tpl ojs/plugins/themes/bootstrap3/templates/frontend/pages/about.tpl

# 4. Restart (jika pakai Docker)
docker-compose restart
```

### Option 2: Edit Langsung di OJS Admin

1. Login sebagai Admin di OJS
2. Go to: **Settings → Website → Appearance → Advanced**
3. Scroll ke **Journal Stylesheet**
4. Upload file: `journal-riptek-theme-FIXED-v2.0.css`
5. Save

---

## 📋 CHECKLIST IMPLEMENTASI

- [ ] Backup `styleSheet.css` lama
- [ ] Copy `journal-riptek-theme-FIXED-v2.0.css` → `styleSheet.css`
- [ ] Backup `about.tpl` lama
- [ ] Copy `about-FIXED-v2.0.tpl` → `about.tpl`
- [ ] Clear browser cache (Ctrl + Shift + Delete)
- [ ] Test homepage
- [ ] Test about page
- [ ] Test login page
- [ ] Test mobile view (F12 → Toggle device)
- [ ] ✅ Done!

---

## 🎯 FILE LOCATIONS

### CSS File:
```
Source: journal-riptek-theme-FIXED-v2.0.css
Target: ojs/public/journals/1/styleSheet.css
```

### About Template:
```
Source: about-FIXED-v2.0.tpl
Target: ojs/plugins/themes/bootstrap3/templates/frontend/pages/about.tpl
```

---

## 🔍 VERIFY CHANGES

### 1. Homepage Hero:
✅ Hero menempel di bawah header (no gap)
✅ Teks "Jurnal Riptek" shifted ke kanan
✅ Image mentok di kanan edge

### 2. Description Boxes:
✅ Layout horizontal (2 kolom side by side)
✅ Bentuk persegi panjang (tidak gepeng)

### 3. About Page:
✅ Ada hero image di atas
✅ Ada sidebar hijau di kiri
✅ Layout sama seperti home

### 4. Mobile View:
✅ Description boxes tetap rectangular
✅ Tidak gepeng (tidak terlalu tinggi/pendek)

### 5. Login/Register:
✅ Logo position sama seperti home
✅ Header centered

---

## 🐛 TROUBLESHOOTING CEPAT

### CSS tidak apply?
```bash
# Clear cache dan restart
docker-compose restart
# Atau di browser: Ctrl + Shift + Delete → Clear cache
```

### About page tidak ada sidebar?
```bash
# Check file path
ls -la ojs/plugins/themes/bootstrap3/templates/frontend/pages/about.tpl
# Pastikan isinya sama dengan about-FIXED-v2.0.tpl
```

### Hero image tidak mentok kanan?
```css
/* Check di CSS ada property ini: */
.hero-image {
    position: absolute !important;
    right: 0 !important;
}
```

---

## 📱 TEST RESPONSIVE

### Desktop (> 1200px):
- Hero: Teks kiri + image kanan mentok
- Content: 2 kolom horizontal

### Tablet (768px - 1200px):
- Hero: Stacked vertical
- Content: 2 kolom tetap

### Mobile (< 768px):
- Hero: Stacked vertical centered
- Content: 1 kolom, boxes rectangular

**Cara test:**
1. Buka browser
2. Press F12 (DevTools)
3. Click icon "Toggle device toolbar"
4. Select: iPhone, iPad, atau resize manual

---

## ✅ HASIL AKHIR

Semua masalah FIXED:
1. ✅ Hero menempel di header
2. ✅ Teks hero shifted right
3. ✅ About page: sidebar + hero
4. ✅ Description horizontal rectangle
5. ✅ Mobile tidak gepeng
6. ✅ Login/register header centered

---

## 📞 NEED HELP?

Check dokumentasi lengkap: `FIX-DOCUMENTATION-v2.0.md`

---

**Happy Coding! 🎉**

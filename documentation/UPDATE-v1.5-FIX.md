# Update v1.5 - Layout Centering Fix

## 🐛 Issues Fixed

### 1. Hero Section Shift to Left ✅
**Problem**: 
- Text "urnal Riptek" (J terpotong)
- Hero section menjorok ke kiri, tidak centered
- Menggunakan `calc(-50vw + 50%)` menyebabkan shift

**Solution**:
- Remove complex calc formula
- Use simple `margin: 0 auto` for centering
- Change `justify-content` from `space-between` to `center`
- Add `overflow: hidden` to prevent horizontal scroll
- Adjust padding to 80px for better spacing

**Result**: Hero section sekarang **centered** dengan text "Jurnal Riptek" lengkap

---

### 2. Header Navigation Layout ✅
**Problem**:
- Logo dan text "Jurnal Riptek" ikut ke kanan
- Navigation menu terlalu ke kanan

**Solution**:
- Logo & text: `position: absolute; left: 20px` (fixed di kiri)
- Navigation: Keep centered dengan `left: 50%; transform: translateX(-50%)`
- Remove `display: flex; justify-content: space-between` dari container
- Add `float: left` pada navbar-header

**Result**: 
- Logo & text **tetap di kiri**
- Navigation **centered di tengah**
- Layout tidak bertabrakan

---

## 📝 CSS Changes

### Hero Section:
```css
.homepage-hero {
    width: 100%;
    margin: 0 auto !important;
    justify-content: center;  /* was: space-between */
    overflow: hidden;         /* was: visible */
    padding: 0 80px;         /* was: 60px */
}

.hero-content {
    flex: 0 0 auto;
    max-width: 700px;
}

.hero-image {
    max-width: 500px;
    margin-left: 60px;
}
```

### Header:
```css
#headerNavigationContainer .navbar-header {
    position: absolute;
    left: 20px;
    float: left;
}

#nav-menu {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    float: none !important;
}
```

---

## ✅ Testing

1. Clear cache: `Ctrl+Shift+R`
2. Check hero: Text "**Jurnal Riptek**" lengkap (tidak terpotong)
3. Check hero: Section **centered** (tidak ke kiri/kanan)
4. Check header: Logo & text **di kiri**
5. Check header: Navigation **di tengah**

---

**Files Modified**: `journal-riptek-theme.css`

**Version**: v1.5  
**Date**: 27 Oktober 2024

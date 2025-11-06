# ✅ Testing Checklist - Jurnal Riptek Theme v1.4

## 📋 Pre-Test Preparation

- [ ] Docker containers running (`docker ps`)
- [ ] Browser cache cleared (`Ctrl+Shift+R`)
- [ ] Console browser dibuka (F12) untuk cek error
- [ ] Screenshots sebelum & sesudah diambil

---

## 🖼️ Hero Section Test

### Visual Check:
- [ ] ✅ Hero section **full-width** (tidak ada white space di kiri/kanan)
- [ ] ✅ Text "**Jurnal Riptek**" terlihat **LENGKAP** (tidak terpotong jadi "Jurnal Ript-")
- [ ] ✅ Subtitle "Badan Riset dan Inovasi Daerah Kota Semarang" terlihat lengkap
- [ ] ✅ Gambar Semarang City di kanan **TIDAK TERPOTONG**
- [ ] ✅ Background gradient hijau-biru terlihat smooth
- [ ] ✅ No horizontal scrollbar

### Typography:
- [ ] ✅ Title font: Inria Serif 128px, Bold, White
- [ ] ✅ Subtitle font: Inria Serif 23px, Bold, White
- [ ] ✅ Text shadow terlihat (untuk contrast)

### Layout:
- [ ] ✅ Hero height: 544px
- [ ] ✅ Text di kiri, gambar di kanan
- [ ] ✅ Content balanced (tidak terlalu mepet)

---

## 🎯 Header/Navigation Test

### Header General:
- [ ] ✅ Header background: **WHITE** (bukan hijau)
- [ ] ✅ Header height: 71px
- [ ] ✅ Fixed position (tetap di atas saat scroll)
- [ ] ✅ Border bottom terlihat (subtle gray line)
- [ ] ✅ Box shadow terlihat (subtle)

### Logo & Branding:
- [ ] ✅ Logo di **pojok kiri**
- [ ] ✅ Logo height: sekitar 45px
- [ ] ✅ Text "**Jurnal Riptek**" di **samping logo** (bukan bertabrakan)
- [ ] ✅ Separator line antara logo dan text terlihat
- [ ] ✅ Font: Poppins 26px Bold, Black

### Navigation Menu:
- [ ] ✅ Menu positioned di **TENGAH** header (centered horizontally)
- [ ] ✅ 6 menu terlihat: Home, About, Issues, Submissions, Announcements, Contact
- [ ] ✅ Text color default: Dark gray (#333)
- [ ] ✅ Hover effect: Berubah hijau (#2ecc71)
- [ ] ✅ Active page: Hijau dengan background subtle

### User Menu:
- [ ] ✅ Login/User menu di **pojok kanan atas**
- [ ] ✅ Icon user terlihat (👤)
- [ ] ✅ Hover effect: Hijau
- [ ] ✅ Dropdown menu (jika logged in) berfungsi

---

## 📑 Sidebar Test

### Green Buttons:
- [ ] ✅ 5 buttons terlihat dengan jelas
- [ ] ✅ Button size: 320px × 62px
- [ ] ✅ Button color: Green gradient
- [ ] ✅ Text white, centered, bold
- [ ] ✅ Hover effect: Darker green + lift animation
- [ ] ✅ Box shadow terlihat

### Button Order:
1. [ ] About
2. [ ] Focus and Scope
3. [ ] Section Policies
4. [ ] Author Guidelines
5. [ ] Contact Us

### SINTA Badge:
- [ ] ✅ SINTA logo terlihat **di bawah** Author Guidelines
- [ ] ✅ Border top separator terlihat
- [ ] ✅ Gambar tidak pecah/blur
- [ ] ✅ Hover effect: Scale 1.05x
- [ ] ✅ Image max-width: 100% (responsive)

---

## 🌊 Footer Test

### Background:
- [ ] ✅ Footer background: **Green gradient** (#1e8449 to #27ae60)
- [ ] ✅ Background image landmark Semarang terlihat samar (opacity 19%)
- [ ] ✅ Full-width footer (tidak ada white space)

### Content:
- [ ] ✅ Title "REDAKSI JURNAL RIPTEK" terlihat
- [ ] ✅ Text white, readable
- [ ] ✅ Contact information lengkap:
  - Badan Riset dan Inovasi Daerah (BRIDA)
  - Address: Jl. Pemuda No.175
  - Email: riptek@semarangkota.go.id
  - Website: http://riptek.smg
  - Phone & Fax

### Layout:
- [ ] ✅ Footer height: minimal 243px
- [ ] ✅ Content centered dengan padding proper
- [ ] ✅ No overlap dengan main content

---

## 📱 Responsive Test

### Desktop (1920px):
- [ ] Hero full-width tanpa masalah
- [ ] Navigation centered sempurna
- [ ] All content visible

### Desktop (1440px):
- [ ] Hero matches design mockup
- [ ] No layout breaking
- [ ] Images scaled properly

### Laptop (1366px):
- [ ] Layout tetap bagus
- [ ] Navigation tidak collapse
- [ ] Images tidak overflow

### Tablet (768px):
- [ ] Navigation berubah hamburger menu
- [ ] Hero image tetap terlihat
- [ ] Sidebar stack di bawah content

### Mobile (375px):
- [ ] All text readable
- [ ] Hero title font size adjust
- [ ] Navigation hamburger works
- [ ] Footer content stack vertical

---

## ⚡ Performance Test

### Loading Speed:
- [ ] ✅ Homepage load < 3 seconds
- [ ] ✅ Images optimized (< 500KB each)
- [ ] ✅ No unnecessary HTTP requests
- [ ] ✅ CSS minified (untuk production)

### Browser Console:
- [ ] ✅ No JavaScript errors (red text)
- [ ] ✅ No CSS errors
- [ ] ✅ No 404 errors (missing images/files)
- [ ] ✅ All fonts loaded (Google Fonts)

### Network Tab (F12 → Network):
- [ ] ✅ CSS file loaded: journal-riptek-theme.css
- [ ] ✅ All images loaded (hero, sinta, footer bg)
- [ ] ✅ Google Fonts loaded (Inria Serif, Poppins)

---

## 🔗 Functionality Test

### Navigation Links:
- [ ] ✅ Home → Homepage
- [ ] ✅ About → About page
- [ ] ✅ Issues → Archives/Issues page
- [ ] ✅ Submissions → Submission guidelines
- [ ] ✅ Announcements → Announcements list
- [ ] ✅ Contact → Contact page

### Sidebar Links:
- [ ] ✅ About → Editorial Team
- [ ] ✅ Focus and Scope → Scope page
- [ ] ✅ Section Policies → Policies page
- [ ] ✅ Author Guidelines → Submission guidelines
- [ ] ✅ Contact Us → Contact page

### User Actions:
- [ ] ✅ Login button works
- [ ] ✅ Register button works
- [ ] ✅ User dropdown menu (if logged in)
- [ ] ✅ Logout works properly

---

## 🎨 Design Consistency

### Colors:
- [ ] ✅ Primary green: #2ecc71
- [ ] ✅ Secondary green: #27ae60
- [ ] ✅ Dark green: #1e8449
- [ ] ✅ Blue accent: #3498db
- [ ] ✅ Black text: #000000
- [ ] ✅ Gray text: #333333
- [ ] ✅ White: #ffffff

### Typography:
- [ ] ✅ Inria Serif used for hero title & subtitle
- [ ] ✅ Poppins used for header "Jurnal Riptek"
- [ ] ✅ Font weights correct (Bold 700)
- [ ] ✅ Line heights readable

### Spacing:
- [ ] ✅ Consistent padding/margins
- [ ] ✅ No elements overlapping
- [ ] ✅ White space balanced
- [ ] ✅ Alignment consistent

---

## 🖱️ Interaction Test

### Hover Effects:
- [ ] ✅ Navigation links: Color change to green
- [ ] ✅ Sidebar buttons: Darker green + lift
- [ ] ✅ SINTA badge: Scale effect
- [ ] ✅ All links: Cursor pointer

### Active States:
- [ ] ✅ Current page highlighted in navigation
- [ ] ✅ Clicked buttons show feedback
- [ ] ✅ Form inputs focus state

### Animations:
- [ ] ✅ Smooth transitions (0.3s)
- [ ] ✅ No janky animations
- [ ] ✅ No layout shift during load

---

## 📸 Image Quality Test

### Hero Image (Semarang City):
- [ ] ✅ Resolution adequate (tidak pixelated)
- [ ] ✅ File size reasonable (< 300KB)
- [ ] ✅ Format: PNG atau JPG
- [ ] ✅ Alt text present

### SINTA Badge:
- [ ] ✅ Logo clear (tidak blur)
- [ ] ✅ Transparent background (jika PNG)
- [ ] ✅ Size proportional
- [ ] ✅ Alt text present

### Footer Background:
- [ ] ✅ Opacity 19% (terlihat samar)
- [ ] ✅ Tidak mengganggu readability text
- [ ] ✅ Position: bottom center
- [ ] ✅ No repeat/tiling

---

## 🌐 Browser Compatibility

### Chrome (Latest):
- [ ] ✅ All features work
- [ ] ✅ Layout correct
- [ ] ✅ No visual bugs

### Firefox (Latest):
- [ ] ✅ All features work
- [ ] ✅ Layout correct
- [ ] ✅ No visual bugs

### Edge (Latest):
- [ ] ✅ All features work
- [ ] ✅ Layout correct
- [ ] ✅ No visual bugs

### Safari (macOS):
- [ ] ✅ All features work
- [ ] ✅ Layout correct
- [ ] ✅ Font rendering OK

---

## 📝 Content Test

### Homepage Content:
- [ ] ✅ Journal description visible
- [ ] ✅ Edited and Published By section
- [ ] ✅ Bibliographic info (ISSN)
- [ ] ✅ Publishing frequency
- [ ] ✅ Abstracting/Indexing info

### Footer Content:
- [ ] ✅ All contact info correct
- [ ] ✅ No typos
- [ ] ✅ Email clickable (mailto:)
- [ ] ✅ Website URL correct

---

## 🔒 Security Check

### File Permissions:
- [ ] ✅ CSS file readable
- [ ] ✅ Image files readable
- [ ] ✅ No sensitive info exposed in code

### External Resources:
- [ ] ✅ Google Fonts loaded via HTTPS
- [ ] ✅ No mixed content warnings
- [ ] ✅ No insecure resources

---

## 📊 Final Verification

### Documentation:
- [ ] ✅ PANDUAN-UPLOAD-GAMBAR.md exists
- [ ] ✅ UPDATE-v1.4-COMPLETE.md exists
- [ ] ✅ UPDATE-v1.4-SUMMARY.md exists
- [ ] ✅ QUICK-REFERENCE.md exists

### Backup:
- [ ] ✅ Original files backed up
- [ ] ✅ Database backup created (if needed)
- [ ] ✅ Version control committed

### Production Ready:
- [ ] ✅ All tests passed
- [ ] ✅ No critical bugs found
- [ ] ✅ Performance acceptable
- [ ] ✅ Team approval obtained

---

## ✅ Sign-Off

**Tested By**: ___________________

**Date**: ___________________

**Version**: v1.4

**Status**: 
- [ ] ✅ PASSED - Ready for Production
- [ ] ⚠️ PASSED with Minor Issues (document below)
- [ ] ❌ FAILED - Needs fixes (document below)

**Notes/Issues Found**:
```
[List any issues or notes here]




```

---

## 🚨 If Issues Found

1. Document the issue clearly
2. Take screenshot
3. Note steps to reproduce
4. Check browser console for errors
5. Report to developer

---

**Checklist Complete!** 🎉

*Save this checklist for future reference and updates.*

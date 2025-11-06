# TESTING GUIDE - Version 2.0

**Version**: 2.0 - Balanced Layout & Mobile Navigation  
**Date**: October 28, 2025  
**Duration**: 15-20 minutes

---

## 🎯 TESTING OBJECTIVES

Verify 4 critical fixes dari v2.0:

1. ✅ Hero text "Jurnal Riptek" LENGKAP (tidak terpotong)
2. ✅ Hero spacing BALANCED (kiri-kanan sama rata)
3. ✅ Content container FULL WIDTH (sama dengan hero)
4. ✅ Mobile navigation SIDE PANEL (slide from left)

---

## 🖥️ DESKTOP TESTING (1920px - 1440px)

### Setup

1. **Open Browser**
   ```
   http://localhost:8080/index.php/jurnaladit/index
   ```

2. **Hard Refresh** (Clear cache)
   ```
   Ctrl + Shift + R
   atau
   Ctrl + F5
   ```

3. **Maximize Window** (Full screen 1920px)

### Test Checklist

#### ✅ Test 1: Hero Text Complete

**Expected**:
- Hero title shows: "Jurnal Riptek" (LENGKAP)
- NOT: "nal Riptek" (terpotong)
- First letters "Jur" visible clearly

**How to Check**:
1. Look at hero section title
2. Read first 3 letters: Should be "Jur"
3. Full title: "Jurnal Riptek"

**Screenshot Reference**: (Your previous screenshot showed "nal Riptek" - now should be "Jurnal Riptek")

**❌ FAIL if**: Text shows "nal Riptek" atau huruf pertama terpotong  
**✅ PASS if**: Text shows "Jurnal Riptek" lengkap dari awal

---

#### ✅ Test 2: Hero Spacing Balanced

**Expected**:
- White space di KIRI = White space di KANAN
- Text tidak nempel ke edge kiri
- Image tidak nempel ke edge kanan
- Spacing looks CENTERED dan BALANCED

**How to Check**:
1. Measure visually: gap dari edge kiri ke text
2. Measure visually: gap dari image ke edge kanan
3. Should look approximately EQUAL

**Visual Guide**:
```
|<-- 100px -->| Jurnal Riptek | 80px gap | [Image] |<-- 100px -->|
^              ^                                    ^              ^
Edge           Text start                          Image end      Edge
SAMA!                                                              SAMA!
```

**❌ FAIL if**:
- Text menempel ke edge kiri (no gap kiri)
- Gap kanan obviously lebih besar dari gap kiri
- Layout looks off-center

**✅ PASS if**:
- Gap kiri ≈ Gap kanan (visual balance)
- Text punya breathing room dari edge
- Centered appearance

---

#### ✅ Test 3: Content Container Full Width

**Expected**:
- Editorial Team button area sama lebar dengan hero
- Content container aligned dengan hero edges
- No narrower section below hero

**How to Check**:
1. Scroll down to "Editorial Team" section
2. Visual check: Left edge container dengan left edge hero
3. Visual check: Right edge container dengan right edge hero
4. Should align PERFECTLY

**Visual Guide**:
```
|══════════════ HERO SECTION ══════════════|
|                                           |
|══════ EDITORIAL TEAM SECTION ════════════| ← SAMA LEBAR
^                                          ^
Edge align                         Edge align
```

**❌ FAIL if**:
- Content section looks narrower
- Left/right edges tidak aligned dengan hero
- Gap visible antara hero width dan content width

**✅ PASS if**:
- Content width = Hero width
- Edges aligned perfectly
- Full-width appearance consistent

---

#### ✅ Test 4: Navigation Positioning

**Expected** (Desktop):
- Navigation horizontal di tengah header
- 6 menu items visible
- Font: Poppins SemiBold 13px
- Centered dengan slight offset kiri (48%)

**How to Check**:
1. Look at header navigation
2. Count items: Home, About, Issues, Submissions, dll
3. Should be horizontally centered

**❌ FAIL if**: Navigation too high, too low, atau off-center drastis  
**✅ PASS if**: Navigation looks centered dan properly positioned

---

## 💻 LAPTOP TESTING (1366px - 1200px)

### Setup

1. **Resize Browser Window**
   - F12 (Open DevTools)
   - Ctrl + Shift + M (Toggle Device Toolbar)
   - Select "Responsive"
   - Set width: 1366px

### Test Checklist

#### ✅ Test 5: Responsive Padding (1440px)

**Expected**:
- Hero padding: 80px (reduced from 100px)
- Content padding: 80px (matched)
- Text still readable
- Image proporsional

**How to Check**:
1. Resize to 1440px
2. Check text tidak terpotong
3. Check spacing masih balanced

**✅ PASS if**: Layout adapts smoothly, no cutoff

---

#### ✅ Test 6: Vertical Stack (1200px)

**Expected**:
- Hero section: Text dan image stacked VERTICALLY
- Text on top, image below
- Padding: 40px
- Content padding: 40px (matched)

**How to Check**:
1. Resize to 1200px
2. Hero should switch to vertical layout
3. Check padding looks consistent

**Visual Guide**:
```
BEFORE (>1200px):          AFTER (≤1200px):
┌─────────────────┐        ┌─────────────────┐
│ Text │ Image    │   →    │     Text        │
└─────────────────┘        │                 │
                           │     Image       │
                           └─────────────────┘
```

**✅ PASS if**: Vertical stack triggered, padding consistent

---

## 📱 TABLET TESTING (992px - 768px)

### Setup

1. **Resize to Tablet Size**
   - Device Toolbar → iPad (1024 x 768)
   - atau set width: 992px

### Test Checklist

#### ✅ Test 7: Tablet Layout (992px)

**Expected**:
- Hero: Vertical stack, padding 30px
- Content: Padding 30px (matched)
- Sidebar: Horizontal layout
- Navigation: Still desktop style (not hamburger yet)

**How to Check**:
1. Resize to 992px
2. Check hero vertical
3. Check sidebar horizontal (below content)
4. Navigation bar still visible

**✅ PASS if**: Layout adapts, sidebar horizontal, no mobile nav yet

---

## 📱 MOBILE TESTING (576px - 400px)

### 🔥 CRITICAL TEST - Mobile Navigation Side Panel

### Setup

1. **Resize to Mobile Size**
   - Device Toolbar → iPhone SE (375 x 667)
   - atau set width: 400px

### Test Checklist

#### ✅ Test 8: Hamburger Button Visible

**Expected**:
- Hamburger icon (☰) visible di KIRI ATAS header
- Green border around icon
- 3 horizontal bars visible
- Desktop navigation HIDDEN

**How to Check**:
1. Resize to 768px or smaller
2. Look for hamburger icon top-left
3. Should have green border

**Visual**:
```
┌────────────────┐
│ [☰]  Jurnal    │ ← Hamburger di kiri
└────────────────┘
```

**❌ FAIL if**:
- No hamburger visible
- Desktop nav still showing
- Hamburger di kanan (should be kiri)

**✅ PASS if**: Hamburger visible, green border, left-positioned

---

#### ✅ Test 9: Side Panel Slide Animation

**Expected**:
- Click hamburger → panel slides FROM LEFT
- NOT dropdown dari atas
- Panel width: 280px
- Smooth animation (0.3s)
- Backdrop overlay appears

**How to Check**:
1. Click hamburger icon
2. Observe animation direction: Should come from LEFT edge
3. Panel should slide smoothly into view

**Visual Animation**:
```
BEFORE:                    AFTER:
┌──────────────┐          ┌──────────────┐
│ [☰] Jurnal   │   CLICK  │█Panel│Jurnal │
└──────────────┘    →     │█ Home│       │
                          │█About│       │
                          └──────────────┘
                           ^
                           Slide from LEFT
```

**❌ FAIL if**:
- Panel drops down from top (old behavior)
- Panel comes from right
- No animation (instant appear)

**✅ PASS if**:
- Panel slides from LEFT smoothly
- 280px width
- Smooth 0.3s animation

---

#### ✅ Test 10: Panel Content & Layout

**Expected**:
- Menu items stacked VERTICALLY
- 6 items visible: Home, About, Issues, Submissions, Editorial Team, Register
- White background
- Borders between items
- Full height (100vh)
- Box shadow for depth

**How to Check**:
1. Open panel (click hamburger)
2. Count menu items: Should be 6
3. Check vertical stack layout
4. Look for borders between items

**Visual Layout**:
```
┌──────────────┐
│  Home        │
├──────────────┤ ← Border
│  About       │
├──────────────┤
│  Issues      │
├──────────────┤
│  Submissions │
├──────────────┤
│  Editorial   │
├──────────────┤
│  Register    │
└──────────────┘
```

**✅ PASS if**:
- 6 items visible
- Vertical stack
- Borders present
- White background

---

#### ✅ Test 11: Backdrop Overlay

**Expected**:
- Dark overlay appears behind panel
- 50% opacity (semi-transparent)
- Covers entire screen except panel
- Dims the background content

**How to Check**:
1. Open panel
2. Look at area to the right of panel
3. Should see dark overlay
4. Content behind should be dimmed

**Visual**:
```
┌──────────────────────┐
│Panel│ DARK BACKDROP  │ ← This area dark
│     │   (50% black)  │
│     │                │
└──────────────────────┘
```

**✅ PASS if**: Dark overlay visible, semi-transparent

---

#### ✅ Test 12: Close Panel

**Expected** (Multiple ways to close):
1. Click hamburger again
2. Click backdrop (dark area)
3. Panel slides back to left (off-screen)
4. Same smooth 0.3s animation

**How to Check**:
1. Open panel (click hamburger)
2. Click backdrop area (dark area)
3. Panel should slide away to left
4. OR click hamburger icon again

**❌ FAIL if**:
- Cannot close panel
- Panel instantly disappears (no animation)
- Must refresh to close

**✅ PASS if**:
- Click backdrop closes panel
- Click hamburger toggles panel
- Smooth slide-out animation

---

#### ✅ Test 13: Hero Mobile Layout

**Expected**:
- Hero vertical stack
- Padding: 30px (768px), 20px (576px), 15px (≤576px)
- Text readable
- Image fits width
- No horizontal scroll

**How to Check**:
1. Scroll to hero
2. Check vertical layout
3. Try scrolling horizontal (should not scroll)

**✅ PASS if**: Hero fits screen, no horizontal scroll, readable

---

#### ✅ Test 14: Content Mobile Layout

**Expected**:
- Content padding matches hero
- Editorial Team full width
- Sidebar stacks below content (vertical)
- All buttons visible dan clickable

**How to Check**:
1. Scroll to Editorial Team section
2. Check buttons full width
3. Check sidebar below (not side-by-side)

**✅ PASS if**: Content full width, sidebar vertical, all visible

---

## 🔍 CROSS-BROWSER TESTING (Optional but Recommended)

### Test in Multiple Browsers

1. **Google Chrome** (Primary)
2. **Mozilla Firefox**
3. **Microsoft Edge**
4. **Safari** (if on Mac)

### Check:
- ✅ Mobile panel works in all browsers
- ✅ Animation smooth
- ✅ Backdrop overlay functional
- ✅ No console errors

---

## 📊 TESTING SUMMARY TEMPLATE

Copy and fill this after testing:

```
TESTING REPORT - v2.0
Date: _______________
Tester: _______________

DESKTOP (1920px):
[ ] Hero text "Jurnal Riptek" lengkap: PASS / FAIL
[ ] Hero spacing balanced: PASS / FAIL
[ ] Content full width: PASS / FAIL
[ ] Navigation positioned: PASS / FAIL

LAPTOP (1366px - 1200px):
[ ] Responsive padding 1440px: PASS / FAIL
[ ] Vertical stack 1200px: PASS / FAIL

TABLET (992px - 768px):
[ ] Tablet layout: PASS / FAIL
[ ] Sidebar horizontal: PASS / FAIL

MOBILE (≤768px):
[ ] Hamburger visible: PASS / FAIL
[ ] Panel slides from left: PASS / FAIL
[ ] Panel content vertical: PASS / FAIL
[ ] Backdrop overlay: PASS / FAIL
[ ] Close panel works: PASS / FAIL
[ ] Hero mobile fits: PASS / FAIL
[ ] Content mobile fits: PASS / FAIL

OVERALL RESULT: PASS / FAIL / NEEDS ADJUSTMENT

ISSUES FOUND:
1. _______________
2. _______________
3. _______________

SCREENSHOTS:
- Desktop hero: [Attach]
- Mobile navigation: [Attach]
- Mobile panel open: [Attach]
```

---

## 🐛 TROUBLESHOOTING

### Issue: Hero Text Still Cut Off

**Problem**: Text masih shows "nal Riptek"

**Possible Causes**:
1. Browser cache not cleared
2. Old CSS still loaded
3. Padding nilai masih old

**Solutions**:
```
1. Hard refresh: Ctrl + Shift + F5
2. Clear browser cache completely
3. Check CSS file line 308: padding should be 60px 100px
4. If still cut off, increase padding to 120px
```

---

### Issue: Mobile Panel Not Appearing

**Problem**: Click hamburger tidak muncul panel

**Possible Causes**:
1. JavaScript not loaded
2. Bootstrap toggle not working
3. CSS `left: -300px` issue

**Solutions**:
```
1. Check console for JS errors (F12 → Console)
2. Check if hamburger has onclick handler
3. Manually add class "in" or "show" to #nav-menu via DevTools
4. Check CSS line 250: Should have transition: left 0.3s ease
```

---

### Issue: Panel Drops from Top (Old Behavior)

**Problem**: Panel tidak slide from left, masih dari atas

**Possible Causes**:
1. Old CSS cached
2. Bootstrap default behavior overriding
3. Media query not applied

**Solutions**:
```
1. Hard refresh browser
2. Check CSS line 250-260: Should have @media (max-width: 991px)
3. Check #nav-menu has position: fixed and left: -300px
4. Verify with DevTools: Element should have these styles
```

---

### Issue: Content Not Full Width

**Problem**: Content container masih sempit

**Possible Causes**:
1. max-width still 1440px
2. Padding not updated

**Solutions**:
```
1. Check CSS line 428: max-width should be 100vw
2. Check padding: Should be 40px 100px (desktop)
3. Verify with DevTools: Element width should be 100vw
```

---

## ✅ SUCCESS CRITERIA

**v2.0 considered SUCCESSFUL if**:

1. ✅ Desktop (1920px):
   - Hero text "Jurnal Riptek" LENGKAP
   - Spacing balanced (kiri-kanan sama)
   - Content width sama dengan hero
   - No layout shifts atau glitches

2. ✅ Mobile (≤768px):
   - Hamburger visible dan clickable
   - Panel slides FROM LEFT (not top)
   - Panel 280px width dengan backdrop
   - Close works (click backdrop atau hamburger)
   - All content fits (no horizontal scroll)

3. ✅ Responsive (all sizes):
   - Smooth transitions between breakpoints
   - No text cutoff at any size
   - Padding consistent hero-content at each breakpoint
   - All elements visible dan clickable

4. ✅ Cross-browser:
   - Works in Chrome, Firefox, Edge
   - No console errors
   - Animation smooth di semua browser

---

## 📸 DOCUMENTATION

### Screenshots to Take

1. **Desktop (1920px)**:
   - Full hero section showing "Jurnal Riptek" lengkap
   - Content section showing full width alignment

2. **Mobile (400px)**:
   - Hamburger icon closed state
   - Panel open from left
   - Backdrop overlay visible

3. **Responsive**:
   - 1440px layout
   - 1200px vertical stack
   - 768px mobile view

### Share Results

Send screenshots to:
- Project documentation folder
- Team chat
- Testing report document

---

**Testing Duration**: 15-20 minutes  
**Priority**: HIGH - Critical v2.0 features  
**Next Action**: Test now dan report hasil! 🚀

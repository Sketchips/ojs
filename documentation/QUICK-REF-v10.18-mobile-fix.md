# Quick Fix Reference - v10.18 Mobile Header

## File: styleSheet.css
## Version: v10.18
## Date: 2025-11-05

---

## Perubahan Cepat

### Mobile Header (≤767px) - Line 280

```css
#headerNavigationContainer {
    top: 15px !important;  /* ← Naikkan dari 0 ke 15px */
}

.navbar-toggle {
    left: 15px !important;
    top: 18px !important;  /* ← Fixed position, bukan center transform */
}

.navbar-header {
    left: 80px !important; /* ← Geser kanan dari 70px ke 80px */
    top: 8px !important;   /* ← Fixed position, bukan center transform */
}
```

### Mobile Body Padding - Line 1750

```css
body {
    padding-top: 86px !important; /* ← Naikkan dari 71px ke 86px */
}
```

---

## Spacing Logic

```
|<-- 15px -->|<-- 40px -->|<-- 25px -->|<-- Logo & Text -->|
|  margin   | toggle btn |   gap    |                   |
|           |            |          |                   |
   [15]       [55]         [80]       [continuing...]
```

**Clearance**: 80px - 15px = 65px (cukup untuk toggle button + spacing)

---

## Pages Applied
- ✅ Homepage (.pkp_page_index)
- ✅ About Page (.pkp_page_about)
- ✅ Base mobile styles (all pages)

---

## Backup Location
```
backups/styleSheet-backup-mobile-fix-20251105-135415.css
```

---

## Testing Command
```powershell
# Open browser dev tools
# Toggle device toolbar (Ctrl+Shift+M)
# Set width to 375px or 414px (mobile)
# Test pages:
# - http://localhost:8080/index.php/jurnaladit
# - http://localhost:8080/index.php/jurnaladit/about
```

---

## Rollback (jika diperlukan)
```powershell
Copy-Item "d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\backups\styleSheet-backup-mobile-fix-20251105-135415.css" -Destination "d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\ojs\public\journals\1\styleSheet.css"
```

---

## Verifikasi Cepat
- [ ] Header tidak terpotong di atas
- [ ] Toggle button terlihat jelas di kiri
- [ ] Logo dan text tidak overlap dengan toggle
- [ ] Text "Jurnal Riptek" terlihat lengkap
- [ ] Klik toggle button berfungsi
- [ ] Menu sidebar muncul dengan baik

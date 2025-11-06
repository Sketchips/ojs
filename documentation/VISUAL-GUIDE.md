# 🎨 VISUAL GUIDE - Modern OJS Theme Layout

## 📐 Layout Structure Overview

```
╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║  MODERN OJS THEME - VISUAL LAYOUT STRUCTURE                               ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

---

## 1. HEADER LAYOUT (COMPACT - 65px)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ ┌─────────────┐                                     ┌────────┐ ┌──────┐ │
│ │   JURNAL    │   Current  Archives  About ▼        │ 🔍     │ │ adit │ │
│ │   ADIT      │   ═══════                           │        │ │  👤  │ │
│ └─────────────┘                                     └────────┘ └──────┘ │
└─────────────────────────────────────────────────────────────────────────┘
  ↑                 ↑                                   ↑          ↑
  Logo              Navigation Menu                    Search    Account
  (Gradient)        (Hover = Underline)                Bar       Button
```

### Breakdown:
- **Height:** 65px (compact!)
- **Logo:** Left side, gradient text
- **Menu:** Center, dengan underline animation
- **Search:** 180px from right, expands on focus
- **Account:** Absolute right, gradient button

---

## 2. CAROUSEL BANNER (LARGE - 600px)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│                                                                         │
│                      ╔════════════════════════╗                         │
│                      ║                        ║                         │
│   ◀                  ║  Welcome to Jurnal!   ║                    ▶    │
│                      ║  Leading Research...   ║                         │
│                      ╚════════════════════════╝                         │
│                                                                         │
│                         ● ▬▬▬▬ ●  ●                                    │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
  ↑                     ↑                                ↑         ↑
  Left                Caption                           Right    Dots
  Arrow              (Bottom)                           Arrow   (Bottom)
```

### Breakdown:
- **Height:** 600px (desktop), responsive ke 450px/350px/280px
- **Controls:** Circle arrows dengan blur background
- **Indicators:** Dots yang expand saat active
- **Overlay:** Gradient dari bottom untuk readability
- **Caption:** Center bottom dengan shadow

---

## 3. MAIN CONTENT AREA

```
┌─────────────────────────────────────────┬───────────────────────────────┐
│                                         │                               │
│  Latest Articles                        │  Current Issue                │
│                                         │  ┌─────────────────────┐      │
│  ┌──────────────────────────────────┐   │  │                     │      │
│  │ The Impact of Machine Learning  │   │  │   VOL 12  NO 2     │      │
│  │                                  │   │  │                     │      │
│  │ Dr. John Smith | Oct 15, 2025   │   │  │   COVER IMAGE      │      │
│  │                                  │   │  │                     │      │
│  │ This comprehensive study...      │   │  └─────────────────────┘      │
│  │                                  │   │                               │
│  │ [Read Article]  [Download PDF]   │   │  ┌─────────────────────┐     │
│  └──────────────────────────────────┘   │  │  Announcements      │     │
│        ↑ Hover = Lift + Shadow          │  │  • Call for Papers  │     │
│                                         │  │  • New Guidelines   │     │
│  ┌──────────────────────────────────┐   │  └─────────────────────┘     │
│  │ Sustainable Urban Development   │   │                               │
│  │ ...                              │   │  ┌─────────────────────┐     │
│  └──────────────────────────────────┘   │  │  Journal Stats      │     │
│                                         │  │  1,234 Articles     │     │
│                                         │  │  856 Citations      │     │
│                                         │  └─────────────────────┘     │
└─────────────────────────────────────────┴───────────────────────────────┘
  ↑                                         ↑
  Main Column (col-md-9)                   Sidebar (col-md-3)
```

### Breakdown:
- **Layout:** 9 columns + 3 columns (Bootstrap grid)
- **Cards:** White background, rounded corners, shadow
- **Hover:** Card lifts 8px dengan shadow lebih besar
- **Sidebar:** Panels dengan gradient headers

---

## 4. FOOTER LAYOUT

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ╔═══════════════════════════╗                        │
│                    ║  GRADIENT BACKGROUND      ║                        │
│  Jurnal Adit       ║  (Blue → Purple)          ║    Contact Info       │
│                    ╚═══════════════════════════╝                        │
│  Description...        Quick Links                  📧 email@...        │
│                        • Current                    📍 Address          │
│                        • Archives                                       │
│                        • About                                          │
│                                                                         │
│  ─────────────────────────────────────────────────────────────────────  │
│                                                                         │
│       © 2025 Jurnal Adit | Powered by Open Journal Systems             │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### Breakdown:
- **Background:** Gradient (biru → ungu)
- **Color:** White text
- **Layout:** 3 columns
- **Padding:** Generous spacing (2xl)

---

## 5. RESPONSIVE BREAKPOINTS VISUAL

### Desktop (> 992px)
```
┌────────────────────────────────────────────────────────────┐
│ [Logo]    Menu Menu Menu        [Search 🔍]    [Account]  │ ← 65px
├────────────────────────────────────────────────────────────┤
│                                                            │
│                   CAROUSEL BANNER                          │ ← 600px
│                                                            │
├────────────────────────────────────────┬───────────────────┤
│                                        │                   │
│         Main Content                   │    Sidebar        │
│         (9 columns)                    │   (3 columns)     │
│                                        │                   │
└────────────────────────────────────────┴───────────────────┘
```

### Tablet (768-992px)
```
┌────────────────────────────────────────────────────────────┐
│ [Logo]    Menu Menu ▼                                      │
│                           [Search 🔍]    [Account]         │ ← 65px
├────────────────────────────────────────────────────────────┤
│                                                            │
│                CAROUSEL BANNER                             │ ← 450px
│                                                            │
├────────────────────────────────────────┬───────────────────┤
│                                        │                   │
│         Main Content                   │    Sidebar        │
│                                        │                   │
└────────────────────────────────────────┴───────────────────┘
```

### Mobile (< 768px)
```
┌──────────────────────────────────────┐
│ [Logo]              ☰               │
│                                      │ ← 60px
├──────────────────────────────────────┤
│                                      │
│     CAROUSEL BANNER                  │ ← 350px
│                                      │
├──────────────────────────────────────┤
│                                      │
│        Main Content                  │
│                                      │
├──────────────────────────────────────┤
│                                      │
│          Sidebar                     │
│                                      │
└──────────────────────────────────────┘
```

---

## 6. COLOR SCHEME VISUAL

```
╔══════════════════════════════════════════════════════════════╗
║                    COLOR PALETTE                             ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  PRIMARY COLORS:                                             ║
║  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐    ║
║  │  #4F46E5 │  │  #7C3AED │  │  #F59E0B │  │  #EC4899 │    ║
║  │   Blue   │  │  Purple  │  │  Orange  │  │   Pink   │    ║
║  └──────────┘  └──────────┘  └──────────┘  └──────────┘    ║
║                                                              ║
║  GRADIENTS:                                                  ║
║  ┌────────────────────────────────────────────────────┐     ║
║  │  #667eea ═══════════════════════════════► #764ba2  │     ║
║  │         Primary Gradient (Blue → Purple)           │     ║
║  └────────────────────────────────────────────────────┘     ║
║                                                              ║
║  ┌────────────────────────────────────────────────────┐     ║
║  │  #f093fb ═══════════════════════════════► #f5576c  │     ║
║  │         Accent Gradient (Pink → Red)               │     ║
║  └────────────────────────────────────────────────────┘     ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

## 7. INTERACTIVE STATES

### Button States
```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  NORMAL STATE:                                              │
│  ┌────────────────────┐                                     │
│  │  Read Article      │  ← Gradient background              │
│  └────────────────────┘     Medium shadow                   │
│                                                             │
│  HOVER STATE:                                               │
│  ┌────────────────────┐                                     │
│  │  Read Article      │  ← Lifts up 3px                     │
│  └────────────────────┘     Shadow increases                │
│       ▲                     Cursor: pointer                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Card States
```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  NORMAL:                                                    │
│  ┌──────────────────────────────────────────┐               │
│  │  Article Title                           │               │
│  │  Article content...                      │               │
│  │                                          │               │
│  └──────────────────────────────────────────┘               │
│                                                             │
│  HOVER:                                                     │
│       ┌──────────────────────────────────────────┐          │
│       │  Article Title                           │          │
│       │  Article content...                      │          │
│       │                                          │          │
│       └──────────────────────────────────────────┘          │
│       ▲ Lifts 8px + border changes to primary color        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Search Bar States
```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  NORMAL:                                                    │
│  ┌──────────────────────┐ 🔍                                │
│  │  Search...           │ ○   ← 240px wide                 │
│  └──────────────────────┘                                   │
│                                                             │
│  FOCUS:                                                     │
│  ┌───────────────────────────────┐ 🔍                       │
│  │  Search...                    │ ●   ← 300px wide        │
│  └───────────────────────────────┘     Border glow         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 8. SPACING & DIMENSIONS

```
╔══════════════════════════════════════════════════════════════╗
║                 KEY MEASUREMENTS                             ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  HEADER:                                                     ║
║  • Height: 65px (desktop), 60px (mobile)                     ║
║  • Logo height: 45px                                         ║
║  • Menu padding: 0.75rem 1.25rem                             ║
║                                                              ║
║  CAROUSEL:                                                   ║
║  • Desktop: 600px                                            ║
║  • Tablet: 450px                                             ║
║  • Mobile: 350px                                             ║
║  • Small: 280px                                              ║
║  • Width: 100% (full width)                                  ║
║                                                              ║
║  SEARCH BAR:                                                 ║
║  • Normal width: 240px                                       ║
║  • Focus width: 300px                                        ║
║  • Height: 42px                                              ║
║  • Position: 180px from right                                ║
║                                                              ║
║  CARDS:                                                      ║
║  • Border radius: 16px                                       ║
║  • Padding: 2rem                                             ║
║  • Margin bottom: 2rem                                       ║
║  • Hover lift: 8px                                           ║
║                                                              ║
║  BUTTONS:                                                    ║
║  • Padding: 0.75rem 2rem                                     ║
║  • Border radius: 9999px (full round)                        ║
║  • Hover lift: 3px                                           ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

## 9. ANIMATION TIMELINE

```
User Interaction          Animation                 Duration
─────────────────────────────────────────────────────────────
Page Load           │     
                    ├──► Header appears             0.3s
                    ├──► Carousel fades in          0.5s
                    └──► Cards fade up              0.6s
                    
Scroll Down         │
                    └──► Header shadow increases    0.3s
                    
Hover Card          │
                    ├──► Card lifts up              0.3s
                    └──► Shadow expands             0.3s
                    
Click Button        │
                    └──► Scale pulse                0.2s
                    
Focus Search        │
                    ├──► Width expands              0.3s
                    └──► Border glow                0.3s
                    
Carousel Auto       │
                    └──► Slide transition           0.6s
                         (every 5 seconds)
```

---

## 10. MOBILE INTERACTION FLOW

```
┌─────────────────────────────────────┐
│ [Logo]              ☰               │
└─────────────────────────────────────┘
                     │
                     │ Tap Hamburger
                     ▼
┌─────────────────────────────────────┐
│ [Logo]              ✕               │
├─────────────────────────────────────┤
│  Current                            │
│  Archives                           │
│  About ▼                            │
│  ┌─────────────────────────────┐    │
│  │ Search...              🔍  │    │
│  └─────────────────────────────┘    │
│  [Account Login]                    │
└─────────────────────────────────────┘
```

---

## 11. ACCESSIBILITY FEATURES

```
╔══════════════════════════════════════════════════════════════╗
║               ACCESSIBILITY CHECKLIST                        ║
╠══════════════════════════════════════════════════════════════╣
║                                                              ║
║  ✓ Keyboard Navigation                                       ║
║    • Tab through all interactive elements                    ║
║    • Ctrl+K to focus search                                  ║
║    • Escape to close menus                                   ║
║    • Arrow keys for carousel                                 ║
║                                                              ║
║  ✓ Screen Reader Support                                     ║
║    • Semantic HTML (nav, main, footer, article)              ║
║    • ARIA labels on interactive elements                     ║
║    • Alt text for images                                     ║
║    • Skip to content link                                    ║
║                                                              ║
║  ✓ Color Contrast                                            ║
║    • Text: 4.5:1 minimum ratio                               ║
║    • Interactive elements: 3:1 minimum                       ║
║    • Gradient overlays for readability                       ║
║                                                              ║
║  ✓ Focus Indicators                                          ║
║    • Visible focus rings                                     ║
║    • Consistent focus styling                                ║
║    • High contrast outline                                   ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

---

## 12. PERFORMANCE METRICS

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  LOADING TIMELINE:                                           │
│                                                              │
│  0ms ────────────────────────────────────► 3000ms            │
│   │                                           │              │
│   │                                           │              │
│   ├─► HTML Loaded (200ms)                     │              │
│   │                                           │              │
│   ├──────► CSS Loaded (500ms)                 │              │
│   │                                           │              │
│   ├────────────► JS Loaded (800ms)            │              │
│   │                                           │              │
│   ├──────────────────► Images Loaded (1500ms) │              │
│   │                                           │              │
│   └────────────────────────────────────────►  │              │
│                                    Fully Interactive         │
│                                                              │
│  PERFORMANCE SCORES:                                         │
│  ┌────────────────────┐                                      │
│  │ First Paint: 400ms │  🟢 Excellent                        │
│  └────────────────────┘                                      │
│  ┌─────────────────────────┐                                 │
│  │ Time to Interactive: 1s │  🟢 Excellent                   │
│  └─────────────────────────┘                                 │
│  ┌──────────────────────────────┐                            │
│  │ Largest Content Paint: 1.5s  │  🟢 Good                   │
│  └──────────────────────────────┘                            │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

**END OF VISUAL GUIDE**

*Gunakan guide ini sebagai referensi saat mengimplementasikan theme*
*Semua dimensi dan spacing dapat disesuaikan sesuai kebutuhan*

---

Created with ❤️ for Modern OJS Experience
Last Updated: October 17, 2025

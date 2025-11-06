# 🎨 Modern OJS Theme - Panduan Instalasi

## 📋 Deskripsi

Theme modern untuk Open Journal Systems (OJS) 3 dengan tampilan yang fresh, clean, dan professional. Theme ini menggunakan Bootstrap 3 sebagai base dengan custom CSS yang powerful.

## ✨ Fitur Utama

### 🎯 Header Modern & Compact
- Header yang lebih kecil dan minimalis (65px)
- Logo dengan efek gradient yang menarik
- Navigasi menu dengan hover effect yang smooth
- Position fixed dengan blur effect

### 🔍 Search Bar Strategis
- Search bar diletakkan di sebelah kiri akun (pojok kanan atas)
- Animasi expand saat focus
- Icon search dengan gradient background
- Responsive untuk mobile

### 👤 User Account
- Tombol akun di pojok kanan atas
- Gradient button dengan shadow yang menarik
- Hover effect yang smooth

### 🎠 Carousel Banner Besar
- Banner carousel setinggi 600px (lebih besar dan prominent)
- Gradient overlay untuk readability
- Modern control buttons (arrow & dots)
- Auto-slide dengan smooth transition
- Responsive untuk berbagai ukuran layar

### 🎨 Modern Color Scheme
- **Primary**: Gradient biru-ungu (#667eea → #764ba2)
- **Accent**: Pink-red gradient (#f093fb → #f5576c)
- **Supporting**: Cool blue gradient (#4facfe → #00f2fe)
- Warna yang eye-catching tapi tetap professional

### 🎭 Interactive Elements
- Smooth transitions pada semua element
- Hover effects dengan transform & shadow
- Card hover dengan lift effect
- Animated buttons dengan gradient
- Custom scrollbar dengan gradient

### 📱 Fully Responsive
- Desktop: Full features
- Tablet: Optimized layout
- Mobile: Touch-friendly dengan stack layout

## 📁 File yang Disediakan

```
📦 Modern OJS Theme Package
 ┣ 📄 modern-ojs-theme.css       # File CSS utama (drag & drop ready)
 ┣ 📄 demo-modern-theme.html     # Demo/preview theme
 ┗ 📄 README-MODERN-THEME.md     # File ini (panduan)
```

## 🚀 Cara Instalasi

### Metode 1: Upload Langsung (Recommended)

1. **Download file CSS**
   - File: `modern-ojs-theme.css`
   - Lokasi saat ini: `d:\0-tugas-IK-D\projek-gabut\ojees\ojs-docker\`

2. **Login ke OJS Admin Panel**
   - Buka browser → `http://localhost:8080` (atau URL OJS Anda)
   - Login sebagai Administrator

3. **Upload CSS**
   - Pergi ke: **Settings** → **Website** → **Appearance**
   - Scroll ke bagian **Advanced**
   - Di bagian **Journal Stylesheet**, klik **Upload**
   - Pilih file `modern-ojs-theme.css`
   - Klik **Save**

### Metode 2: Manual Copy (Untuk Docker)

Jika menggunakan Docker seperti setup Anda:

```bash
# 1. Copy file CSS ke folder OJS
cp modern-ojs-theme.css ojs/public/

# 2. Atau jika menggunakan volume mounting
# Copy ke folder styles yang dimapping
```

Kemudian tambahkan di config OJS atau template header:
```html
<link rel="stylesheet" href="{$baseUrl}/modern-ojs-theme.css">
```

### Metode 3: Inject via Template

Edit file template header OJS:
- File: `ojs/templates/frontend/components/header.tpl`
- Tambahkan sebelum closing `</head>`:

```html
<!-- Modern Custom Theme -->
<link rel="stylesheet" href="{$baseUrl}/modern-ojs-theme.css">
```

## 🎨 Kustomisasi Warna

Anda bisa mengubah warna dengan mengedit CSS variables di bagian `:root`:

```css
:root {
    /* Ubah warna sesuai keinginan */
    --primary-blue: #4F46E5;        /* Warna utama */
    --primary-purple: #7C3AED;      /* Warna aksen */
    --accent-orange: #F59E0B;       /* Warna highlight */
    
    /* Atau gunakan gradient custom */
    --gradient-primary: linear-gradient(135deg, #YOUR_COLOR_1 0%, #YOUR_COLOR_2 100%);
}
```

## 🖼️ Setup Carousel Banner

### Cara 1: Via OJS Admin (Homepage Image)

1. Login sebagai Admin
2. Pergi ke: **Settings** → **Website** → **Appearance**
3. Di bagian **Homepage Image**, upload gambar banner
4. Recommended size: **1920x600px** untuk hasil optimal
5. Format: JPG atau PNG

### Cara 2: Custom HTML (Untuk Multiple Slides)

Edit file `templates/frontend/pages/indexJournal.tpl`:

```html
<!-- Carousel Banner -->
<div id="mainCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#mainCarousel" data-slide-to="1"></li>
        <li data-target="#mainCarousel" data-slide-to="2"></li>
    </ol>
    
    <div class="carousel-inner">
        <div class="item active">
            <img src="path/to/image1.jpg" alt="Slide 1">
            <div class="carousel-caption">
                <h1>Your Title Here</h1>
                <p>Your subtitle here</p>
            </div>
        </div>
        <div class="item">
            <img src="path/to/image2.jpg" alt="Slide 2">
            <div class="carousel-caption">
                <h1>Second Slide</h1>
                <p>Description</p>
            </div>
        </div>
    </div>
    
    <a class="left carousel-control" href="#mainCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#mainCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
```

## 📸 Preview Theme

Untuk melihat preview theme sebelum install:

1. Buka file `demo-modern-theme.html` di browser
2. Atau jalankan local server:
   ```bash
   # Menggunakan Python
   python -m http.server 8000
   
   # Lalu buka: http://localhost:8000/demo-modern-theme.html
   ```

## 🎯 Fitur-Fitur Detail

### Header Interactions
- **Scroll Effect**: Header akan mendapat shadow lebih tebal saat scroll
- **Logo Hover**: Logo akan scale up saat di-hover
- **Menu Hover**: Menu akan mendapat gradient background + shadow

### Search Bar
- **Focus State**: Width expand dari 240px → 300px
- **Button**: Gradient background dengan glow effect
- **Position**: 180px dari kanan (sebelah kiri akun)

### Carousel Features
- **Auto-slide**: Slide otomatis setiap 5 detik
- **Pause on Hover**: Berhenti saat mouse hover
- **Swipe Support**: Support swipe di mobile devices
- **Indicators**: Dots yang expand saat active
- **Controls**: Arrow buttons dengan blur background

### Card/Article Hover
- **Lift Effect**: Card akan naik 8px saat hover
- **Shadow**: Shadow bertambah besar
- **Border**: Border berubah ke primary color

### Buttons
- **Gradient Background**: All primary buttons use gradient
- **Hover Lift**: Tombol naik 3px saat hover
- **Shadow**: Shadow effect bertambah
- **Uppercase**: Text uppercase dengan letter spacing

## 🔧 Troubleshooting

### CSS Tidak Muncul
1. Clear browser cache (Ctrl+F5)
2. Pastikan path CSS benar
3. Check browser console untuk error
4. Pastikan file CSS ter-upload dengan benar

### Carousel Tidak Jalan
1. Pastikan jQuery loaded
2. Pastikan Bootstrap JS loaded
3. Check console untuk JavaScript error
4. Pastikan HTML structure sesuai

### Header Overlap Content
- Body padding sudah diset ke 65px
- Jika masih overlap, tambahkan padding di CSS:
```css
body {
    padding-top: 80px !important; /* Sesuaikan nilai */
}
```

### Search Bar Tidak di Posisi yang Benar
1. Check apakah element parent sudah position: relative
2. Adjust nilai `right` di CSS:
```css
.navbar-form {
    right: 180px !important; /* Ubah nilai sesuai kebutuhan */
}
```

## 📱 Responsive Breakpoints

```
Desktop:  > 992px   - Full features
Tablet:   768-992px - Stack search & user menu
Mobile:   < 768px   - Stack navigation, smaller carousel
Small:    < 480px   - Minimal carousel height
```

## 🎨 Color Palette Reference

```css
/* Modern Blues & Purples */
Indigo:  #4F46E5
Purple:  #7C3AED
Pink:    #EC4899
Orange:  #F59E0B

/* Gradients */
Primary: #667eea → #764ba2
Accent:  #f093fb → #f5576c
Cool:    #4facfe → #00f2fe
Warm:    #fa709a → #fee140
```

## 📈 Performance Tips

1. **Optimize Images**
   - Compress banner images (use tinypng.com)
   - Recommended: 1920x600px, < 200KB

2. **Lazy Loading**
   - Implement lazy loading untuk images
   - Bootstrap 4+ support native lazy loading

3. **Minify CSS**
   - Untuk production, minify CSS file
   - Gunakan tools: cssnano, clean-css

## 🤝 Support & Customization

Jika butuh kustomisasi lebih lanjut:

1. **Ubah Ukuran Header**
   ```css
   .navbar {
       min-height: 70px !important; /* Ubah sesuai kebutuhan */
   }
   ```

2. **Ubah Tinggi Carousel**
   ```css
   .carousel,
   .carousel-inner,
   .carousel img {
       height: 500px !important; /* Ubah sesuai kebutuhan */
   }
   ```

3. **Ubah Position Search**
   ```css
   .navbar-form {
       right: 200px !important; /* Geser kiri/kanan */
   }
   ```

## 📝 Catatan Penting

- ✅ Theme ini **kompatibel** dengan OJS 3.x + Bootstrap 3
- ✅ **Responsive** dan **mobile-friendly**
- ✅ **No JavaScript conflicts** dengan OJS core
- ✅ Bisa di-**drag & drop** langsung
- ✅ **Cross-browser compatible** (Chrome, Firefox, Safari, Edge)

## 🎯 Yang Sudah Diimplementasikan

✅ Header compact (65px)
✅ Search bar di sebelah kiri akun
✅ User account button di pojok kanan atas
✅ Carousel banner besar (600px)
✅ Modern color scheme (gradient)
✅ Smooth transitions & animations
✅ Card hover effects
✅ Gradient buttons
✅ Custom scrollbar
✅ Fully responsive
✅ Modern typography (Inter & Poppins)

## 📞 Contact

Jika ada pertanyaan atau butuh bantuan:
- Email: admin@jurnaladit.com
- Review demo di: `demo-modern-theme.html`

---

**Created with ❤️ for Modern OJS Experience**

*Last updated: October 17, 2025*

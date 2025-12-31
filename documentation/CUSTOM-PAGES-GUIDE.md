# Panduan Isian Halaman Custom OJS
> Dokumentasi lengkap untuk mengisi konten halaman-halaman non-vanilla (sidebar, announcement, contact, dll)

**Versi:** 1.0  
**Tanggal:** 12 November 2025  
**Penulis:** OJS Development Team

---

## 📋 Daftar Isi
1. [Halaman About dengan Sidebar](#halaman-about-dengan-sidebar)
2. [Halaman Contact (Standalone)](#halaman-contact-standalone)
3. [Halaman Announcements](#halaman-announcements)
4. [Halaman Submissions](#halaman-submissions)

---

## 1. Halaman About dengan Sidebar

### 📁 File Terkait
```
ojs/plugins/themes/bootstrap3/templates/frontend/pages/
├── about.tpl (About Journal - Main page)
├── authorGuidelines.tpl (Panduan untuk penulis)
├── peerReview.tpl (Proses peer-review)
├── focusAndScope.tpl (Fokus dan scope jurnal)
├── sectionPolicies.tpl (Kebijakan section)
└── editorialTeam.tpl (Tim editorial)
```

### 🎯 Karakteristik
- ✅ Menggunakan **sidebar menu** di sebelah kiri
- ✅ Hero section dengan **logo di hero** (bukan header)
- ✅ Include `aboutHero.tpl` dan `aboutSidebar.tpl`
- ✅ Content area dengan max-width 800px

### 📝 Cara Mengisi Konten

#### A. About Journal (`about.tpl`)
**Lokasi Konten:** Dalam tag `<section class="info-section about-section">`

```smarty
<section class="info-section about-section">
    <h2 class="section-title">About Journal</h2>
    <div class="section-content">
        <p>Isi dengan informasi umum tentang jurnal, sejarah, tujuan, dll.</p>
        
        <h3>Contoh Sub-judul</h3>
        <p>Paragraf konten di sini...</p>
        
        <ul>
            <li>Point 1</li>
            <li>Point 2</li>
        </ul>
    </div>
</section>
```

**Apa yang bisa diisi:**
- Sejarah jurnal
- Visi dan misi
- Tujuan penerbitan
- Frekuensi terbit
- Kebijakan open access
- Info akreditasi/indexing

---

#### B. Author Guidelines (`authorGuidelines.tpl`)
**Lokasi Konten:** Dalam tag `<div class="main-content-area">`

```smarty
<div class="main-content-area">
    <section class="info-section">
        <h2 class="section-title">Author Guidelines</h2>
        <div class="section-content">
            
            <h3>1. Format Naskah</h3>
            <ul>
                <li>Font: Times New Roman, 12pt</li>
                <li>Spacing: 1.5</li>
                <li>Margin: 3cm (atas, bawah, kiri, kanan)</li>
            </ul>
            
            <h3>2. Struktur Artikel</h3>
            <p>Artikel harus memiliki struktur sebagai berikut:</p>
            <ol>
                <li>Judul (maksimal 15 kata)</li>
                <li>Abstrak (150-250 kata)</li>
                <li>Kata kunci (3-5 kata)</li>
                <li>Pendahuluan</li>
                <li>Metode</li>
                <li>Hasil dan Pembahasan</li>
                <li>Kesimpulan</li>
                <li>Daftar Pustaka</li>
            </ol>
            
            <h3>3. Sitasi dan Referensi</h3>
            <p>Gunakan gaya sitasi APA 7th edition...</p>
            
        </div>
    </section>
</div>
```

**Apa yang bisa diisi:**
- Panduan format manuscript
- Template artikel (link download)
- Aturan penulisan (font, spacing, margins)
- Struktur artikel (IMRAD, dll)
- Panduan sitasi dan referensi
- Aturan gambar dan tabel
- Checklist submission

---

#### C. Peer-Review Process (`peerReview.tpl`)
**Lokasi Konten:** Dalam tag `<section class="info-section">`

```smarty
<section class="info-section">
    <h2 class="section-title">Peer-Review Process</h2>
    <div class="section-content">
        
        <h3>Jenis Review</h3>
        <p>Jurnal ini menggunakan sistem <strong>double-blind peer review</strong>.</p>
        
        <h3>Tahapan Review</h3>
        <ol>
            <li><strong>Initial Screening</strong>: Editor memeriksa kesesuaian dengan scope jurnal (1-3 hari)</li>
            <li><strong>Peer Review</strong>: 2 reviewer independen melakukan evaluasi (2-4 minggu)</li>
            <li><strong>Decision</strong>: Editor membuat keputusan berdasarkan rekomendasi reviewer</li>
            <li><strong>Revision</strong>: Penulis melakukan perbaikan jika diperlukan</li>
            <li><strong>Final Decision</strong>: Accept/Reject final</li>
        </ol>
        
        <h3>Kriteria Penilaian</h3>
        <ul>
            <li>Originalitas dan kontribusi ilmiah</li>
            <li>Metodologi penelitian</li>
            <li>Kejelasan penulisan</li>
            <li>Relevansi dengan scope jurnal</li>
        </ul>
        
        <h3>Timeline</h3>
        <p>Proses review biasanya memakan waktu <strong>6-8 minggu</strong> sejak submission.</p>
        
    </div>
</section>
```

**Apa yang bisa diisi:**
- Jenis peer review (single/double blind)
- Tahapan proses review
- Timeline review
- Kriteria penilaian
- Etika reviewer
- Kebijakan konflik kepentingan

---

#### D. Focus and Scope (`focusAndScope.tpl`)
**Lokasi Konten:** Dalam tag `<section class="info-section">`

```smarty
<section class="info-section">
    <h2 class="section-title">Focus and Scope</h2>
    <div class="section-content">
        
        <p>Jurnal Riptek menerbitkan artikel penelitian original dalam bidang:</p>
        
        <h3>1. Teknologi Informasi</h3>
        <ul>
            <li>Artificial Intelligence dan Machine Learning</li>
            <li>Data Science dan Big Data</li>
            <li>Cloud Computing</li>
            <li>Cybersecurity</li>
            <li>Internet of Things (IoT)</li>
        </ul>
        
        <h3>2. Rekayasa Perangkat Lunak</h3>
        <ul>
            <li>Software Engineering</li>
            <li>Mobile Application Development</li>
            <li>Web Technologies</li>
            <li>DevOps</li>
        </ul>
        
        <h3>3. Sistem Informasi</h3>
        <ul>
            <li>Enterprise Systems</li>
            <li>E-Government</li>
            <li>Digital Transformation</li>
            <li>Business Intelligence</li>
        </ul>
        
        <p><strong>Catatan:</strong> Jurnal ini tidak menerima artikel review atau artikel konseptual tanpa data empiris.</p>
        
    </div>
</section>
```

**Apa yang bisa diisi:**
- Bidang ilmu yang dicakup
- Sub-topik detail per bidang
- Jenis artikel yang diterima
- Jenis artikel yang TIDAK diterima
- Scope geografis (nasional/internasional)

---

#### E. Section Policies (`sectionPolicies.tpl`)
**Lokasi Konten:** Dalam tag `<section class="info-section">`

```smarty
<section class="info-section">
    <h2 class="section-title">Section Policies</h2>
    <div class="section-content">
        
        <h3>Articles</h3>
        <p><strong>Peer Reviewed:</strong> Yes</p>
        <p><strong>Open Submissions:</strong> Yes</p>
        <p><strong>Indexed:</strong> Yes</p>
        <p><strong>Page Limit:</strong> 8-15 halaman</p>
        <p>Section ini menerima artikel penelitian original dengan metodologi yang jelas.</p>
        
        <h3>Reviews</h3>
        <p><strong>Peer Reviewed:</strong> Yes</p>
        <p><strong>Open Submissions:</strong> By invitation only</p>
        <p><strong>Indexed:</strong> Yes</p>
        <p><strong>Page Limit:</strong> 15-25 halaman</p>
        <p>Artikel review sistematis atau literature review.</p>
        
        <h3>Technical Notes</h3>
        <p><strong>Peer Reviewed:</strong> Yes</p>
        <p><strong>Open Submissions:</strong> Yes</p>
        <p><strong>Indexed:</strong> No</p>
        <p><strong>Page Limit:</strong> 4-8 halaman</p>
        <p>Catatan teknis, implementasi, atau case studies.</p>
        
    </div>
</section>
```

**Apa yang bisa diisi:**
- Daftar section yang ada di jurnal
- Kebijakan per section (peer reviewed, open submission, dll)
- Batasan halaman per section
- Jenis konten yang sesuai per section
- Indexing policy per section

---

#### F. Editorial Team (`editorialTeam.tpl`)
**Lokasi Konten:** Dalam tag `<section class="info-section">`

```smarty
<section class="info-section">
    <h2 class="section-title">Editorial Team</h2>
    <div class="section-content">
        
        <h3>Editor-in-Chief</h3>
        <div class="editor-profile">
            <p><strong>Dr. Nama Editor</strong></p>
            <p>Universitas ABC, Indonesia</p>
            <p>Email: editor@example.com</p>
            <p>Research Interest: AI, Machine Learning</p>
        </div>
        
        <h3>Managing Editor</h3>
        <div class="editor-profile">
            <p><strong>Prof. Nama Managing Editor</strong></p>
            <p>Universitas XYZ, Indonesia</p>
            <p>Email: managing@example.com</p>
        </div>
        
        <h3>Editorial Board</h3>
        <div class="editor-list">
            <div class="editor-profile">
                <p><strong>Dr. Board Member 1</strong></p>
                <p>Universitas DEF, Indonesia</p>
                <p>Specialization: Data Science</p>
            </div>
            <div class="editor-profile">
                <p><strong>Dr. Board Member 2</strong></p>
                <p>University GHI, Malaysia</p>
                <p>Specialization: Software Engineering</p>
            </div>
        </div>
        
        <h3>Reviewers</h3>
        <p>Daftar reviewer aktif jurnal ini mencakup pakar dari berbagai institusi:</p>
        <ul>
            <li>Dr. Reviewer 1 (Universitas AAA)</li>
            <li>Dr. Reviewer 2 (Universitas BBB)</li>
            <li>Prof. Reviewer 3 (University CCC)</li>
        </ul>
        
    </div>
</section>
```

**Apa yang bisa diisi:**
- Editor-in-Chief (nama, afiliasi, email, foto)
- Managing Editor
- Editorial Board members
- Technical Editors
- Layout Editors
- Daftar Reviewers
- Contact person per role

---

## 2. Halaman Contact (Standalone)

### 📁 File: `contact.tpl`

### 🎯 Karakteristik
- ✅ **Standalone page** (tidak ada sidebar)
- ✅ Hero section dengan **logo di hero**
- ✅ Full-width content area
- ✅ Layout sama seperti homepage

### 📝 Cara Mengisi Konten

**Lokasi Konten:** Dalam tag `<div class="main-content-area">`

```smarty
<div class="main-content-area" style="margin-left: 0; max-width: 100%; padding: 40px 60px;">
    
    {* Mailing Address *}
    {if $mailingAddress}
        <div class="contact-section" style="margin-bottom: 40px;">
            <h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
                Alamat
            </h2>
            <div class="contact-section-content address">
                Badan Riset dan Inovasi Daerah<br>
                Kota Semarang<br>
                Jl. Pemuda No.148, Sekayu<br>
                Kec. Semarang Tengah, Kota Semarang<br>
                Jawa Tengah 50132<br>
                Indonesia
            </div>
        </div>
    {/if}
    
    {* Principal Contact *}
    <div class="contact-section" style="margin-bottom: 40px;">
        <h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
            Principal Contact
        </h2>
        <div class="contact-section-content">
            <p><strong>Name:</strong> Dr. John Doe</p>
            <p><strong>Email:</strong> <a href="mailto:editor@example.com">editor@example.com</a></p>
            <p><strong>Phone:</strong> +62 24 1234567</p>
        </div>
    </div>
    
    {* Technical Support *}
    <div class="contact-section" style="margin-bottom: 40px;">
        <h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
            Technical Support
        </h2>
        <div class="contact-section-content">
            <p><strong>Email:</strong> <a href="mailto:support@example.com">support@example.com</a></p>
            <p><strong>Response Time:</strong> 1-2 working days</p>
        </div>
    </div>
    
    {* Social Media *}
    <div class="contact-section">
        <h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
            Connect With Us
        </h2>
        <div class="contact-section-content">
            <p>Follow kami di media sosial:</p>
            <ul>
                <li>Twitter: <a href="https://twitter.com/jurnalriptek">@jurnalriptek</a></li>
                <li>Instagram: <a href="https://instagram.com/jurnalriptek">@jurnalriptek</a></li>
                <li>LinkedIn: <a href="https://linkedin.com/company/jurnalriptek">Jurnal Riptek</a></li>
            </ul>
        </div>
    </div>
    
</div>
```

**Apa yang bisa diisi:**
- **Mailing Address:** Alamat lengkap kantor/institusi
- **Principal Contact:** Kontak editor utama (nama, email, phone)
- **Technical Support:** Kontak untuk masalah teknis submission
- **Support Contact:** Kontak alternatif
- **Social Media:** Link ke akun sosmed jurnal
- **Operating Hours:** Jam operasional (jika ada)
- **Map Embed:** Google Maps iframe (optional)

**Tips:**
- Gunakan `{if $mailingAddress}` untuk data dari OJS settings
- Atau hard-code langsung dalam HTML jika lebih mudah
- Bisa tambahkan Google Maps embed untuk lokasi kantor

---

## 3. Halaman Announcements

### 📁 File: `announcements.tpl`

### 🎯 Karakteristik
- ✅ **Standalone page** (tidak ada sidebar)
- ✅ Hero section dengan logo
- ✅ Full-width content area
- ✅ Otomatis menampilkan announcements dari database OJS

### 📝 Cara Mengisi Announcements

#### Melalui OJS Dashboard:
1. Login sebagai **Journal Manager**
2. Masuk ke **Settings → Website → Announcements**
3. Enable announcements
4. Klik **Add Announcement**
5. Isi form:
   - **Title:** Judul pengumuman
   - **Description (Short):** Ringkasan (tampil di list)
   - **Description (Long):** Isi lengkap pengumuman
   - **Date Posted:** Tanggal publish
   - **Date Expire:** Tanggal kadaluarsa (optional)

#### Contoh Announcements:
```
Title: Call for Papers - Special Issue 2025
Short Description: 
Kami membuka submission untuk special issue tentang "AI in Healthcare"

Long Description:
Jurnal Riptek dengan bangga mengumumkan Call for Papers untuk Special 
Issue 2025 dengan tema "Artificial Intelligence in Healthcare".

Topik yang dicakup:
- Medical Image Analysis
- Clinical Decision Support Systems
- Drug Discovery dengan AI
- Healthcare Chatbots

Important Dates:
- Submission Deadline: 31 Maret 2025
- Notification: 30 Juni 2025
- Publication: September 2025

Silakan submit melalui sistem OJS kami.
```

**Jenis Announcements yang Biasa:**
- Call for Papers (regular atau special issue)
- Perpanjangan deadline submission
- Journal indexed in new database
- Editorial team changes
- New publication schedule
- Conference announcements
- Award notifications

---

## 4. Halaman Submissions

### 📁 File: `submissions.tpl`

### 🎯 Karakteristik
- ✅ Menggunakan **sidebar menu** (sama seperti About pages)
- ✅ Hero section dengan logo
- ✅ Tombol **"Submit Your Manuscript"** yang prominent
- ✅ Info dan panduan submission

### 📝 Cara Mengisi Konten

**Lokasi Konten:** Dalam tag `<div class="main-content-area">`

```smarty
<div class="main-content-area">
    <section class="info-section">
        <h2 class="section-title">Submit Your Research</h2>
        <div class="section-content">
            
            <p>Terima kasih atas minat Anda untuk mempublikasikan di Jurnal Riptek. 
            Sebelum melakukan submission, harap baca informasi berikut:</p>
            
            <h3>Syarat dan Ketentuan</h3>
            <ol>
                <li>Artikel belum pernah dipublikasikan di jurnal lain</li>
                <li>Tidak sedang dalam proses review di jurnal lain</li>
                <li>Semua penulis menyetujui submission</li>
                <li>Artikel bebas dari plagiarisme</li>
                <li>Mengikuti panduan author guidelines</li>
            </ol>
            
            <h3>Proses Submission</h3>
            <ol>
                <li><strong>Registrasi:</strong> Buat akun sebagai Author</li>
                <li><strong>Upload File:</strong> Upload manuscript dalam format .doc atau .docx</li>
                <li><strong>Metadata:</strong> Isi judul, abstract, keywords, dan info penulis</li>
                <li><strong>Confirmation:</strong> Review dan confirm submission</li>
            </ol>
            
            <h3>Dokumen yang Diperlukan</h3>
            <ul>
                <li>Manuscript file (template tersedia di Author Guidelines)</li>
                <li>Cover letter (optional tapi direkomendasikan)</li>
                <li>Conflict of Interest statement</li>
                <li>Checklist submission</li>
            </ul>
            
            <h3>Timeline</h3>
            <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                <tr style="background: #f3f4f6;">
                    <th style="padding: 10px; text-align: left;">Tahap</th>
                    <th style="padding: 10px; text-align: left;">Estimasi Waktu</th>
                </tr>
                <tr>
                    <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">Initial Screening</td>
                    <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">1-3 hari</td>
                </tr>
                <tr>
                    <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">Peer Review</td>
                    <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">3-4 minggu</td>
                </tr>
                <tr>
                    <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">Revision (jika perlu)</td>
                    <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">2-4 minggu</td>
                </tr>
                <tr>
                    <td style="padding: 10px;">Publication</td>
                    <td style="padding: 10px;">Next available issue</td>
                </tr>
            </table>
            
            <h3>Biaya Publikasi</h3>
            <p>Jurnal Riptek saat ini <strong>tidak memungut biaya apapun</strong> 
            (Article Processing Charge/APC = Rp 0). Namun kebijakan ini dapat berubah di masa depan.</p>
            
            <div style="background: #fef3c7; border-left: 4px solid #f59e0b; padding: 15px; margin: 20px 0;">
                <strong>⚠️ Penting:</strong> Pastikan semua dokumen sudah lengkap sebelum submit. 
                Submission yang tidak lengkap akan di-reject tanpa review.
            </div>
            
        </div>
    </section>
</div>
```

**Apa yang bisa diisi:**
- **Syarat submission:** Apa saja yang harus dipenuhi penulis
- **Proses submission:** Step-by-step panduan
- **Dokumen required:** Daftar file yang harus di-upload
- **Timeline:** Estimasi waktu per tahap
- **Publication fee:** Info biaya APC (jika ada)
- **Contact:** Siapa yang bisa dihubungi jika ada masalah
- **FAQs:** Pertanyaan yang sering ditanyakan

---

## 🎨 Tips Styling dan Formatting

### Heading Styles
```html
<h2 class="section-title">Judul Section</h2>  <!-- Hijau, 28px -->
<h3>Sub-judul Level 1</h3>                    <!-- Hitam, 20px -->
<h4>Sub-judul Level 2</h4>                    <!-- Hitam, 18px -->
```

### Alert Boxes
```html
<!-- Info Box (Blue) -->
<div style="background: #dbeafe; border-left: 4px solid #3b82f6; padding: 15px; margin: 20px 0;">
    <strong>ℹ️ Info:</strong> Informasi penting di sini.
</div>

<!-- Warning Box (Yellow) -->
<div style="background: #fef3c7; border-left: 4px solid #f59e0b; padding: 15px; margin: 20px 0;">
    <strong>⚠️ Peringatan:</strong> Perhatian khusus di sini.
</div>

<!-- Success Box (Green) -->
<div style="background: #d1fae5; border-left: 4px solid #10b981; padding: 15px; margin: 20px 0;">
    <strong>✅ Sukses:</strong> Informasi positif di sini.
</div>

<!-- Danger Box (Red) -->
<div style="background: #fee2e2; border-left: 4px solid #ef4444; padding: 15px; margin: 20px 0;">
    <strong>❌ Penting:</strong> Larangan atau hal kritis di sini.
</div>
```

### Tables
```html
<table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
    <tr style="background: #f3f4f6;">
        <th style="padding: 10px; text-align: left;">Header 1</th>
        <th style="padding: 10px; text-align: left;">Header 2</th>
    </tr>
    <tr>
        <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">Data 1</td>
        <td style="padding: 10px; border-bottom: 1px solid #e5e7eb;">Data 2</td>
    </tr>
</table>
```

### Buttons/Links
```html
<!-- Primary Button -->
<a href="#" style="display: inline-block; background: #0d9488; color: white; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: 600;">
    Tombol Utama
</a>

<!-- Secondary Button -->
<a href="#" style="display: inline-block; background: #e5e7eb; color: #374151; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: 600;">
    Tombol Sekunder
</a>
```

---

## 📌 Checklist Update Konten

Sebelum publish perubahan, pastikan:

- [ ] Semua informasi faktual sudah benar (email, alamat, nama, dll)
- [ ] Link yang di-embed berfungsi dengan baik
- [ ] Timeline/deadline sudah up-to-date
- [ ] Tidak ada placeholder text yang tertinggal
- [ ] Styling konsisten antar halaman
- [ ] Grammar dan ejaan sudah di-check
- [ ] Mobile responsive (test di mobile device)
- [ ] Screenshot/gambar (jika ada) sudah di-upload

---

## 🔄 Workflow Update Konten

1. **Edit file .tpl** di local development
2. **Test** di browser (localhost)
3. **Backup** file .tpl sebelum deploy
4. **Upload** ke server production
5. **Clear cache** OJS (Settings → Website → Setup → Clear Data Cache)
6. **Verify** di production site
7. **Dokumentasi** perubahan (optional)

---

## 🆘 Troubleshooting

### Konten tidak muncul setelah edit
**Solusi:**
1. Clear browser cache (Ctrl+Shift+R)
2. Clear OJS cache via dashboard
3. Periksa syntax Smarty (pastikan tidak ada `{` atau `}` yang hilang)

### Layout berantakan
**Solusi:**
1. Periksa closing tags (`</div>`, `</section>`, dll)
2. Validasi HTML structure
3. Check CSS conflict (inspect element di browser)

### Page 404 Not Found
**Solusi:**
1. Periksa routing di `index.php` (untuk page baru)
2. Pastikan handler class sudah dibuat (untuk page baru)
3. Clear cache dan reload

---

## 📞 Support

Jika ada pertanyaan atau butuh bantuan:
- **Email:** development@example.com
- **Documentation:** `/documentation/`
- **Backup Files:** `/backups/`

---

**© 2025 OJS Development Team | Jurnal Riptek**

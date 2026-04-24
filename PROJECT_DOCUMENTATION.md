# Project Documentation

## 1. Overview

- Nama project: OJS Docker + Modern Theme Customization
- Deskripsi singkat project:
  - Project ini adalah implementasi Open Journal Systems (OJS) yang dijalankan dalam lingkungan Docker (Apache + PHP + MariaDB + phpMyAdmin), ditambah kustomisasi tampilan tema modern berbasis CSS/JS.
- Tujuan / use case:
  - Menyediakan platform manajemen jurnal ilmiah (submission, review, publication) yang siap dipakai secara lokal.
  - Mempercepat deployment OJS untuk development/testing.
  - Menyediakan custom branding UI jurnal melalui modern theme.

## 2. Tech Stack

- Bahasa:
  - PHP (core OJS)
  - JavaScript (frontend enhancement theme)
  - CSS (custom theme)
  - SQL (dump database MariaDB)
- Framework / platform:
  - Open Journal Systems (OJS)
  - PKP Library (pkp-lib)
  - Slim (untuk API routing internal)
  - Laravel components (digunakan dalam arsitektur internal PKP/OJS, mis. service container/database layer)
- Tools:
  - Docker
  - Docker Compose
  - Apache (dalam image php:8.1-apache)
  - MariaDB 10.6
  - phpMyAdmin
- Library penting (teridentifikasi dari composer):
  - guzzlehttp/guzzle
  - smarty/smarty
  - phpmailer/phpmailer
  - firebase/php-jwt
  - doctrine/dbal
  - symfony/mailer
  - chart.js (via package bridge composer)
  - jquery, jquery-ui, jquery-validation

## 3. Project Structure

Struktur utama workspace:

~~~text
d:/ojees/
├── db_data/                          # Data MariaDB persistent (global workspace)
└── ojs-docker/
    ├── docker-compose.yml            # Orkestrasi container web/db/phpmyadmin
    ├── Dockerfile                    # Build image web (PHP 8.1 Apache + ekstensi)
    ├── ojs/                          # Source code utama OJS
    │   ├── index.php                 # Entry point web application
    │   ├── config.inc.php            # Konfigurasi runtime OJS
    │   ├── api/v1/                   # Route handler API per resource
    │   ├── classes/                  # Kelas aplikasi OJS (APP namespace)
    │   ├── controllers/              # Controller backend/flow
    │   ├── pages/                    # Handler halaman OJS
    │   ├── plugins/                  # Plugin (themes, reports, import/export, dll)
    │   ├── templates/                # Template frontend/backend (Smarty)
    │   ├── lib/pkp/                  # Core library PKP + dependency vendor
    │   └── public/                   # Aset publik web
    ├── files/                        # Lokasi file upload OJS (mounted ke /var/ojs_files)
    ├── db_data/                      # Data MariaDB persistent untuk stack docker ini
    ├── modern-ojs-theme.css          # CSS custom modern theme
    ├── modern-ojs-theme.js           # JS custom interaksi UI
    ├── ojs_db_dump_20251110.sql      # Dump database OJS
    ├── documentation/                # Dokumen implementasi/fix internal project
    ├── backups/                      # Backup file CSS/asset
    └── assets/                       # Asset pendukung desain
~~~

Folder penting:

- ojs/
  - Source code utama aplikasi OJS.
- ojs/api/v1/
  - Endpoint API berbasis resource (submissions, users, issues, contexts, stats, dll).
- ojs/lib/pkp/
  - Core framework PKP (routing, service, schema, auth policy, dll).
- files/
  - Penyimpanan file upload jurnal (manuskrip, galley, dsb).
- db_data/
  - Data database persistent agar data tidak hilang saat container restart.
- modern-ojs-theme.css dan modern-ojs-theme.js
  - Kustomisasi UI modern pada instalasi OJS.

## 4. Installation & Setup

### Requirement

- Docker Desktop
- Docker Compose (umumnya sudah include di Docker Desktop)
- Port yang tersedia:
  - 8080 (OJS web)
  - 8081 (phpMyAdmin)

Requirement non-Docker (jika menjalankan OJS manual):

- PHP minimal 8.0.2 (project menggunakan image PHP 8.1)
- Web server Apache/Nginx
- MariaDB/MySQL

### Cara install

1. Masuk ke folder project:

~~~powershell
cd d:\ojs\ojs-docker
~~~

2. Build dan jalankan container:

~~~powershell
docker-compose up -d --build
~~~

3. Akses aplikasi:

- OJS: http://localhost:8080
- phpMyAdmin: http://localhost:8081

### Setup environment

- Tidak ada file .env khusus project.
- Konfigurasi environment utama dikelola di:
  - docker-compose.yml (env container database)
  - ojs/config.inc.php (konfigurasi aplikasi OJS)

### Cara menjalankan project

~~~powershell
# Start service
docker-compose up -d

# Stop service
docker-compose stop

# Restart service
docker-compose restart
~~~

## 5. Configuration

### File konfigurasi penting

- docker-compose.yml
  - Service web:
    - Build dari Dockerfile
    - Port 8080:80
    - Mount source code ojs ke /var/www/html
    - Mount files ke /var/ojs_files
  - Service db:
    - Image mariadb:10.6
    - Persistent volume ke ./db_data
  - Service phpmyadmin:
    - Port 8081:80
- Dockerfile
  - Base image: php:8.1-apache
  - Install extension: intl, gd, mysqli, pdo_mysql, xml, zip
  - Enable Apache rewrite
- ojs/config.inc.php
  - Konfigurasi runtime OJS: base_url, database, files_dir, security, cache, locale, dll.

### Environment variables yang digunakan

Dari docker-compose.yml (service db dan phpmyadmin):

- MYSQL_ROOT_PASSWORD=root
- MYSQL_DATABASE=ojs
- MYSQL_USER=ojsuser
- MYSQL_PASSWORD=ojspass
- PMA_HOST=db

Konfigurasi aplikasi dari ojs/config.inc.php:

- [general]
  - installed=On
  - base_url=http://localhost:8080
  - restful_urls=Off
  - allowed_hosts=["localhost"]
- [database]
  - driver=mysqli
  - host=db
  - username=ojsuser
  - password=ojspass
  - name=ojs
- [files]
  - files_dir=/var/ojs_files
  - public_files_dir=public

## 6. Features

Fitur utama aplikasi (OJS):

- Manajemen jurnal ilmiah multi-role (site admin, manager, editor, reviewer, author).
- Workflow editorial:
  - Submission
  - Review
  - Editing
  - Production
- Manajemen issue dan publication.
- API v1 untuk resource penting (submissions, users, issues, contexts, stats, dll).
- Manajemen plugin/theme.
- Statistik publikasi dan editorial.

Fitur tambahan custom project:

- Modern theme CSS dengan:
  - Header compact
  - Carousel banner
  - Visual style modern
  - Responsive behavior
- JavaScript enhancement:
  - Header scroll effect
  - Smooth scroll
  - Carousel swipe/mobile behavior
  - Search bar interactions
  - Loading/animation effects
- Dokumentasi troubleshooting CSS (folder documentation/) untuk kasus style tidak ter-load.

## 7. Code Explanation

### Routing / API

- Entry point web:
  - ojs/index.php mem-bootstrap aplikasi lalu memanggil Application::get()->execute().
- API router:
  - PKP APIRouter memetakan request ke pola:
    - /{contextPath}/api/v1/{entity}
  - Router memuat handler dari file:
    - api/v1/{entity}/index.php
- Tiap resource API di folder ojs/api/v1/<resource>/index.php me-return handler class sesuai domain.

### Database / Model

- Akses data berbasis DAO/Repository pattern (APP\facades\Repo + collector).
- Banyak endpoint API menggunakan collector untuk filtering, sorting, pagination.
- Relasi data dijaga melalui foreign key pada database dump.

### Logic utama

- Core lifecycle aplikasi:
  - Bootstrap -> Router -> Handler -> Authorization Policy -> Service/Repo -> JSON/HTML Response.
- Authorization API dilakukan dengan policy berlapis:
  - UserRolesRequiredPolicy
  - ContextAccessPolicy
  - Policy khusus domain (submission, issue, publication, dll)
- Struktur endpoint submissions sangat lengkap (CRUD submission + publication/contributor/decision flow).

### Component penting (frontend)

- templates/ (Smarty) sebagai view layer OJS.
- modern-ojs-theme.css untuk override gaya visual default.
- modern-ojs-theme.js untuk behavior interaktif frontend.

## 8. API Documentation

API dalam project (OJS API v1).

Base pattern endpoint:

~~~text
/{contextPath}/api/v1/{resource}
~~~

Contoh resource utama:

- contexts
- submissions
- users
- issues
- dois
- site
- stats
- institutions
- announcements
- jobs
- temporaryFiles

### Contoh endpoint dan method

- GET /{contextPath}/api/v1/submissions
  - Ambil daftar submission (dengan filter/query params).
- GET /{contextPath}/api/v1/submissions/{submissionId}
  - Ambil detail submission.
- POST /{contextPath}/api/v1/submissions
  - Tambah submission.
- PUT /{contextPath}/api/v1/submissions/{submissionId}
  - Ubah submission.
- DELETE /{contextPath}/api/v1/submissions/{submissionId}
  - Hapus submission.
- GET /{contextPath}/api/v1/users
  - Daftar user sesuai hak akses.
- GET /{contextPath}/api/v1/issues
  - Daftar issue.
- GET /{contextPath}/api/v1/issues/current
  - Ambil issue terkini.
- GET /{contextPath}/api/v1/contexts
  - Daftar context/journal.
- PUT /{contextPath}/api/v1/contexts/{contextId}/theme
  - Ubah konfigurasi tema context.

### Contoh request

~~~bash
curl -X GET "http://localhost:8080/index.php/journal/api/v1/issues?count=10&offset=0"
~~~

Contoh request create submission (simplified):

~~~bash
curl -X POST "http://localhost:8080/index.php/journal/api/v1/submissions" \
  -H "Content-Type: application/json" \
  -d '{
    "locale": "en",
    "sectionId": 1,
    "publications": [{
      "title": {"en": "Sample Title"}
    }]
  }'
~~~

### Contoh response (umum)

~~~json
{
  "itemsMax": 120,
  "items": [
    {
      "id": 123,
      "title": "Sample Submission"
    }
  ]
}
~~~

Catatan:

- Sebagian besar endpoint mensyaratkan autentikasi sesi OJS dan role tertentu.
- Method dan payload final mengikuti handler + schema OJS/PKP yang aktif.

### Daftar Final URL Akses

Gunakan placeholder berikut:

- {baseUrl} = http://localhost:8080
- {journalPath} = path jurnal Anda (contoh: jurnalriptek)

#### A. Landing dan akses umum

- {baseUrl}/index.php
- {baseUrl}/index.php/{journalPath}
- {baseUrl}/index.php/{journalPath}/search
- {baseUrl}/index.php/{journalPath}/sitemap

#### B. Issue (termasuk archive dan download galley)

- {baseUrl}/index.php/{journalPath}/issue
- {baseUrl}/index.php/{journalPath}/issue/current
- {baseUrl}/index.php/{journalPath}/issue/archive
- {baseUrl}/index.php/{journalPath}/issue/view/{issueId}
- {baseUrl}/index.php/{journalPath}/issue/download/{issueId}/{galleyId}

#### C. About dan halaman informasi kecil

- {baseUrl}/index.php/{journalPath}/about
- {baseUrl}/index.php/{journalPath}/about/editorialTeam
- {baseUrl}/index.php/{journalPath}/about/submissions
- {baseUrl}/index.php/{journalPath}/about/contact
- {baseUrl}/index.php/{journalPath}/information/readers
- {baseUrl}/index.php/{journalPath}/information/authors
- {baseUrl}/index.php/{journalPath}/information/librarians
- {baseUrl}/index.php/{journalPath}/information/competingInterestGuidelines

Catatan Focus & Scope:

- Focus & Scope umumnya tidak punya path terpisah.
- Kontennya biasanya tampil pada halaman submissions:
  - {baseUrl}/index.php/{journalPath}/about/submissions

#### D. User/Auth dan dashboard

- {baseUrl}/index.php/{journalPath}/login
- {baseUrl}/index.php/{journalPath}/user/register
- {baseUrl}/index.php/{journalPath}/user/profile
- {baseUrl}/index.php/{journalPath}/dashboard
- {baseUrl}/index.php/{journalPath}/submissions
- {baseUrl}/index.php/{journalPath}/workflow

#### E. URL API v1

Pola API:

- {baseUrl}/index.php/{journalPath}/api/v1/{resource}

Resource yang terdeteksi pada project:

- announcements
- contexts
- dois
- emailTemplates
- highlights
- institutions
- issues
- jobs
- mailables
- site
- stats
- submissions
- temporaryFiles
- users
- vocabs
- _dois
- _email
- _library
- _payments
- _submissions
- _uploadPublicFile

Contoh API siap pakai:

- {baseUrl}/index.php/{journalPath}/api/v1/issues
- {baseUrl}/index.php/{journalPath}/api/v1/submissions
- {baseUrl}/index.php/{journalPath}/api/v1/users
- {baseUrl}/index.php/{journalPath}/api/v1/contexts

## 9. Database Structure 

Database ditemukan dalam project:

- Dump SQL: ojs_db_dump_20251110.sql
- Jumlah tabel: 124

### Tabel utama (domain inti)

- journals, journal_settings
- submissions, submission_settings, submission_files
- publications, publication_settings, publication_galleys
- issues, issue_settings, issue_galleys
- users, user_settings, user_groups
- review_assignments, review_rounds, review_files
- dois, doi_settings

### Relasi utama

- submissions -> journals (submission terkait context jurnal)
- publications -> submissions
- authors -> publications
- issues -> journals
- issue_galleys -> issues
- review_assignments -> submissions
- user_user_groups -> users
- dois -> journals (context_id), dan direferensikan oleh entitas publikasi/issue tertentu

### Contoh foreign key dari dump

- access_keys.user_id -> users.user_id
- citations.publication_id -> publications.publication_id
- dois.context_id -> journals.journal_id
- publications.submission_id -> submissions.submission_id
- review_form_responses.review_id -> review_assignments.review_id

## 10. Development Guide

### Cara menambah fitur

- Fitur backend/domain:
  - Tambah/extend handler API pada ojs/api/v1/<resource>/ dan/atau ojs/lib/pkp/api/v1/...
  - Tambah policy authorization bila perlu.
  - Gunakan pattern Repo/Collector untuk query data.
- Fitur frontend/theme:
  - Tambahkan style di modern-ojs-theme.css.
  - Tambahkan behavior di modern-ojs-theme.js.
  - Jika perlu integrasi template, edit file di ojs/templates/frontend/.

### Struktur coding yang digunakan

- Arsitektur modular OJS + PKP.
- Layer yang umum:
  - Router
  - Handler/APIHandler
  - Policy authorization
  - Service/Repository/DAO
  - Template (Smarty)
- Namespace utama:
  - APP\... (application-specific OJS)
  - PKP\... (core PKP library)

### Best practice di project ini

- Jangan mengubah core OJS langsung jika bisa melalui plugin/theme override.
- Simpan customization frontend terpisah (CSS/JS custom) agar mudah maintenance.
- Gunakan Docker workflow agar environment konsisten.
- Saat ubah style via admin OJS, perhatikan metadata stylesheet dan cache (sesuai dokumentasi troubleshooting).
- Selalu backup sebelum update theme besar (folder backups sudah tersedia).

## 11. Troubleshooting

### Error umum dan solusi

- CSS custom tidak muncul
  - Kemungkinan:
    - Metadata stylesheet di DB belum sinkron
    - Cache OJS/browser belum dibersihkan
  - Solusi umum:
    - Jalankan SQL fix stylesheet (sesuai dokumentasi di folder documentation)
    - Clear cache folder ojs/cache
    - Restart docker-compose
    - Hard reload browser

- OJS tidak bisa akses database
  - Periksa service db berjalan.
  - Pastikan host database di config.inc.php = db.
  - Cek kredensial database (ojsuser/ojspass).

- File upload gagal
  - Pastikan volume files ter-mount ke /var/ojs_files.
  - Pastikan permission folder sesuai user web server.

- Endpoint API mengembalikan 403
  - User tidak punya role yang dibutuhkan.
  - Endpoint API OJS sangat role-based; cek role user di context jurnal.

- Endpoint API mengembalikan 404
  - Path entity API tidak tersedia.
  - Pastikan format URL benar: /index.php/{context}/api/v1/{resource}

## 12. Conclusion

Project ini adalah implementasi OJS yang cukup lengkap untuk kebutuhan pengelolaan jurnal ilmiah, dibungkus dengan setup Docker yang praktis dan disertai kustomisasi UI modern. Struktur codebase memisahkan core platform, API resource, dan customization frontend dengan cukup jelas sehingga mudah dipahami developer baru.

Dari hasil analisis, area paling penting untuk onboarding adalah:

- memahami konfigurasi Docker + config.inc.php,
- memahami pola routing API berbasis resource,
- memahami relasi data inti submissions-publications-issues-users,
- mengikuti panduan troubleshooting CSS yang sudah terdokumentasi.


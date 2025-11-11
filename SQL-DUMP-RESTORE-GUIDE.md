# SQL Dump Restore Guide - Jurnal Riptek OJS

## File SQL Dump yang Benar

**File:** `ojs_db_clean_20251111.sql` (309 KB)
- Created: 11 November 2025, 08:08 AM
- Size: 309,518 bytes (309 KB)
- Encoding: UTF-8
- Database: `ojs`
- MariaDB Version: 10.6.23

## Cara Restore untuk Teman/Collaborator

### Prerequisites
1. Docker dan Docker Compose sudah terinstall
2. Sudah clone branch: `user-interface-clean-20251106`
3. File `ojs_db_clean_20251111.sql` ada di root folder project

### Langkah-langkah Restore Database

#### 1. Start Docker Containers
```powershell
cd ojs-docker
docker-compose up -d
```

Tunggu sampai containers running (cek dengan `docker ps`)

#### 2. Restore Database dari SQL Dump

**Opsi A - Restore ke database baru (RECOMMENDED):**
```powershell
# Login ke MySQL dan drop database existing (jika ada)
docker exec -it ojs-db mysql -u root -proot -e "DROP DATABASE IF EXISTS ojs; CREATE DATABASE ojs CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# Restore dari SQL dump
docker exec -i ojs-db mysql -u root -proot ojs < ojs_db_clean_20251111.sql
```

**Opsi B - Restore tanpa drop (jika mau merge):**
```powershell
docker exec -i ojs-db mysql -u root -proot ojs < ojs_db_clean_20251111.sql
```

#### 3. Verify Restore Berhasil
```powershell
# Cek jumlah tables
docker exec -it ojs-db mysql -u root -proot -e "USE ojs; SHOW TABLES;" | wc -l

# Cek data users
docker exec -it ojs-db mysql -u root -proot -e "USE ojs; SELECT username, email FROM users LIMIT 5;"
```

Expected output: Harus ada data users, journals, submissions, dll.

#### 4. Access OJS Website
Buka browser: http://localhost:8080/index.php/jurnaladitsemarang

**Default Login Credentials:**
- Username: `admin`
- Password: [password yang ada di database dump]

### Troubleshooting

#### Error: "Access denied for user"
```powershell
# Cek credentials di docker-compose.yml
cat docker-compose.yml | grep -A 5 MYSQL

# Pastikan menggunakan credentials yang benar:
# User: root
# Password: root
# Database: ojs
```

#### Error: "Can't connect to MySQL server"
```powershell
# Pastikan container MySQL running
docker ps | grep ojs-db

# Restart container jika perlu
docker-compose restart ojs-db

# Tunggu 10-15 detik untuk MySQL fully start
Start-Sleep -Seconds 15
```

#### Error: "Table already exists"
Ini normal jika restore ke database yang sudah ada data. Gunakan Opsi A (drop & create) untuk fresh restore.

#### Database tidak match dengan code
Pastikan:
1. Branch yang di-clone: `user-interface-clean-20251106`
2. SQL dump yang digunakan: `ojs_db_clean_20251111.sql` (yang baru, bukan yang lama)
3. Docker containers sudah restart setelah restore

### Verification Checklist

✅ Docker containers running (`docker ps` shows ojs-db and ojs-app)
✅ Database restored successfully (no errors during import)
✅ Website accessible at http://localhost:8080
✅ Homepage shows "Jurnal Riptek" hero with green-blue gradient
✅ Can login to admin panel
✅ Journals, submissions, users visible

### File Structure After Clone & Restore

```
ojs-docker/
├── docker-compose.yml
├── ojs_db_clean_20251111.sql          ← SQL dump file
├── ojs/
│   ├── public/
│   │   └── journals/
│   │       └── 1/
│   │           └── styleSheet.css     ← Custom CSS (v11.8)
│   └── templates/
│       └── frontend/
├── db_data/                            ← MariaDB data (auto-created)
└── files/                              ← OJS uploaded files

```

### Important Notes

1. **Database Credentials:**
   - MySQL Root: root / root
   - OJS DB User: ojsuser / ojspass
   - Database name: ojs

2. **Ports:**
   - OJS Website: http://localhost:8080
   - MySQL: localhost:3306 (if exposed)

3. **Data Included in SQL Dump:**
   - Users & roles
   - Journal settings (Jurnal Riptek)
   - Submissions & workflow
   - Custom theme settings
   - All content & metadata

4. **NOT Included in SQL Dump (handled by git):**
   - Custom CSS (styleSheet.css) - di git repo
   - Templates (.tpl files) - di git repo
   - Uploaded files/images - perlu copy manual atau re-upload

### Performance Tips

- First load akan lambat (OJS compile templates)
- Setelah first load, cache akan speed up
- Jika edit CSS/templates, clear browser cache
- OJS cache folder: `ojs/cache/` (bisa dihapus jika ada masalah)

---

## Command Cheat Sheet

```powershell
# Start containers
docker-compose up -d

# Stop containers
docker-compose down

# Restore database
docker exec -i ojs-db mysql -u root -proot ojs < ojs_db_clean_20251111.sql

# Backup database (create new dump)
docker exec ojs-db mysqldump -u ojsuser -pojspass --default-character-set=utf8mb4 --single-transaction --quick --lock-tables=false ojs 2>$null | Out-File -FilePath ".\ojs_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').sql" -Encoding UTF8

# Check MySQL logs
docker logs ojs-db

# Access MySQL CLI
docker exec -it ojs-db mysql -u root -proot ojs

# Restart OJS app only
docker-compose restart ojs-app
```

---

**Created:** 11 November 2025
**Last Updated:** 11 November 2025
**Branch:** user-interface-clean-20251106
**OJS Version:** 3.x
**Database:** MariaDB 10.6.23

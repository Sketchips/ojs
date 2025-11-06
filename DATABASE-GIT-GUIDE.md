# OJS Docker Setup - Database & Git Management

## 📁 Repository Structure

```
ojs-docker/
├── ojs/                          # OJS application code
│   ├── config.inc.php           # Main OJS configuration
│   ├── cache/                   # Runtime caches (IGNORED by Git)
│   └── public/journals/1/       # Journal customizations (CSS, images)
├── files/                        # Uploaded files & journal data
├── db_data/                      # MySQL database files (IGNORED by Git)
├── docker-compose.yml            # Docker services configuration
└── .gitignore                    # Git ignore rules

```

## 🚫 Files NOT Tracked by Git (in .gitignore)

These files are **NEVER pushed to GitHub**:
- `db_data/` - MySQL database binary files (~200MB)
- `files/usageStats/IPGeoDB.mmdb` - GeoIP database (~126MB)
- `ojs/cache/` - Runtime caches (templates, opcache)
- `*.sql` - SQL dumps (use backup separately)
- `*.zip` - Compressed backups

**Why?** Database files are:
- Too large for GitHub (>100MB)
- Different for each installation
- Binary files that don't benefit from version control

---

## 🔄 Working with Branches

### **Main Branches**:

1. **`user-interface`** (Local working branch)
   - Your current development branch
   - Contains working database locally in `db_data/`
   - **Cannot push directly** due to large file history

2. **`user-interface-clean-20251106`** (GitHub branch)
   - Cleaned version pushed to GitHub
   - No large files in history
   - **This is the branch others should clone**
   - Latest push: Plugin fix + all UI customizations

### **Branch Differences**:
- **Code/Templates**: IDENTICAL between both branches
- **Git History**: `user-interface-clean` has cleaned history (no db_data, no GeoIP)
- **Database**: Only exists locally (not in Git)

---

## 💾 Database Backup & Restore

### **Create SQL Backup** (Recommended):
```bash
# Create backup
docker-compose exec db mysqldump -u root -proot ojs > ojs_backup_$(date +%Y%m%d).sql

# Backup size: ~580 KB (small enough to share via email/drive)
```

### **Restore from SQL Backup**:
```bash
# Stop containers
docker-compose down

# Remove old database
rm -rf db_data

# Start fresh database
docker-compose up -d

# Wait 5 seconds for DB to initialize
sleep 5

# Restore backup
docker-compose exec -T db mysql -u root -proot ojs < ojs_backup_20251106.sql

# Set installed=On in ojs/config.inc.php
# Restart web
docker-compose restart web
```

### **Alternative: Full db_data Backup** (Large):
```bash
# Stop database
docker-compose stop db

# Backup entire folder
tar -czf db_data_backup.tar.gz db_data/

# Size: ~6-10 MB compressed
```

---

## 🚀 Setup for New Team Member

### **Clone & Setup**:
```bash
# 1. Clone the CLEAN branch from GitHub
git clone -b user-interface-clean-20251106 https://github.com/Sketchips/ojs.git ojs-docker
cd ojs-docker

# 2. Create empty db_data (will be auto-populated)
mkdir db_data

# 3. Request SQL dump from team
# Get: ojs_database_backup_YYYYMMDD.sql from team member

# 4. Start containers
docker-compose up -d

# 5. Wait for DB init (5-10 seconds)
sleep 10

# 6. Restore database
docker-compose exec -T db mysql -u root -proot ojs < ojs_database_backup_YYYYMMDD.sql

# 7. Verify config
# Make sure ojs/config.inc.php has: installed = On

# 8. Restart and test
docker-compose restart web

# 9. Open browser
# http://localhost:8080
# Login: admin / admin
```

---

## 🔐 Admin Credentials

- **Username**: `admin`
- **Password**: `admin`
- **Email**: `admin@localhost.local`

**⚠️ Change password** after first login for production!

---

## 🎨 Stylesheet Customizations

Custom CSS is located at:
```
ojs/public/journals/1/styleSheet.css
```

**Safe to edit and commit to Git**. Changes include:
- Mobile navbar toggle fix
- Logo responsive adjustments
- Custom styling for journal theme

---

## 📤 Push Changes to GitHub

### **Option 1: Work on Clean Branch** (Recommended):
```bash
# Switch to clean branch
git checkout user-interface-clean-20251106

# Make your changes (code, CSS, templates)
git add .
git commit -m "Your change description"

# Push directly (no large files!)
git push origin user-interface-clean-20251106
```

### **Option 2: Cherry-pick from user-interface**:
```bash
# Make changes on user-interface
git checkout user-interface
git add .
git commit -m "Your change"

# Copy commit to clean branch
git checkout user-interface-clean-20251106
git cherry-pick <commit-hash>

# Push clean branch
git push origin user-interface-clean-20251106
```

---

## 🐛 Troubleshooting

### **Error: "Large files detected" when pushing**:
**Cause**: Trying to push `user-interface` branch (contains large file history)  
**Solution**: Push to `user-interface-clean-20251106` instead (see above)

### **Site shows PHP warnings**:
**Fix**: Set in `ojs/config.inc.php`:
```ini
[debug]
display_errors = Off
deprecation_warnings = Off
```

### **500 Error after pulling changes**:
**Fix**: Clear cache:
```bash
docker-compose exec web rm -rf /var/www/html/cache/*
docker-compose restart web
```

### **Database corrupted**:
**Fix**: Restore from SQL backup (see Database Backup section above)

---

## 📋 Current Backups

Located in project root:
- `ojs_database_backup_20251106_130849.sql` (580 KB) - **LATEST WORKING**
- `db_data_backup_corrupted_20251106_121813.zip` (6.4 MB) - Corrupted (do not use)

**Recommendation**: Keep SQL dump in secure location (Google Drive, team server, etc.)

---

## 🔗 Important Links

- **GitHub Repo**: https://github.com/Sketchips/ojs
- **Clean Branch**: `user-interface-clean-20251106`
- **OJS Documentation**: https://docs.pkp.sfu.ca/
- **Docker Compose Docs**: https://docs.docker.com/compose/

---

## ✅ Summary

**For Daily Work**:
- Work on `user-interface` branch locally
- Database stays local (not in Git)
- Push code changes to `user-interface-clean-20251106`

**For Team Collaboration**:
- Share SQL dumps (small, portable)
- Clone `user-interface-clean-20251106` branch
- Each member has their own local database

**Result**: No GitHub size limits, clean history, easy collaboration! 🎉

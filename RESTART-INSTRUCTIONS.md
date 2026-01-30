# Instruksi Restart & Clear Cache OJS

## Perubahan yang Dibuat:
1. ✅ Menambahkan field upload PDF di `AppearanceAdvancedForm.php`
2. ✅ Menambahkan schema properties di `context.json`
3. ✅ Menambahkan serialized settings di migration
4. ✅ Update template `indexJournal.tpl` untuk menampilkan button download

## Cara Clear Cache & Restart:

### Opsi 1: Clear Cache OJS (Recommended)
```bash
# Dari root folder OJS
php tools/clearCache.php
```

### Opsi 2: Restart Docker (jika pakai Docker)
```bash
docker-compose restart
```

### Opsi 3: Clear Manual
Hapus folder cache:
- `cache/`
- `cache/t_cache/`
- `cache/t_compile/`
- `cache/t_config/`

## Setelah Clear Cache:

1. Login ke Dashboard OJS
2. Masuk ke: **Settings → Website → Appearance → Advanced**
3. Scroll ke bawah, akan ada 2 field upload baru:
   - "Author Guidelines PDF (Pedoman)"
   - "OJS Workflow PDF (Alur OJS)"
4. Upload file PDF Anda
5. Klik **Save**
6. Cek homepage - button download akan muncul di sidebar

## Troubleshooting:

### Button tidak muncul setelah upload?
1. Clear browser cache (Ctrl+Shift+Del)
2. Cek file benar-benar terupload di: `public/journals/1/`
3. Cek console browser untuk error
4. Clear OJS cache lagi

### Field upload tidak muncul di dashboard?
1. Pastikan sudah clear cache OJS
2. Restart web server
3. Periksa log error di `files/error.log`

### File gagal upload?
1. Cek permission folder `public/journals/1/`
2. Cek max upload size di `php.ini`
3. Cek log upload di browser developer tools

## Files yang Diubah:
- `d:\Code\ojs\ojs\classes\components\forms\context\AppearanceAdvancedForm.php`
- `d:\Code\ojs\ojs\schemas\context.json`
- `d:\Code\ojs\ojs\classes\migration\upgrade\OJSv3_3_0UpgradeMigration.php`
- `d:\Code\ojs\ojs\plugins\themes\bootstrap3\templates\frontend\pages\indexJournal.tpl`

# Project-Pulse-Ultimate-Medical-Integrity-System
Baok


🏥 PANDUAN OPERASIONAL MEDIS (IMER-MED SYSTEM)
Selamat bertugas, Tenaga Medis! Sistem ini dirancang untuk memberikan simulasi klinis tingkat lanjut. Pastikan Anda memahami setiap prosedur untuk menghindari malpraktik.
📋 1. PERINTAH DASAR (COMMANDS)
Gunakan perintah berikut untuk interaksi cepat di lapangan maupun di rumah sakit:
Command	Fungsi	Target
/checkpatient	Membuka Dashboard Klinis untuk melihat Triage & Log.	ID Terdekat
/spawnstretcher	Memunculkan Brankar (Stretcher) di depan Anda.	-
/putonstretcher	Membaringkan pasien ke atas Brankar secara otomatis.	ID Terdekat
/getoffstretcher	Menurunkan pasien dari Brankar/Tempat Tidur.	ID Terdekat
/startcpr	Melakukan prosedur Resusitasi Jantung Paru (RJP).	ID Terdekat
/startsurgery [ID]	Memulai Operasi Bedah dengan kamera sinematik.	ID Pasien



💉 2. PROSEDUR ITEM MEDIS (USEABLE ITEMS)
Pastikan Anda membawa stok item ini di tas. Klik "Use" pada inventory untuk memicu aksi:
Propofol (Cairan Bius):
Fungsi: Menidurkan pasien sebelum operasi.
Efek: Layar pasien akan perlahan menggelap (Sedasi).
Catatan: Wajib diberikan sebelum memulai /startsurgery.
Surgical Kit (Alat Bedah):
Fungsi: Alat utama untuk melakukan /startsurgery.
Visual: Mengaktifkan kamera Overhead (Top-Down) untuk presisi bedah.
Morphine (Suntikan Nyeri):
Fungsi: Menghilangkan trauma visual (layar merah/blur) dan rasa sakit.
Efek: Menghapus status head trauma pada pasien.
Splint (Bidai):
Fungsi: Menstabilkan patah tulang kaki.
Efek: Menghapus efek Limping (Pincang) agar pasien bisa berjalan normal.

🧬 3. CLINICAL DASHBOARD & SQL RECORD
Saat Anda melakukan /checkpatient, Anda akan melihat Unified Dashboard:
Triage Color: Hijau (Aman), Kuning (Luka Ringan), Merah (Kritis/Pendarahan).
Blood Type & Allergy: Cek golongan darah pasien untuk keamanan transfusi.
Medical History: Riwayat pengobatan pasien akan muncul otomatis dari Database SQL.
Print Document: Setelah operasi, gunakan menu UI untuk mencetak Surat Izin Sakit yang akan menjadi item fisik di tas Anda.

⚠️ 4. PROTOKOL KESELAMATAN (ANTI-BUG)
Kamera Nyangkut: Jika kamera operasi tidak kembali normal, ketik /fixcam (jika tersedia) atau relog.
Sound Monitor: Jika suara "Beep" jantung terus berbunyi setelah pasien sadar, pastikan status monitoring sudah di-OFF melalui Dashboard.
Stretcher Cleanup: Jangan meninggalkan brankar di jalanan. Gunakan /delstretcher atau pastikan ditaruh kembali ke dalam Ambulance

































# 🏥 IMER-MED: The Ultimate Clinical Overhaul

![FiveM](https://img.shields.io)
![Status](https://img.shields.io)
![Optimized](https://img.shields.io)

Sistem medis tercanggih yang dirancang khusus untuk server **IMERoleplay** (Windah Basudara).

### ✨ Fitur Eksklusif:
- **Cinematic Surgery:** Kamera *Top-Down* (Surgeon Simulator Style) otomatis saat operasi.
- **Bone Trauma System:** Deteksi patah kaki (pincang) dan trauma kepala (KO/Pingsan).
- **Tinnitus Audio FX:** Efek telinga berdenging dan tuli sementara setelah benturan kepala.
- **SQL Medical Records:** Rekam medis permanen & Profil Golongan Darah/Alergi tersimpan abadi.
- **Dynamic Heart Monitor:** Suara monitor jantung (Bip) yang berubah kecepatan sesuai kondisi vital pasien.
- **Physical Medical Documents:** Sistem cetak surat sakit/laporan medis menjadi item fisik.

### ⚙️ Persyaratan:
- `ox_lib`
- `oxmysql`
- `qb-core` (Atau sesuaikan ke framework server)

---
*Developed by BAOK - Original Logic & High Performance.*

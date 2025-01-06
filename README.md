# automasi-outlinevpn
Automasi Install outline VPN di Ubuntu server 

Ubuntu 22.04 lts ++

# Instalasi Outline VPN di Ubuntu Server

Skrip ini digunakan untuk menginstal dan mengonfigurasi Outline VPN pada server Ubuntu dengan menggunakan Docker. Berikut adalah panduan untuk menjalankan skrip ini dan memulai instalasi.

## Prasyarat
- Sistem operasi Ubuntu Server (20.04 atau lebih baru).
- Hak akses root atau user dengan kemampuan `sudo`.

## Cara Penggunaan

1. **Unduh Skrip**
   Simpan skrip instalasi ke dalam file bernama `install-outline.sh`:
   ```bash
   curl -o install-outline.sh https://your-download-link/install-outline.sh
   ```

2. **Beri Izin Eksekusi pada Skrip**
   Jalankan perintah berikut untuk memberikan izin eksekusi pada skrip:
   ```bash
   chmod +x install-outline.sh
   ```

3. **Jalankan Skrip**
   Jalankan skrip dengan perintah berikut:
   ```bash
   sudo ./install-outline.sh
   ```

4. **Verifikasi Instalasi Docker**
   Pastikan Docker terinstal dengan benar dengan menjalankan:
   ```bash
   docker --version
   ```
   Jika perintah tersebut mengembalikan versi Docker, maka instalasi berhasil.

5. **Outline VPN Siap Digunakan**
   Setelah skrip selesai dijalankan, Outline Server akan terinstal di server Anda. Gunakan aplikasi Outline Manager untuk mengatur server dan membuat akses pengguna.

## Troubleshooting
- Jika ada error saat menambahkan repository Docker, pastikan sistem Anda memiliki koneksi internet yang stabil.
- Jika Docker gagal diinstal, coba jalankan ulang langkah instalasi dengan memastikan semua dependensi telah terinstal:
  ```bash
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
  ```

## Lisensi
Skrip ini disediakan "apa adanya" tanpa jaminan apa pun. Gunakan dengan risiko Anda sendiri.

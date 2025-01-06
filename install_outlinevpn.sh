#!/bin/bash

# Pastikan script dijalankan dengan root
if [ "$(id -u)" != "0" ]; then
    echo "Harap jalankan script ini sebagai root."
    exit 1
fi

# Update sistem
echo "Memperbarui sistem..."
apt update && apt upgrade -y

# Instal dependensi dasar
echo "Menginstal dependensi..."
apt install -y curl apt-transport-https ca-certificates software-properties-common gnupg lsb-release

# Tambahkan repository Docker
echo "Menambahkan repository Docker..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update repository
echo "Memperbarui daftar paket..."
apt update

# Instal Docker
echo "Menginstal Docker..."
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verifikasi instalasi Docker
if ! command -v docker &> /dev/null; then
    echo "Docker gagal diinstal. Periksa kembali langkah-langkah instalasi."
    exit 1
fi

# Pastikan Docker aktif
echo "Mengaktifkan Docker..."
systemctl enable docker
systemctl start docker

# Instal Outline Server
echo "Menginstal Outline Server..."
curl -sSL https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh | bash

exit 0

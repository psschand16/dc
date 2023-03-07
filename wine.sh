sudo dpkg --add-architecture i386
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -sc)/winehq-$(lsb_release -sc).sources
sudo apt update -y
sudo apt install -y --install-recommends winehq-stable
# sudo apt install -y  --no-install-recommends winehq-stable

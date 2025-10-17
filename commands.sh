# 1. Installed the actual missing dependencies (safe, modern Ubuntu packages)
sudo apt install dialog libxcb-xinerama0-dev

# 2. Installed Packet Tracer while bypassing only the libgl1-mesa-glx check
sudo dpkg -i --force-depends ~/Downloads/Packet_Tracer822_amd64_signed\ \(1\).deb

packettracer

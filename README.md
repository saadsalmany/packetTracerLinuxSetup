# Packet Tracer 8.2.2 on Ubuntu 24.04 Fix

packet tracer won't install on ubuntu 24.04 because it needs an old library that doesn't exist anymore. here's how i fixed it without breaking anything.

## steps

**1. install some missing stuff**
```bash
sudo apt install dialog libxcb-xinerama0-dev
```
type your password when it asks, then press Y when it asks to continue.

**2. copy and paste this whole thing into terminal**
```bash
mkdir -p ~/libgl-dummy && cd ~/libgl-dummy
mkdir -p libgl1-mesa-glx_99.0.0_all/DEBIAN
cat > libgl1-mesa-glx_99.0.0_all/DEBIAN/control <<'EOF'
Package: libgl1-mesa-glx
Version: 99.0.0
Section: libs
Priority: optional
Architecture: all
Depends: libgl1
Maintainer: User <user@localhost>
Description: Dummy package for libgl1-mesa-glx
EOF
dpkg-deb --build libgl1-mesa-glx_99.0.0_all
sudo dpkg -i libgl1-mesa-glx_99.0.0_all.deb
cd ~ && rm -rf ~/libgl-dummy
```
just copy the entire block, paste it in terminal, and hit enter. it'll create a fake package that tricks the installer.

**3. install packet tracer**
```bash
sudo dpkg -i --force-depends ~/Downloads/Packet_Tracer822_amd64_signed.deb
```
make sure your packet tracer file is in Downloads folder. if it's somewhere else, change that path.

**4. done**
```bash
packettracer
```

that's it. should work now.

## what this actually does

we're creating a fake package that says "the old library is here" but really just uses the new one ubuntu already has. nothing gets broken, no gpu driver issues.

tested on my laptop (ubuntu 24.04 with nvidia + amd gpus) and works fine.

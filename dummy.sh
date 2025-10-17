# Create directory
mkdir -p ~/libgl-dummy && cd ~/libgl-dummy

# Create the control file
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
 This dummy package satisfies the libgl1-mesa-glx dependency
 by depending on the modern libgl1 package.
EOF

# Build the package
dpkg-deb --build libgl1-mesa-glx_99.0.0_all

# Install it
sudo dpkg -i libgl1-mesa-glx_99.0.0_all.deb

# Now fix broken dependencies
sudo apt --fix-broken install

# Clean up
cd ~ && rm -rf ~/libgl-dummy

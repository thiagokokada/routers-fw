# OpenWrt config

Using OpenWrt [build
system](https://openwrt.org/docs/guide-developer/build-system/use-buildsystem):

```
# Download and update the sources
git clone https://git.openwrt.org/openwrt/openwrt.git openwrt
cd openwrt
git pull
 
# Select a specific code revision
git branch -a
git tag
git checkout v19.07.8
 
# Update the feeds
scripts/feeds update -a
scripts/feeds install -a
 
# Configure the firmware image and the kernel
make menuconfig
make kernel_menuconfig
 
# Build the firmware image
make -j $(nproc) defconfig download clean world
```

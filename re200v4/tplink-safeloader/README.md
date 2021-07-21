# tplink-safeloader

Easier to compile version of `tplink-safeloader`, extract from the OpenWrt/Lede
sources: https://github.com/lede-project/source/blob/master/tools/firmware-utils/src/tplink-safeloader.c

Probably out-of-date, but this is the copy I use for TP-Link RE200v4. To use
with other devices it is recommend using the one from upstream.

## Usage

To compile it make use `gcc` is installed and run:

```
$ make
```

To generate an image to restore RE200v4 from OpenWrt back to stock, assuming
that the device has the IP `192.168.1.1`, run:

```
$ ./tplink-safeloader -z oem-firmware.bin -o oem-sysupgrade.bin
$ scp oem-sysupgrade.bin root@192.168.1.1:/tmp
$ ssh root@192.168.1.1
# on-device
# sysupgrade -F oem-sysupgrade.bin
```

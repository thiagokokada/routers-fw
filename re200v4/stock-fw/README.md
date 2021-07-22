# RE200v4 back to stock

Ready to flash image from OpenWrt to put RE200v4 back to stock image. Generated
with `tplink-safeloader` script.

To flash it (assuming device has the IP `192.168.1.1`), run:

```
$ scp oem-sysupgrade.bin root@192.168.1.1:/tmp
$ ssh root@192.168.1.1
# on-device
# sysupgrade -F oem-sysupgrade.bin
```

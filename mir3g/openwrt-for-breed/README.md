# OpenWrt for Breed Bootloader

## Disclaimer

**Only tested on Xiaomi Mi Router 3G with Breed Bootloader**. It may work in
other routers supported by Breed Bootloader with similar configurations, but
keep in mind that the kernel offsets are hardcoded for the specific needs of
Xiaomi Mi Router 3G, so it probably needs some adjustments for other routers.

The result shouldn't brick your router even if it is wrong, since Breed
Bootloader is pretty resiliant (and it explicitly avoids overwriting the
bootloader to avoid a brick). But anyway, there is no guarantee that this will
work for you.

## Why and How?

The release for OpenWrt on Xiaomi Mi Router 3G (and some other devices) are
splited in multiple files. For example:

- `xiaomi_mi-router-3g-initramfs-kernel.bin`
- `xiaomi_mi-router-3g-squashfs-kernel1.bin`
- `xiaomi_mi-router-3g-squashfs-rootfs0.bin`
- `xiaomi_mi-router-3g-squashfs-sysupgrade.bin`

For initial flash you need to flash both `*-kernel1.bin` and `*-rootfs0.bin`
files. You would generally flash those using `mtd` utility command via SSH.
However, if you're using [Breed Bootloader](https://breed.hackpascal.net/) and
is on a firmware that doesn't have `mtd` (like `padavan-ng`), it is impossible
to flash OpenWrt image as-is, since Breed only supports flashing one monolithic
file instead.

This is the issue that `openwrt_for_breed.sh` script does. By using it like
this:

```
$ ./openwrt_for_breed.sh openwrt-21.02.0-rc3-ramips-mt7621-xiaomi_mi-router-3g-squashfs-kernel1.bin openwrt-21.02.0-rc3-ramips-mt7621-xiaomi_mi-router-3g-squashfs-rootfs0.bin
```

It will generate a `openwrt_for_breed.bin` file that can be flashed in Breed
Bootloader.

To flash it turn on the router while pressing the reset button, connect an
Ethernet cable to LAN, go to http://192.168.1.1, select the second option in the
left menu, mark the **second checkbox** and select the generated file also on
the **second file picker**. Press the only button available in the page to
continue, and the only button that appears to confirm in the next page.

## Credits

Based on the script from
[roschacker/openwrt-mir3g-breed](https://github.com/roschacker/openwrt-mir3g-breed)
repository, just converted from CMD to Bash script.

# Breed Bootloader

[Official website](https://breed.hackpascal.net/).

## Why?

- Boot faster than the official bootloader
- Has a user-friendly interface (in Chinese) to flash bootloader/firmware/eeprom
- Can customize environment variables
- Recovery mode

## Flash instructions (from OpenWrt)

Access router via SSH (e.g.: `ssh root@192.168.1.1`) and:

```
$ opkg update
$ opkg install kmod-mtd-rw
$ insmod mtd-rw i_want_a_brick=1
$ mtd unlock /dev/mtd0
$ mtd -r write /root/breed-mt7621-xiaomi-r3g.bin Bootloader
$ reboot
```

## Usage

Plug the power cord while pressing the reset button. The LED will blink in blue
light to indicate that the device is in Breed Bootloader. Afterwards, just
connect using http://192.168.1.1 using a browser. There is also a telnet and
tftp mode if you want.

## Unnoficial translation

https://chrome.google.com/webstore/detail/translator-for-the-breed/hmkkdkhgadgmaplnhahncddmmcdegjhi
https://greasyfork.org/en/scripts/379657-breed-bootloader-english-translation/code

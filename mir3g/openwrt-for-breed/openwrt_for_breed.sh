#!/usr/bin/env bash
# Adapted from https://github.com/roschacker/openwrt-mir3g-breed/commit/3f6ca21fa718f5b2c2a7166bb2ea2e384d83ba5b

set -euo pipefail

usage() {
    echo "This will make OpenWrt binary file for using with Breed for Mi Router 3G."
    echo
    echo "Usage:"
    echo "$0 KERNEL1_FILE ROOTFS0_FILE"
    echo
    echo "Example:"
    echo "$0 openwrt-18.06.2-ramips-mt7621-mir3g-squashfs-kernel1.bin openwrt-18.06.2-ramips-mt7621-mir3g-squashfs-rootfs0.bin"
    echo
    exit 1
}

abort() {
    echo "$@" >&2
    exit 1
}

if [[ "$#" != 2 ]]; then
    usage
fi

kernel1="$1"
rootfs0="$2"

if [[ "$kernel1" != *-kernel1.bin ]] || [[ ! -f "$kernel1" ]]; then
    abort "$kernel1 doesn't seem to be a valid kernel1 file!"
fi

if [[ "$rootfs0" != *-rootfs0.bin ]] || [[ ! -f "$rootfs0" ]]; then
    abort "$rootfs0 doesn't seem to be a valid rootfs0 file!"
fi

# The kernel file must be 4MB (4,194,304 bytes). So we take the kernel file and subtract
# its size is from 4194304 and we get the file needed to get kernel + dummy = 4194304
dummy="dummy.bin"
kernel1_size="$(stat -c%s "$kernel1")"
dummy_size="$(( 4194304 - "$kernel1_size" ))"
result="openwrt_for_breed.bin"

dd if=/dev/zero of="$dummy" bs="$dummy_size" count=1 2>/dev/null
trap 'rm -f "$dummy"' EXIT
cat "$kernel1" "$dummy" "$kernel1" "$dummy" "$rootfs0" > "$result"

echo "Done!"
echo "Generated $result file"
echo "md5sum: $(md5sum "$result")"

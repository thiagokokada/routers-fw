TARGET := ramips
ARCH := mt7621
DEVICE := xiaomi_mi-router-3g
VERSION := 21.02.0-rc3
HOST_ARCH := Linux-x86_64
ifeq (${VERSION}, snapshots)
	FILENAME := openwrt-imagebuilder-${TARGET}-${ARCH}.${HOST_ARCH}
else
	FILENAME := openwrt-imagebuilder-${VERSION}-${TARGET}-${ARCH}.${HOST_ARCH}
endif
PACKAGES := luci-ssl luci-app-sqm luci-app-upnp speedtest-netperf iperf3 htop ethtool dnsmasq-full -dnsmasq irqbalance iwinfo wpad-wolfssl -wpad-basic-wolfssl iw-full -iw

openwrt_for_breed.bin: ${FILENAME}/bin/targets/${TARGET}/${ARCH}/sha256sums
	../openwrt-for-breed/openwrt_for_breed.sh ${FILENAME}/bin/targets/${TARGET}/${ARCH}/openwrt-${VERSION}-${TARGET}-${ARCH}-${DEVICE}-squashfs-kernel1.bin ${FILENAME}/bin/targets/${TARGET}/${ARCH}/openwrt-${VERSION}-${TARGET}-${ARCH}-${DEVICE}-squashfs-rootfs0.bin

${FILENAME}/bin/targets/${TARGET}/${ARCH}/sha256sums: ${FILENAME}
	cd "${FILENAME}"; make image PROFILE="${DEVICE}" PACKAGES="${PACKAGES}"

${FILENAME}: ${FILENAME}.tar.xz
	tar xfv "${FILENAME}.tar.xz"

${FILENAME}.tar.xz:
ifeq (${VERSION}, snapshots)
	curl -O "https://downloads.openwrt.org/snapshots/targets/${TARGET}/${ARCH}/${FILENAME}.tar.xz"
else
	curl -O "https://downloads.openwrt.org/releases/${VERSION}/targets/${TARGET}/${ARCH}/${FILENAME}.tar.xz"
endif

clean:
	rm -rf "${FILENAME}.tar.xz" "${FILENAME}" openwrt_for_breed.bin

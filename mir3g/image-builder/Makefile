TARGET := ramips
ARCH := mt7621
DEVICE := xiaomi_mi-router-3g
VERSION := 21.02.0-rc3
FILENAME := openwrt-imagebuilder-${VERSION}-${TARGET}-${ARCH}.Linux-x86_64
PACKAGES := luci-ssl luci-app-sqm luci-app-upnp speedtest-netperf iperf3 htop ethtool dnsmasq-full -dnsmasq irqbalance iwinfo wpad-wolfssl -wpad-basic-wolfssl

openwrt_for_breed.bin: ${FILENAME}/bin/targets/${TARGET}/${ARCH}
	../openwrt-for-breed/openwrt_for_breed.sh ${FILENAME}/bin/targets/${TARGET}/${ARCH}/openwrt-${VERSION}-${TARGET}-${ARCH}-${DEVICE}-squashfs-kernel1.bin ${FILENAME}/bin/targets/${TARGET}/${ARCH}/openwrt-${VERSION}-${TARGET}-${ARCH}-${DEVICE}-squashfs-rootfs0.bin

${FILENAME}/bin/targets/${TARGET}/${ARCH}: ${FILENAME}
	cd "${FILENAME}"; make image PROFILE="${DEVICE}" PACKAGES="${PACKAGES}"

${FILENAME}: ${FILENAME}.tar.xz
	tar xfv "${FILENAME}.tar.xz"

${FILENAME}.tar.xz:
	curl -O "https://downloads.openwrt.org/releases/${VERSION}/targets/${TARGET}/${ARCH}/${FILENAME}.tar.xz"

clean:
	rm -rf "${FILENAME}.tar.xz" "${FILENAME}" openwrt_for_breed.bin

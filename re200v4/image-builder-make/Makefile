TARGET := ramips
ARCH := mt76x8
DEVICE := tplink_re200-v4
VERSION := snapshots
HOST_ARCH := Linux-x86_64
ifeq (${VERSION}, snapshots)
	FILENAME := openwrt-imagebuilder-${TARGET}-${ARCH}.${HOST_ARCH}
else
	FILENAME := openwrt-imagebuilder-${VERSION}-${TARGET}-${ARCH}.${HOST_ARCH}
endif
PACKAGES := luci-ssl luci-app-sqm luci-proto-relay iperf3 iwinfo wpad-wolfssl -wpad-basic-wolfssl

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
	rm -rf "${FILENAME}.tar.xz" "${FILENAME}"

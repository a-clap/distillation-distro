do_install:append() {
	ln -sf -r ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.bin
}

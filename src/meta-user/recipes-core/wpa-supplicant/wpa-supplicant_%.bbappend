FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
    file://25-wlan.network \
    file://wpa_supplicant-wlan0.conf"

FILES:${PN} += " \
    ${sysconfdir}/systemd/network/25-wlan.network \
    ${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf"

# One should export those
export WLAN0_PSK
export WLAN0_SSID

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/25-wlan.network ${D}${sysconfdir}/systemd/network

    install -d ${D}${sysconfdir}/wpa_supplicant
    install -m 0644 ${WORKDIR}/wpa_supplicant-wlan0.conf ${D}${sysconfdir}/wpa_supplicant
    sed -i "s/WLAN0_SSID/$WLAN0_SSID/" ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf
    sed -i "s/WLAN0_PSK/$WLAN0_PSK/" ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf

    # Create symlink for wlan0 so it gets enabled on boot
    install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants
    ln -s -r ${D}/lib/systemd/system/wpa_supplicant@.service ${D}${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service
}

SYSTEMD_AUTO_ENABLE:${PN} = "enable"

RDEPENDS:${PN}:bananapi-zero += "linux-firmware-bcm43430 kernel-modules"
KERNEL_MODULE_AUTOLOAD:bananapi-zero += "bcm43430"

DESCRIPTION = "Simple heartbeat application in Go"

LICENSE = "CLOSED"
# LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI = " git://github.com/a-clap/beaglebone;protocol=https;branch=main \
            file://go-heartbeat.service"

SRCREV = "ac5a22bd036acdafa696197ada113cf8792dc265"

GO_IMPORT = "github.com/a-clap/beaglebone"
GO_INSTALL = "${GO_IMPORT}/pkg/gpio/heartbeat"

inherit go go-mod

FILES:${PN} += " ${GOBIN_FINAL}/*"

# Enable autostart
inherit systemd

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "go-heartbeat.service"

do_install:append() {
  install -d ${D}${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/go-heartbeat.service ${D}/${systemd_unitdir}/system
}


FILES:${PN} += " go-heartbeat.service"

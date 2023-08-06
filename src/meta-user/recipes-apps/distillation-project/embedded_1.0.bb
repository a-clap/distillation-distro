DESCRIPTION = "Embedded"

LICENSE = "CLOSED"

inherit go go-mod pkgconfig

require recipes-apps/distillation-project/distillation-project.inc

SRC_URI += "file://config.yaml"

GO_IMPORT = "./embedded/cmd/embedded"
GO_INSTALL = "${GO_IMPORT}"

do_install:append() {
  install -d ${D}/home/root/embedded
  install -m 755 ${WORKDIR}/config.yaml ${D}/home/root/embedded/config.yaml

  install -m 755 ${D}${bindir}/embedded ${D}/home/root/embedded/embedded
}

FILES:${PN} += "/home/root/embedded/config.yaml"
FILES:${PN} += "/home/root/embedded/embedded"

# Enable autostart
inherit systemd

SRC_URI += "file://embedded.service"

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "embedded.service"

do_install:append() {
  install -d ${D}${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/embedded.service ${D}/${systemd_unitdir}/system
}


FILES:${PN} += "embedded.service"
DESCRIPTION = "Embedded"

LICENSE = "CLOSED"

inherit go go-mod pkgconfig

require recipes-apps/distillation-project/distillation-project.inc

SRC_URI += "file://config.yaml"

GO_INSTALL = "./embedded/cmd/embedded"

MENDER_PERSISTENT_STORAGE = "/data"

do_install:append() {
  install -d ${D}${MENDER_PERSISTENT_STORAGE}/embedded
  install -m 755 ${WORKDIR}/config.yaml ${D}${MENDER_PERSISTENT_STORAGE}/embedded/config.yaml
}

FILES:${PN} += "${MENDER_PERSISTENT_STORAGE}/embedded/config.yaml"

# Enable autostart
inherit systemd

SRC_URI += "file://embedded.service.in"

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "embedded.service"

do_install:append() {
  install -d ${D}${systemd_unitdir}/system

  install -m 0644 ${WORKDIR}/embedded.service.in ${D}/${systemd_unitdir}/system/embedded.service
  sed -i 's:@CONFIG@:${MENDER_PERSISTENT_STORAGE}/embedded:' "${D}/${systemd_unitdir}/system/embedded.service"

}


FILES:${PN} += "embedded.service"
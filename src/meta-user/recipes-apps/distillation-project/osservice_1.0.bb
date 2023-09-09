DESCRIPTION = "OSService app"

LICENSE = "CLOSED"

inherit go go-mod pkgconfig

require recipes-apps/distillation-project/distillation-project.inc

GO_INSTALL = "./osservice/cmd"

# Enable autostart
inherit systemd
SRC_URI += "file://osservice.service.in"

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "osservice.service"

MENDER_PERSISTENT_STORAGE = "/data"
MENDER_KEY_FILE = "mender.key"
MENDER_KEY_DST = "${MENDER_PERSISTENT_STORAGE}/osservice/${MENDER_KEY_FILE}"

addtask do_mender_key after do_compile before do_install

DEPENDS += "openssl-native"

export GENERATED_MENDER_KEY
export MENDER_SERVER_URL
export MENDER_TENANT_TOKEN

do_mender_key() {
  echo "${GENERATED_MENDER_KEY}" > ${B}/${MENDER_KEY_FILE}
}

do_install:append() {
  # Rename app
  mv ${D}${bindir}/cmd ${D}${bindir}/osservice

  install -d ${D}${systemd_unitdir}/system

  install -m 0644 ${WORKDIR}/osservice.service.in ${D}/${systemd_unitdir}/system/osservice.service
  sed -i 's~@CONFIG@~${MENDER_PERSISTENT_STORAGE}/osservice~' "${D}/${systemd_unitdir}/system/osservice.service"
  sed -i 's~@MENDER@~${MENDER_SERVER_URL}~' '${D}/${systemd_unitdir}/system/osservice.service'
  sed -i 's~@TOKEN@~${MENDER_TENANT_TOKEN}~' "${D}/${systemd_unitdir}/system/osservice.service"
  sed -i 's~@PEM@~${MENDER_KEY_DST}~' "${D}/${systemd_unitdir}/system/osservice.service"
  
  install -d ${D}${MENDER_PERSISTENT_STORAGE}/osservice
  install -m 0644 ${B}/${MENDER_KEY_FILE} ${D}${MENDER_KEY_DST}
}


FILES:${PN} += "${MENDER_PERSISTENT_STORAGE}/osservice"
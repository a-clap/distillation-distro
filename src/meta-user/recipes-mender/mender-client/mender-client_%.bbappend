FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://mender-device-identity"

do_install:append() {
    install -d ${D}/${datadir}/mender/identity
    install -m 755 ${WORKDIR}/mender-device-identity ${D}/${datadir}/mender/identity/mender-device-identity
}

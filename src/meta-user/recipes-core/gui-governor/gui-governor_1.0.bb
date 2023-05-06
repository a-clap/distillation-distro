SUMMARY = "Script to set desired GPU governor"
DESCRIPTION = "Script to do any first boot init, started as a systemd service which removes itself once finished"
LICENSE = "CLOSED"

SRC_URI =  " \
    file://gui-governor.sh \
    file://gui-governor.service \
"

inherit allarch systemd

do_compile[no_exec] = "1"

do_install () {
    install -d ${D}/${sbindir}
    install -m 0755 ${WORKDIR}/gui-governor.sh ${D}/${sbindir}

    install -d ${D}${systemd_unitdir}/system/
    install -m 0644 ${WORKDIR}/gui-governor.service ${D}${systemd_unitdir}/system
}

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "gui-governor.service"


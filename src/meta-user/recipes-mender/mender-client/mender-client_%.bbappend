FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://mender-device-identity \
             file://0001-Update-progressbar-output.patch;patchdir=src/${GO_IMPORT}"

PACKAGECONFIG:remove:pn-mender-client = " inventory-network-scripts"

MENDER_INFO_PATH = "${datadir}/mender/info"
DEVICE_INFO = "mender-device-info"

do_install:append() {
    install -d ${D}/${datadir}/mender/identity
    install -m 755 ${WORKDIR}/mender-device-identity ${D}/${datadir}/mender/identity/mender-device-identity

    rm ${D}/${datadir}/mender/inventory/mender-inventory-provides

    # Create directory with info scripts
    install -d ${D}${MENDER_INFO_PATH}

    # Get device info
    echo "#!/bin/sh" > ${D}${MENDER_INFO_PATH}/${DEVICE_INFO}
    echo "echo device_type=${MENDER_DEVICE_TYPE}" >> ${D}${MENDER_INFO_PATH}/${DEVICE_INFO}
    echo "echo artifact_name=${MENDER_ARTIFACT_NAME}" >> ${D}${MENDER_INFO_PATH}/${DEVICE_INFO}
    chmod a+x ${D}${MENDER_INFO_PATH}/${DEVICE_INFO}

}

FILES:${PN} += "${MENDER_INFO_PATH}/${DEVICE_INFO}"

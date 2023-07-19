FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://mender-device-identity \
             file://0001-Update-progressbar-output.patch;patchdir=src/${GO_IMPORT}"

PACKAGECONFIG:remove:pn-mender-client = " inventory-network-scripts"

do_install:append() {
    install -d ${D}/${datadir}/mender/identity
    install -m 755 ${WORKDIR}/mender-device-identity ${D}/${datadir}/mender/identity/mender-device-identity

    rm ${D}/${datadir}/mender/inventory/mender-inventory-provides

    # Add information about device type to inventory-scripts
    echo "#!/bin/sh" > ${D}/${datadir}/mender/inventory/mender-inventory-device-type
    echo "echo device_type=${MENDER_DEVICE_TYPE}" >> ${D}/${datadir}/mender/inventory/mender-inventory-device-type
    
    chmod a+x ${D}/${datadir}/mender/inventory/mender-inventory-device-type
}

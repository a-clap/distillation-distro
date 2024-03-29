FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend := "${THISDIR}/mender:"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

MENDER_UBOOT_AUTO_CONFIGURE = "0"

BOOTENV_SIZE = "0x10000"

# Remove mender patch, as it doesn't apply cleanly
SRC_URI:remove:bananapi-zero = "file://0003-Integration-of-Mender-boot-code-into-U-Boot.patch"

# And add updated patch 
SRC_URI:append:bananapi-zero = "    file://env.cfg \
                                    file://0001-Mickledore-Integration-of-Mender-boot-code-into-U-Bo.patch \ 
                                    file://0001-Add-mender_boot-command.patch"






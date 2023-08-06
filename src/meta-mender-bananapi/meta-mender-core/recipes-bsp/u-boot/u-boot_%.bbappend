FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/mender:"

MENDER_UBOOT_AUTO_CONFIGURE = "0"

BOOTENV_SIZE = "0x10000"

SRC_URI:append = " file://env.cfg"

SRC_URI:remove = "file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
SRC_URI:remove = "file://0001-riscv-fix-build-with-binutils-2.38.patch"

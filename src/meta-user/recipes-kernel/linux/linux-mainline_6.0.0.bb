require recipes-kernel/linux/linux-mainline.inc

## Updates to linux-mainline.inc
# Use git instead of tar.xz
SRC_URI:remove = "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${PV}.tar.xz"
# Adding this causes errors, not needed for bananapi
SRC_URI:remove = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"
# Remove conditional appends, as it is problematic during devtools usage, then add it anyway
SRC_URI:remove:use-mailine-graphics = "file://drm.cfg"
SRC_URI:remove:bananapi = "file://axp20x.cfg"
SRC_URI:remove:cubietruck = "file://axp20x.cfg"

DESCRIPTION = "Mainline Linux Kernel 6"

KBRANCH = "master"
KERNEL_VERSION = "${PV}"

# Contains copy of meta-sunxi linux files
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/sunxi:"
# And my own patches
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
# Update kernel git path
SRC_URI += "git://github.com/torvalds/linux.git;protocol=https;branch=master"
SRCREV = "4fe89d07dcc2804c8b562f6c7896a45643d34b2f"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

S = "${WORKDIR}/linux-${KERNEL_VERSION}/git"

SRC_URI += "file://axp20x.cfg \
            file://drm.cfg \
            file://onewire.cfg \
            "

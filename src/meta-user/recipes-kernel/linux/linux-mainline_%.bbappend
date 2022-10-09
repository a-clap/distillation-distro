FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

KBRANCH = "master"
KERNEL_VERSION = "${PV}"

# I want to use git
SRC_URI:remove = "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${PV}.tar.xz"
# Adding this causes errors
SRC_URI:remove = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"
# Remove conditional appends, as it is problematic during devtools usage, then add it always
SRC_URI:remove:use-mailine-graphics = "file://drm.cfg"
SRC_URI:remove:bananapi = "file://axp20x.cfg"
SRC_URI:remove:cubietruck = "file://axp20x.cfg"

# Update kernel git path
SRC_URI:prepend = "git://github.com/torvalds/linux.git;protocol=https;branch=master "
# 6.0 :)
KERNEL_VERSION_SANITY_SKIP = "1"
SRCREV = "4fe89d07dcc2804c8b562f6c7896a45643d34b2f"

S = "${WORKDIR}/linux-${KERNEL_VERSION}/git"

SRC_URI += "file://onewire.cfg \
            file://0001-Onewire-on-PI19.patch \
            file://axp20x.cfg \
            file://drm.cfg \
            "

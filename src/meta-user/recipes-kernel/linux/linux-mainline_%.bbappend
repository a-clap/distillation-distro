FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# I want to use git
SRC_URI:remove = "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${PV}.tar.xz"
# Adding this causes errors
SRC_URI:remove = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"

# Update kernel git path
SRC_URI:append = " git://github.com/torvalds/linux.git;protocol=https;branch=master"
# 5.15
SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
# 6.0 :)
# SRCREV = "4fe89d07dcc2804c8b562f6c7896a45643d34b2f"
S = "${WORKDIR}/git"
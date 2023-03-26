# Use git instead of tar.xz
SRC_URI:remove = "https://www.kernel.org/pub/linux/kernel/v${KRELEASE}.x/linux-${PV}.tar.xz"

# Adding this causes errors, not needed for bananapi
SRC_URI:remove = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"

# Update kernel git path
SRC_URI += "git://github.com/torvalds/linux.git;protocol=https;branch=master"

KERNEL_VERSION_SANITY_SKIP="1"

# And my own patches
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

# And from now build from GIT
S = "${WORKDIR}/linux-${KERNEL_VERSION}/git"

SRC_URI += "file://onewire.cfg \
            file://trng.cfg \
            file://rtc.cfg \
            file://display.cfg \
            file://0001-Add-two-spidevs-max31865.patch \
            file://0001-Add-sun8i-h3-trng-hw-support.patch \
            file://0001-Add-onewire-buses-PC7-PA8-PA9.patch \
            file://0001-Add-ws2812-support-on-SPI1-MOSI.patch \
            file://0001-Add-i2c0-rtc-ds3231-enable-i2c1.patch \
            file://0001-Enable-wired-eth.patch \
            "

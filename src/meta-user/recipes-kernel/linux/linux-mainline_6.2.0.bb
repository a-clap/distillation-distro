require recipes-kernel/linux/linux-mainline.inc

## Updates to linux-mainline.inc
# Use git instead of tar.xz
SRC_URI:remove = "https://www.kernel.org/pub/linux/kernel/v5.x/linux-${PV}.tar.xz"
# Adding this causes errors, not needed for bananapi
SRC_URI:remove = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"

DESCRIPTION = "Mainline Linux Kernel 6"

KBRANCH = "master"
KERNEL_VERSION = "6.2rc7"
KERNEL_VERSION_SANITY_SKIP="1"
# Contains copy of meta-sunxi linux files
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/sunxi:"
# And my own patches
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
# Update kernel git path
SRC_URI += "git://github.com/torvalds/linux.git;protocol=https;branch=master"

SRCREV = "4ec5183ec48656cec489c49f989c508b68b518e3"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

S = "${WORKDIR}/linux-${KERNEL_VERSION}/git"

SRC_URI += "file://axp20x.cfg \
            file://drm.cfg \
            file://onewire.cfg \
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

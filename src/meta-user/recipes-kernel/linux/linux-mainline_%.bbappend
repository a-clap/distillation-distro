# Use git instead of tar.xz
SRC_URI:remove = "https://www.kernel.org/pub/linux/kernel/v${KRELEASE}.x/linux-${PV}.tar.xz"

# Adding this causes errors, not needed for bananapi
SRC_URI:remove = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"
SRC_URI:remove = "file://0002-dts-nanopi-neo-air-add-camera.patch"
SRC_URI:remove = "file://0003-dts-allwinner-bananapi-m2-zreo-Enforce-consistent-MM.patch"

# Update kernel git path
SRC_URI += "git://github.com/torvalds/linux.git;protocol=https;branch=master"

PV = "6.8"
KERNEL_VERSION_SANITY_SKIP = "1"
SRCREV = "d206a76d7d2726f3b096037f2079ce0bd3ba329b"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

# And from now build from GIT
S = "${WORKDIR}/linux-${PV}/git"


# bananapi-zero
DEPENDS:append:bananapi-zero = " lzop-native"

FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/bananapi-zero:"

SRC_URI:append:bananapi-zero = " \
            file://ptys.cfg                                         \
            file://display.cfg                                      \
            file://fs.cfg                                           \
            file://gov.cfg                                          \
            file://gpu.cfg                                          \
            file://lzo.cfg                                          \
            file://onewire.cfg                                      \
            file://rtc.cfg                                          \
            file://thermal.cfg                                      \
            file://trng.cfg                                         \
            file://0001-Add-i2c0-rtc-ds3231-enable-i2c1.patch       \
            file://0001-Add-MAX31865-spidev-support.patch           \
            file://0001-Add-onewire-buses-PC7-PA8-PA9.patch         \
            file://0001-Add-sun8i-h3-trng-hw-support.patch          \
            file://0001-Add-two-spidevs-max31865.patch              \
            file://0001-Add-WS2812-spidev.patch                     \
            file://0001-Add-WS2812-spidev-support.patch             \
            file://0001-Enable-wired-eth.patch                      \
            "

# mq-quad

FILESEXTRAPATHS:prepend:mq-quad := "${THISDIR}/mq-quad:"

SRC_URI:append:mq-quad = " file://0001-Basic-mangpopi-mq-quad-support.patch"

# orangepi-zero2w
FILESEXTRAPATHS:prepend:orangepi-zero2w := "${THISDIR}/orangepi-zero2w:"

SRC_URI:append:orangepi-zero2w = "  \
     file://axp.cfg                 \
     file://w1.cfg                  \
     file://connector.cfg"


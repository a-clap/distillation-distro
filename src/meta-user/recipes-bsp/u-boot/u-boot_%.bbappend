# v2024.04-rc2
SRCREV = "37345abb97ef0dd9c50a03b2a72617612dcae585"
SRC_URI:remove = "file://0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch"

# bananapi
FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/bananapi-zero:"

SRC_URI:append:bananapi-zero = "    file://autoboot-delay.cfg   \ 
                                    file://dram.cfg             \
                                    file://opt.cfg              \
                                    file://bootcmd.cfg          \
                                "

# mq-quad
FILESEXTRAPATHS:prepend:mq-quad := "${THISDIR}/mq-quad:"

SRC_URI:append:mq-quad = "file://0001-mq_quad-add-defconfig.patch \
                          file://0001-mq-quad-add-sun50i-h618-mq-quad.dts.patch"


# orangepi-zero2w
FILESEXTRAPATHS:prepend:orangepi-zero2w := "${THISDIR}/orangepi-zero2w:"

SRC_URI:append:orangepi-zero2w = " \
    file://0001-Add-orangepi_zero2w_defconfig.patch \
    file://autoboot-delay.cfg"

                                    

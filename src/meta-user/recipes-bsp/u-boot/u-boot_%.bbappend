# v2024.01-rc3
SRCREV = "24ca49b33af98d54d6cd2e845f071f6565345ffd"

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

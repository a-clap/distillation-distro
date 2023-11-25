FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/files:"
# v2024.01-rc3
SRCREV = "24ca49b33af98d54d6cd2e845f071f6565345ffd"

# bananapi
FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/bananapi-zero:"

SRC_URI:append:bananapi-zero = "    file://autoboot-delay.cfg   \ 
                                    file://dram.cfg             \
                                    file://opt.cfg              \
                                    file://bootcmd.cfg          \
                                "

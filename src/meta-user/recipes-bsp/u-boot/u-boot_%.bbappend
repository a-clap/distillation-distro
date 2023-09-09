FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/bananapi-zero:"

SRC_URI:append:bananapi-zero = "    file://autoboot-delay.cfg \
                                    file://dram.cfg"

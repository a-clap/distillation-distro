FILESEXTRAPATHS:prepend:bananapi-zero := "${THISDIR}/files:"

SRC_URI:append:bananapi-zero = "    file://autoboot-delay.cfg   \ 
                                    file://dram.cfg             \
                                    file://opt.cfg              \
                                    file://bootcmd.cfg          \
                                    file://0001-Add-mender_boot-command.patch"


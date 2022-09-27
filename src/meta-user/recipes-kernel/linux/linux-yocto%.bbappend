FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "  file://gpio-sysfs.cfg \
                    file://led.cfg"

BBB_GPU_FILES =  " file://drm.cfg \
                    file://0001-Enables-GPU-in-DT.patch"

BBB_ONEWIRE_FILES = "file://onewire.cfg \
                      file://0001-Add-onewire-support-on-P9_12-pin.patch"

BBB_DISPLAY_FILES = "file://display.cfg"

BBB_SPIDEV_FILES = "file://spidev.cfg \
                     file://0001-SPI0-in-DT-max-max31865-as-compatible-spidev.patch"

SRC_URI:append = "${@bb.utils.contains('DISTRO_FEATURES', 'gpu', ' ${BBB_GPU_FILES}', '', d)}"
SRC_URI:append = "${@bb.utils.contains('MACHINE_FEATURES', 'onewire', ' ${BBB_ONEWIRE_FILES}', '', d)}"
SRC_URI:append = "${@bb.utils.contains('MACHINE_FEATURES', 'display', ' ${BBB_DISPLAY_FILES}', '', d)}"
SRC_URI:append = "${@bb.utils.contains('MACHINE_FEATURES', 'spidev', ' ${BBB_SPIDEV_FILES}', '', d)}"

COMPATIBLE_MACHINE:${MACHINE} = "${MACHINE}"
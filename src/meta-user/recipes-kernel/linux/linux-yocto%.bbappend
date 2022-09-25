FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"

SRC_URI += "file://gpio-sysfs.cfg \
            file://onewire.cfg \
            file://spidev.cfg \
            file://led.cfg     \
            file://0001-Add-onewire-support-on-P9_12-pin.patch \
            file://0001-SPI0-in-DT-max-max31865-as-compatible-spidev.patch \
            file://0001-Configured-USER3_LED-as-heartbeat.patch \
            "

COMPATIBLE_MACHINE:${MACHINE} = "${MACHINE}"

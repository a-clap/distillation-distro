FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"

SRC_URI += "file://gpio-sysfs.cfg \
            file://onewire.cfg \
            file://0001-Add-onewire-support-on-P9_12-pin.patch \
            "


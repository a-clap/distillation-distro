SUMMARY = "Image for BananaPI BPI-M2 Zero"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += "package-management hwcodecs x11-base"

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"

IMAGE_INSTALL += "libgpiod rsync"
IMAGE_INSTALL += "  \
            packagegroup-core-ssh-openssh   \
            openssh-sftp                    \
            openssh-sftp-server             \
            ssh-pregen-hostkeys"

IMAGE_INSTALL += "wpa-supplicant"
IMAGE_INSTALL += "xinput-calibrator pointercal-xinput"
IMAGE_INSTALL += "distillation embedded gui gui-governor"
IMAGE_INSTALL += "iptables avahi-daemon"

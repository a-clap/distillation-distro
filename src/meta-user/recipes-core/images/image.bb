SUMMARY = "Image for BananaPI BPI-M2 Zero"

require recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES += "read-only-rootfs"
IMAGE_INSTALL += "volatile-binds"

IMAGE_INSTALL += "libgpiod"
IMAGE_INSTALL += "  \
            packagegroup-core-ssh-openssh   \
            openssh-sftp                    \
            openssh-sftp-server             \
            ssh-pregen-hostkeys"

IMAGE_INSTALL += "wpa-supplicant"
IMAGE_INSTALL += "pointercal-xinput"

IMAGE_INSTALL += "iptables avahi-daemon systemd-analyze"

IMAGE_INSTALL += "distillation embedded gui gui-governor osservice"

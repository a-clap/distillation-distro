SUMMARY = "Image for OrangePi Zero2W"

require recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL += "  \
            kernel-modules                  \
            wpa-supplicant                  \
            libgpiod                        \
            packagegroup-core-ssh-openssh   \
            openssh-sftp                    \
            openssh-sftp-server             \
            ssh-pregen-hostkeys"

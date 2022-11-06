DESCRIPTION = "Fyne demo app"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit features_check

REQUIRED_DISTRO_FEATURES = "opengl"
REQUIRES_IMAGE_FEATURES = "x11-base x11-sato"

SRC_URI = "git://github.com/fyne-io/fyne.git;protocol=https;branch=master"
SRCREV = "${AUTOREV}"

GO_IMPORT = "fyne.io/fyne/v2/cmd/fyne_demo"
GO_INSTALL = "${GO_IMPORT}"

DEPENDS += "virtual/libgl libxcursor libxinerama xinput libxkbcommon"
RDEPENDS:${PN} += "xserver-xorg-extension-glx"

inherit go go-mod pkgconfig

FILES:${PN} += "${GOBIN_FINAL}/*"




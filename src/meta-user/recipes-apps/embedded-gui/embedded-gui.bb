DESCRIPTION = "Embedded GUI"

LICENSE = "CLOSED"

inherit features_check go go-mod pkgconfig

REQUIRED_DISTRO_FEATURES = "opengl"
REQUIRES_IMAGE_FEATURES = "x11-base"

SRC_URI = "git://github.com/a-clap/distillation;protocol=https;branch=development"
SRC_URI += "file://session"
SRC_URI += "file://99-calibration.conf"

SRCREV = "${AUTOREV}"

GO_IMPORT = "./cmd/gui"
GO_INSTALL = "${GO_IMPORT}"

DEPENDS += "virtual/libgl libxcursor libxinerama xinput libxkbcommon"
RDEPENDS:${PN} += "xserver-xorg-extension-glx"

do_install:append() {
  install -d ${D}${sysconfdir}/mini_x
  install -m 755 ${WORKDIR}/session ${D}${sysconfdir}/mini_x/session

  install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
  install -m 0644 ${WORKDIR}/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
}

FILES:${PN} += "${sysconfdir}/mini_x/session"
FILES:${PN} += " ${sysconfdir}/X11/xorg.conf.d/*"
DESCRIPTION = "Embedded GUI"

LICENSE = "CLOSED"

inherit features_check pkgconfig goarch

require recipes-apps/distillation-project/distillation-project.inc

REQUIRED_DISTRO_FEATURES = "opengl"
REQUIRES_IMAGE_FEATURES = "x11-base"

SRC_URI += "file://session"
SRC_URI += "file://99-calibration.conf"

DEPENDS += "wails-native nodejs-native gtk+3 webkitgtk"
RDEPENDS:${PN} += "xserver-xorg-extension-glx"

S = "${WORKDIR}/git/gui"

INSANE_SKIP:${PN}:append = "already-stripped ldflags"

export GOARCH = "${TARGET_GOARCH}"
export GOOS = "${TARGET_GOOS}"
export GOHOSTARCH = "${BUILD_GOARCH}"
export GOHOSTOS = "${BUILD_GOOS}"

do_compile() {
    cd ${S}
    wails build -skipbindings -nocolour
}

do_install() {
  install -d ${D}${bindir}
  install -m 755 ${S}/build/bin/gui ${D}${bindir}/gui

  install -d ${D}${sysconfdir}/mini_x
  install -m 755 ${WORKDIR}/session ${D}${sysconfdir}/mini_x/session

  install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
  install -m 0644 ${WORKDIR}/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
}

FILES:${PN} += "${sysconfdir}/mini_x/session"
FILES:${PN} += "${sysconfdir}/X11/xorg.conf.d/*"
DESCRIPTION = "Distillation app"

LICENSE = "CLOSED"

inherit go go-mod pkgconfig

require recipes-apps/distillation-project/distillation-project.inc

GO_INSTALL = "./distillation/cmd/distillation"
# DEPENDS += "protobuf-native protobuf-go-native go-grpc-native gomock-native gomock"

do_compile:prepend() {
  # Generate embedded protos
  cd ${MAIN}/embedded
  ${GO} generate ./...
  
  # And distillation
  cd ${MAIN}/distillation/pkg/distillation
  ${GO} generate ./...

  # Comeback to main dir
  cd ${MAIN}
}

# Enable autostart
inherit systemd
SRC_URI += "file://distillation.service"

SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "distillation.service"

do_install:append() {
  install -d ${D}${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/distillation.service ${D}/${systemd_unitdir}/system
}


FILES:${PN} += "distillation.service"
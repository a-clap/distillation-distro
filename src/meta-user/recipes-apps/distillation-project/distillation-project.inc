SRC_URI = "git://github.com/a-clap/distillation-project;protocol=https;branch=development"

SRCREV = "${AUTOREV}"

GO_IMPORT ?= "distillation-project"

MAIN ?= "${B}/src/${GO_IMPORT}"

GO_EXTRA_LDFLAGS += "-s -w"
DEPENDS += "protobuf-native protobuf-go-native go-grpc-native"
INSANE_SKIP:${PN} += "already-stripped"
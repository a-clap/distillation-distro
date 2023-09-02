SRC_URI = "git://github.com/a-clap/distillation-project;protocol=https;branch=development"

PV = "1.0+git${SRCPV}"
SRCREV = "${AUTOREV}"

GO_IMPORT ?= "distillation-project"

GO_EXTRA_LDFLAGS += "-s -w"
INSANE_SKIP:${PN} += "already-stripped"
DESCRIPTION = "Simple locally build application in Go"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI = " file://go-example.go \
            file://go.mod       \
            file://go.sum"

GO_IMPORT = "${PN}"
GO_INSTALL = "${GO_IMPORT}"

inherit go go-mod

do_configure:append() {
    install -d ${S}/src/${GO_IMPORT}
}

FILES:${PN} += "${GOBIN_FINAL}/*"



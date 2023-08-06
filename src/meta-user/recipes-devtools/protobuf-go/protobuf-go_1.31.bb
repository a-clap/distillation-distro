DESCRIPTION = "Go support for Protocol Buffers"
SECTION = "net"
HOMEPAGE ="https://github.com/protocolbuffers/protobuf-go"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=02d4002e9171d41a8fad93aa7faf3956"

SRC_URI = "git://github.com/protocolbuffers/protobuf-go.git;protocol=https;branch=master"
SRCREV = "68463f0e96c93bc19ef36ccd3adfe690bfdb568c"

inherit go go-mod pkgconfig

GO_IMPORT = "google.golang.org/protobuf"
GO_INSTALL = "./cmd/protoc-gen-go"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/${GO_BUILD_BINDIR}/protoc-gen-go ${D}${bindir}/protoc-gen-go
}

RDEPENDS:${PN}-dev = "bash"

BBCLASSEXTEND = "native nativesdk"

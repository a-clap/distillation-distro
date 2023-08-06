DESCRIPTION = "The Go language implementation of gRPC. HTTP/2 based RPC"
SECTION = "net"
HOMEPAGE = "https://github.com/grpc/grpc-go"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

SRC_URI = "git://github.com/grpc/grpc-go.git;protocol=https;branch=v1.57.x"
SRCREV = "87bf02ad24f6cc071d2553eb5d62332194bba1fe"

inherit go go-mod

GO_IMPORT = "google.golang.org/grpc"
GO_INSTALL = "./cmd/protoc-gen-go-grpc"

do_compile:append() {
    cd cmd/protoc-gen-go-grpc
    ${GO} install .
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/${GO_BUILD_BINDIR}/protoc-gen-go-grpc ${D}${bindir}/protoc-gen-go-grpc
}

RDEPENDS:${PN}-dev = "bash"

BBCLASSEXTEND = "native nativesdk"


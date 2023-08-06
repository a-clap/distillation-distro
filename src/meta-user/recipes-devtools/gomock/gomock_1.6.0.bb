DESCRIPTION = "GoMock is a mocking framework for the Go programming language."

HOMEPAGE = "https://github.com/golang/mock"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

SRC_URI = "git://github.com/golang/mock.git;protocol=https;branch=main"
SRCREV = "aba2ff9a6844d5e3289e8472d3217d5b3090f083"

inherit go go-mod

RDEPENDS:${PN}-dev = "bash"

GO_IMPORT = "github.com/golang/mock"
GO_INSTALL = "./mockgen ./mockgen/model"
BBCLASSEXTEND = "native nativesdk"


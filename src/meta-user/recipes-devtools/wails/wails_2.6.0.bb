DESCRIPTION = "Wails"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=6d574ba6b207cbac5df070aaba733e89"

inherit go-mod pkgconfig

SRC_URI = " git://github.com/wailsapp/wails.git;protocol=https;branch=master"
SRCREV = "1644ee152ecf0fc79600413642ba624077b8de4d"

GO_WORKDIR = "./cmd/wails/v2"

GO_IMPORT = "./cmd/wails"
GO_INSTALL = "${GO_IMPORT}"

BBCLASSEXTEND = "native nativesdk"

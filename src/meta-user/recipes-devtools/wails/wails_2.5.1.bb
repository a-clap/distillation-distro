DESCRIPTION = "Wails"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=6d574ba6b207cbac5df070aaba733e89"

inherit go-mod pkgconfig

SRC_URI = " git://github.com/wailsapp/wails.git;protocol=https;branch=master"
SRCREV = "62d97f85ec4b02714d88936c7da603e6a3d7fa47"

GO_WORKDIR = "./cmd/wails/v2"

GO_IMPORT = "./cmd/wails"
GO_INSTALL = "${GO_IMPORT}"

BBCLASSEXTEND = "native nativesdk"

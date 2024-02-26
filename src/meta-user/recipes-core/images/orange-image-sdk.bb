SUMMARY = "SDK Image for OrangePi Zero2W"

require recipes-core/images/orange-image_0.1.0.bb

IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug tools-testapps debug-tweaks"

IMAGE_INSTALL += "hwlatdetect"
TOOLCHAIN_HOST_TASK += "kernel-devsrc kernel-dev"

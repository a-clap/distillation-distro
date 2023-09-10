PACKAGECONFIG:remove = "randomseed"
PACKAGECONFIG:remove = "xkbcommon"
PACKAGECONFIG:remove = "vconsole"
PACKAGECONFIG:remove = "utmp"
PACKAGECONFIG:remove = "backlight"
PACKAGECONFIG:remove = "hibernate"


pkg_postinst:udev-hwdb:bananapi-zero() {
}
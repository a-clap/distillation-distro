# Default to (primary) SD
rootdev=mmcblk0p2
setenv bootargs console=${console} console=tty1 root=/dev/${rootdev} rootwait panic=10 ${extra}
load mmc 0:1 ${fdt_addr_r} sun50i-h618-orangepi-zero2w.dtb
load mmc 0:1 ${kernel_addr_r} Image
booti ${kernel_addr_r} - ${fdt_addr_r}

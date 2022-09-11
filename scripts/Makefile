.DEFAULT_GOAL := build
cwd = $(shell pwd)

.PHONY: build qemu clean modify run

qemu:
	@bitbake qemu-native
	@bitbake qemu-helper-native

build:
	bitbake bbb-image

clean:
	@bitbake world -c mrproper
	@rm -rf cache/ tmp/ bitbake*

target = bootloader
diff_file = diffconfig.txt
modify:
	@bitbake virtual/${target} -c cleansstate
	@bitbake virtual/${target} -c menuconfig
	@bitbake virtual/${target} -c diffconfig > ${diff_file} && sync ${diff_file}
	cp $(shell cat ${diff_file} | grep "fragment.cfg") ${cwd}/${target}_diff.cfg
	@echo Configuration diff file stored in: ${cwd}/${target}_diff.cfg
	@bitbake virtual/${target} -c cleansstate

run:
	@runqemu slirp nographic



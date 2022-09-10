.DEFAULT_GOAL := build
cwd = $(shell pwd)

.PHONY: build qemu clean modify

qemu:
	@bitbake qemu-native
	@bitbake qemu-helper-native

build: qemu
	bitbake bbb-image

clean:
	@bitbake world -c mrproper
	@rm -rf cache/ tmp/ bitbake*

target = kernel
modify:
	@bitbake virtual/${target} -c cleansstate
	@bitbake virtual/${target} -c menuconfig
	$(shell cp $(shell bitbake virtual/${target} -c diffconfig | grep "fragment.cfg") ${cwd}/${target}_diff.cfg)
	@echo Diff file stored in ${target}_diff.cfg
	@bitbake virtual/${target} -c cleansstate

run:
	@runqemu slirp nographic
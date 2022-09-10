cwd = $(shell pwd)
docker_user = yocto

.PHONY: build run deploy deploy_boot deploy_rootfs

build:
	docker build --build-arg username=${docker_user} . -t bbb:latest

run:
	@mkdir -p ${cwd}/downloads
	@mkdir -p ${cwd}/sstate
	docker run --rm \
		-v ${cwd}/sstate:/home/${docker_user}/sstate \
        -v ${cwd}/downloads:/home/${docker_user}/downloads \
		-v ${cwd}/src:/home/${docker_user}/src \
		-v ${cwd}/build:/home/${docker_user}/build \
		-p 2222:2222	\
        -it --user=$(shell id -u):$(shell id -g) bbb:latest

path = build/tmp/deploy/images/beaglebone
boot_files = am335x-boneblack.dtb  am335x-bone.dtb  MLO  u-boot.img  zImage
deploy_boot:
	@echo deploying boot files: ${boot_files}...
	@sudo umount ${dev}1 || true
	@sudo mkdir -p /media/${USER}/boot
	@sudo mount ${dev}1 /media/${USER}/boot
	@for file in ${boot_files}; do \
  		sudo cp -r -L ${path}/$$file /media/${USER}/boot; \
  	done; \
  	echo done!

deploy_rootfs:
	@echo deploying rootfs...
	@sudo umount ${dev}2 || true
	@sudo mkdir -p /media/${USER}/rootfs
	@sudo mount ${dev}2 /media/${USER}/rootfs
	@sudo rm -rf /media/${USER}/rootfs/*
	@sudo pv ${path}/bbb-image-beaglebone-*.tar.bz2 | sudo tar jxf - -C /media/${USER}/rootfs
	@echo done!


deploy:
	@sudo dd bs=4M if=${path}/bbb-image-beaglebone.wic of=${dev} status=progress && sync
	@sudo eject ${dev}

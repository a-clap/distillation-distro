cwd = $(shell pwd)
docker_user = yocto

.PHONY: build run deploy

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
        -it --user=$(shell id -u):$(shell id -g) bbb:latest

deploy:
	sudo dd bs=4M if=build/tmp/deploy/images/beaglebone/bbb-image-beaglebone.wic of=${dev} status=progress && sync
	sudo eject ${dev}


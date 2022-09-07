cwd = $(shell pwd)
docker_user = yocto

.PHONY: build run

build:
	docker build --build-arg username=${docker_user} . -t bbb:latest

run:
	mkdir -p ${cwd}/downloads
	@mkdir -p ${cwd}/sstate
	docker run --rm \
		-v ${cwd}/sstate:/home/${docker_user}/sstate \
        -v ${cwd}/downloads:/home/${docker_user}/downloads \
        -it --user=${UID} bbb:latest


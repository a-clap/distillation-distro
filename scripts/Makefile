cwd = $(shell pwd)

.PHONY: build

build:
	bitbake bbb-image

clean:
	@bitbake world -c mrproper
	@rm -rf cache/ tmp/ bitbake*




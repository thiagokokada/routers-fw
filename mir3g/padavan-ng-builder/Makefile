.PHONY: all build-image build-firmare clean shell

IMAGE := padavan-builder

all: build-image build-firmware

build-image:
	docker build -t $(IMAGE) .

build-firmware:
	mkdir -p images
	docker run -ti -v "${PWD}/images:/opt/padavan-ng/trunk/images" $(IMAGE):latest ./build_firmware.sh

clean:
	docker rmi -f $(IMAGE)
	rm -rf images

shell:
	docker run -ti -v "${PWD}/images:/opt/padavan-ng/trunk/images" $(IMAGE):latest bash

release:
	tar czfv images-$(shell date +"%Y-%m-%d").tar.gz images

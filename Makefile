.PHONY: all echo build tag push run

DOCKER_USER=sleepyfox
IMAGE=ubuntu-dev
VERSION=20.04-2
UID=`id -u`
GID=`id -g`
OS_USER=`whoami`

all: build tag push

echo:
	@ echo "DOCKER_USER set to $(DOCKER_USER)"
	@ echo "IMAGE set to $(IMAGE)"
	@ echo "VERSION set to $(VERSION)"
	@ echo "UID set to $(UID)"
	@ echo "GID set to $(GID)"
	@ echo "OS_USER set to $(OS_USER)"

build:
	docker build \
	--build-arg USER=$(OS_USER) \
	--build-arg UID=$(UID) \
	--build-arg GID=$(GID) \
	-t $(DOCKER_USER)/$(IMAGE):$(VERSION) .

tag:
	docker tag $(DOCKER_USER)/$(IMAGE):$(VERSION) $(DOCKER_USER)/$(IMAGE):latest

push:
	docker push $(DOCKER_USER)/$(IMAGE):$(VERSION)
	docker push $(DOCKER_USER)/$(IMAGE):latest

run:
	docker run -it \
	-v `pwd`:/var/app \
	$(DOCKER_USER)/$(IMAGE):$(VERSION) \
	bash

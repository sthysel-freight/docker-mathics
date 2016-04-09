.PHONY: all build testrun push

all: build

Dockerfile: Dockerfile.in
	cp $< $@
	sed -i "s/__GID__/$$(id -g)/g" $@
	sed -i "s/__UID__/$$(id -u)/g" $@

build: Dockerfile
	docker build -t sthysel/mathics .

shell: build
	docker run -it --rm -v ${PWD}:/work sthysel/mathics bash

testrun:
	docker run -it --rm -v ${PWD}:/work sthysel/mathics

push:
	docker push sthysel/mathics


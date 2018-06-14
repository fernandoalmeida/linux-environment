TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(basename $(shell ls -p install | egrep -v /$))
ARCH := $(shell find install/arch -name *.sh | cut -f 2,3 -d / | cut -f 1 -d .)
.DEFAULT_GOAL := install

# dependencies mapping
git: bash
ruby: bash utils git
emacs: bash utils git
mongodb: utils
postgresql: utils
rabbitmq: utils
docker: utils
redis: utils
aws: python
awesome: bash xscreensaver
virtualbox: debian_repo
vagrant: debian_repo
java: bash
orientdb: java
irpf: java
lxc: cgroups
kubernetes: virtualbox
ansible: python
percol: python
android: java
react-native: nodejs android

# implicit rules mapped to installation scripts
arch/node: arch/nvm
$(ARCH):
	install/$@.sh
	@touch $(TMP)/$@

install: $(SCRIPTS)
$(SCRIPTS):
	./install/$@.sh
	@touch $(TMP)/$@

# Docker rules (helpers)
build:
	docker build --rm=false -t fernando/linuxenv .

run:
	docker run -it fernando/linuxenv /bin/bash

clean:
	@rm -fr $(TMP)/*[!.gitkeep]

.PHONY: install build run clean

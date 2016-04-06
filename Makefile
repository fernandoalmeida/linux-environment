TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(basename $(shell ls -p install | egrep -v /$))
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
vagrant: debian_repo virtualbox
java: bash
orientdb: java

# implicit rules mapped to installation scripts
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

TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(basename $(shell ls install))
.DEFAULT_GOAL := install

# prerequisites mapping
git: bash
ruby: bash utils git
emacs: bash utils git ruby
mongodb: utils
postgresql: utils
rabbitmq: utils
docker: utils

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

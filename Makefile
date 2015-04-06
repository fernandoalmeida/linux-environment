TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(shell ls install)

install: $(SCRIPTS)

$(SCRIPTS):
	. install/$@
	@touch $(TMP)/$@

ruby: git

build:
	docker build --rm=false -t fernando/linuxenv .

run:
	docker run -it fernando/linuxenv /bin/bash

clean:
	@rm -fr $(TMP)/*[!.gitkeep]

.PHONY: clean install

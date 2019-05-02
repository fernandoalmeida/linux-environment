TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(basename $(shell ls -p install | egrep -v /$))
ARCH := $(shell find install/arch -name *.sh | cut -f 2,3 -d / | cut -f 1 -d .)
DEBIAN := $(shell find install/debian -name *.sh | cut -f 2,3 -d / | cut -f 1 -d .)
.DEFAULT_GOAL := install

# dependencies mapping
debian/git: debian/bash
ruby: debian/bash utils debian/git
emacs: debian/bash utils debian/git
mongodb: utils
postgresql: utils
rabbitmq: utils
docker: utils
redis: utils
aws: python
awesome: debian/bash xscreensaver
virtualbox: debian_repo
vagrant: debian_repo
java: debian/bash
orientdb: java
irpf: java
lxc: cgroups
kubernetes: virtualbox
ansible: python
percol: python
android: java
react-native: nodejs android

# implicit rules mapped to installation scripts
arch/awesome: arch/bash arch/lua arch/imagemagick arch/rofi
arch/bash: arch/aura
arch/dropbox: arch/wget
arch/elixir: arch/erlang
arch/emacs: arch/bash arch/git arch/ag arch/aspell
arch/node: arch/nvm
arch/nvm: arch/aura
arch/pytorch: arch/python
arch/rescuetime: arch/aura
arch/slack: arch/aura
arch/skype: arch/aura
arch/toggl: arch/aura
arch/wakatime: arch/bash arch/python

$(ARCH):
	install/$@.sh
	@touch $(TMP)/$@

$(DEBIAN):
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

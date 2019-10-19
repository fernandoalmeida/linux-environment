TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(basename $(shell ls -p install | egrep -v /$))
ARCH := $(shell find install/arch -name *.sh | cut -f 2,3 -d / | cut -f 1 -d .)
DEBIAN := $(shell find install/debian -name *.sh | cut -f 2,3 -d / | cut -f 1 -d .)
.DEFAULT_GOAL := install

# dependencies mapping
debian/git: debian/bash
debian/ruby: debian/bash debian/utils debian/git
debian/emacs: debian/bash debian/utils debian/git
debian/mongodb: debian/utils
debian/postgresql: debian/utils
debian/rabbitmq: debian/utils
debian/docker: debian/utils
debian/redis: debian/utils
debian/aws: debian/python
debian/awesome: debian/bash xscreensaver
debian/virtualbox: debian/debian_repo
debian/vagrant: debian/debian_repo
debian/java: debian/bash
debian/orientdb: debian/java
debian/irpf: debian/java
debian/lxc: debian/cgroups
debian/kubernetes: debian/virtualbox
debian/ansible: debian/python
debian/percol: debian/python
debian/android: debian/java
debian/react-native: debian/nodejs debian/android

# implicit rules mapped to installation scripts
arch/android: arch/aura
arch/awesome: arch/bash arch/lua arch/imagemagick arch/rofi
arch/bash: arch/aura
arch/dropbox: arch/wget
arch/elixir: arch/erlang
arch/emacs: arch/bash arch/git arch/ag arch/aspell
arch/kubernetes: arch/aura arch/virtualbox
arch/exercism: arch/aura
arch/node: arch/nvm
arch/nvm: arch/aura
arch/pytorch: arch/python
arch/rbenv: arch/aura
arch/rescuetime: arch/aura
arch/slack: arch/aura
arch/skype: arch/aura
arch/toggl: arch/aura
arch/wakatime: arch/bash arch/python
arch/flutter: arch/bash arch/curl arch/git arch/zip arch/xz arch/glu arch/android
arch/xmind: arch/aura

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

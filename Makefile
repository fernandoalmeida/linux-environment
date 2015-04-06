TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(shell ls install)

install: $(SCRIPTS)

$(SCRIPTS):
	. install/$@
	@touch $(TMP)/$@

clean:
	@rm -fr $(TMP)/*[!.gitkeep]

.PHONY: clean install

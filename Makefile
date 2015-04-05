TMP := tmp
VPATH := $(TMP)
SCRIPTS := $(shell ls install)

all: $(SCRIPTS)

$(SCRIPTS):
	. install/$@
	@touch $(TMP)/$@

clean:
	@rm -fr $(TMP)/*[!.gitkeep]

.PHONY: clean all

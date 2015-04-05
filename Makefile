TMP := tmp
VPATH := $(TMP)

%:
	./install/$@.sh
	@touch $(TMP)/$@

clean:
	@rm -fr $(TMP)/*[!.gitkeep]

.PHONY: clean

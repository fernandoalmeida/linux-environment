TMP := tmp

%:
	./install/$@.sh

clean:
	@rm -fr $(TMP)/*[!.gitkeep]

.PHONY: clean

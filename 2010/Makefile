symlinks := $(abspath $(addprefix ../.,$(filter-out Makefile,$(wildcard *))))

.PHONY: all
all:
	@echo "make install    -  installs symlinks one level up"
	@echo "make uninstall  -  removes dot files one level up"
	@echo "make update     -  updates git repository"

.PHONY: install
install: $(symlinks)

.PHONY: uninstall
uninstall:
	rm -iR $(symlinks)

.PHONY: update
update:
	git pull origin master
	git submodule init
	git submodule update

$(symlinks): $(abspath ../.%): $(abspath %)
	ln -is $< $@

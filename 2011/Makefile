symlinks := $(addprefix ../.,$(filter-out Makefile,$(wildcard *)))

.PHONY: all
all:
	@echo "make install    -  create symlinks"
	@echo "make uninstall  -  remove symlinks"
	@echo "make update     -  update repository"

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

$(symlinks): ../.%: %
	ln -is .dotfiles/$< $@

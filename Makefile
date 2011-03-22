PREFIX ?= /usr/local

install:
	@echo "Installing to $(PREFIX)/bin"
	@mkdir -p $(PREFIX)/bin
	@cp -f bin/git-freeze $(PREFIX)/bin

uninstall:
	@echo "Uninstalling from $(PREFIX)/bin"
	@rm -f $(PREFIX)/bin

.PHONY: install uninstall

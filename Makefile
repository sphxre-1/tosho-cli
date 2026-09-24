PREFIX ?= /usr/local

.PHONY: install uninstall

install:
	install -Dm755 tosho-cli $(DESTDIR)$(PREFIX)/bin/tosho-cli

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/tosho-cli

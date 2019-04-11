prefix ?= /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libdir = $(exec_prefix)/lib
includedir = $(prefix)/include

all: factorial

factorial.o: factorial.c
	$(CC) -c -Wall -Werror -fpic $< -o $@

libfactorial.so: factorial.o
	$(CC) -shared $< -o $@

factorial: main.c libfactorial.so
	$(CC) -Wall -Werror $< -L . -lfactorial -o $@

clean:
	rm -f factorial factorial.o libfactorial.so

install: all
	install -D -m 0644 "factorial.h" "$(DESTDIR)$(includedir)/factorial.h"
	install -D -m 0644 "libfactorial.so" "$(DESTDIR)$(libdir)/libfactorial.so"
	install -D -m 0755 "factorial" "$(DESTDIR)$(bindir)/factorial"

uninstall:
	rm -f "$(DESTDIR)$(includedir)/factorial.h"
	rm -f "$(DESTDIR)$(libdir)/libfactorial.so"
	rm -f "$(DESTDIR)$(bindir)/factorial"

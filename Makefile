# $Id: Makefile 7 2009-09-17 20:57:49Z karl $
# This file is public domain.  Written originally in 2009 by Karl Berry.

pkg = tex4ht
version = 1.1
relname = $(pkg)-$(version)

dist: $(relname).tar.gz
$(relname).tar.gz: force
	rm -f $@
	tar -czf $@ --owner=0 --group=0 \
	  --transform="s,^,$(relname)/," --exclude-vcs \
	  *
	tar tf $@ | head

force:

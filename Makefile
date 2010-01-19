# $Id: Makefile 7 2009-09-17 20:57:49Z karl $
# This file is public domain.  Written originally 2009, Karl Berry.

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

4ht: tex4ht-4ht.tex
	ht tex tex4ht-4ht

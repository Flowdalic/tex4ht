# $Id: Makefile 7 2009-09-17 20:57:49Z karl $
# This file is public domain.  Written originally 2009, Karl Berry.

pkg = tex4ht
version = 1.1
relname = $(pkg)-$(version)

ctandir = ctan
texmfdir = $(ctandir)/texmf
4htdir = $(texmfdir)/tex/generic/tex4ht
htfontsdir = $(texmfdir)/tex4ht/ht-fonts
docdir = $(texmfdir)/doc/generic/tex4ht
4htfiles = $(wildcard lit/*.4ht) lit/tex4ht.sty
htfontsfiles = lit/tex4ht.dir/texmf/tex4ht/ht-fonts/*
docfiles = $(wildcard doc/mn/*.html) $(wildcard doc/mn/*.css) $(wildcard doc/mn/*.tex)

.PHONY: ctan

dist: $(relname).tar.gz
$(relname).tar.gz: force
	rm -f $@
	tar -czf $@ --owner=0 --group=0 \
	  --transform="s,^,$(relname)/," --exclude-vcs \
	  *
	tar tf $@ | head
# * won't really work, just a placeholder.

force:

ctan:
	@rm -rf  $(ctan)
	@mkdir -p $(4htdir) $(htfontsdir) $(docdir)
	@cp $(4htfiles) $(4htdir)
	@cp -r $(htfontsfiles) $(htfontsdir)
	@cp $(docfiles) $(docdir)
	cd $(ctandir) && zip -r tex4ht-ctan.zip texmf


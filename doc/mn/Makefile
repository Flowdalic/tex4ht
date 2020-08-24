# $Id$
# Makefile for original tex4ht ("mn") documentation. Public domain.

# karl's environment to get latest released files ...
tldev_cmd := $(shell $(path) which tldev 2>/dev/null)
ifdef tldev_cmd
  dev = tldev
else
  dev =
endif

tex = $(dev) etex -interaction=nonstopmode -file-line-error
bld: clean
#	chmod -R a+rwX .  # as received from OSU
	$(tex) mn && $(tex) mn && $(tex) mn
	$(dev) tex4ht mn </dev/null
	$(dev) t4ht mn </dev/null # needs mk4ht.4ht, symlink in svn
	rm -f *.zip               # nothing to do with .zip
# A tremendous number of unnecessary and failing commands are run,
# but the output seems more or less ok.

inst_dir = /r/tug/home/texlive/karl/Master/texmf-dist/doc/generic/tex4ht
# look for "Only in /..." for files in TL now that should be removed.
dif:
	diff -u0 $(inst_dir) . | grep -v '<small>Generated '

# have to add new files by hand.
install:
	cp -p `(cd $(inst_dir) && \ls)` $(inst_dir)
	svn status $(inst_dir)

clean:
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f *.4es *.bat *.unix *.htf *.png *.fls tmp
	rm -f m*.html bugfixes.html # not index.html

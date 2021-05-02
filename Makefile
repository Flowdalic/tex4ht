# $Id: Makefile 7 2009-09-17 20:57:49Z karl $
# This file is public domain.  Written originally 2009, Karl Berry.

# These commands diff and install the doc and source files from
# development to a TeX Live repository. CTAN mirrors them from TL.

tl-diff: tl-diff-doc tl-diff-src
tl-diff-doc:
	cd doc/mn && $(MAKE) diff-doc
tl-diff-src:
	cd lit && $(MAKE) diff-source

tl-install: tl-install-doc tl-install-src
tl-install-doc:
	cd doc/mn && $(MAKE) install-doc
tl-install-src:
	cd lit && $(MAKE) install-src

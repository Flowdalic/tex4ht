# $Id$
# This file is public domain.  Originally written 2010, Karl Berry.

wd = work.dir

common = tex4ht-cpright.tex common.tex
derived =

derived += $(tex4ht_xhtmml_xtpipes_derived)
tex4ht_xhtmml_xtpipes_derived = \
  xhtmml.4xt \
  XhtmmlUtilities.java \

# wripro.tex generates nothing (not literate).

derived += $(xtpipes_derived)
xtpipes_derived = \
  $(wd)/xtpipes.java \
  $(wd)/xtpipes/FileInfo.java \
  $(wd)/xtpipes/InputObject.java \
  $(wd)/xtpipes/Xtpipes.java \
  $(wd)/xtpipes/XtpipesPrintWriter.java \
  $(wd)/xtpipes/XtpipesUni.java \
  $(wd)/xtpipes/util/ScriptsManager.java \
  $(wd)/xtpipes/util/ScriptsManagerLH.java \
  xtpipes-default.4xt \
  xtpipes-map.dtd \
  xtpipes.dtd \

default all: $(derived)

$(tex4ht_xhtmml_xtpipes_derived): tex4ht-xhtmml-xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"

$(xtpipes_derived): xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"
# Derived files are generated in . and $(wd).
# (corresponds to src/java for xtpipes.tex)

destdir = ..
update:
	$(update) XhtmmlUtilities.java $(destdir)/src/java/
	$(update) xhtmml.4xt $(destdir)/texmf/tex4ht/xtpipes/
	rmdir $(wd)/bin
	$(update) $(wd)/* $(destdir)/src/java/
	$(update) xtpipes.dtd xtpipes-map.dtd xtpipes-default.4xt \
	  $(destdir)/texmf/tex4ht/xtpipes/

clean: mostlyclean
	rm -rf $(wd)
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f *.html

mostlyclean:
	rm -f $(derived)

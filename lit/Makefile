# $Id$
# Public domain.  Originally written 2010, Karl Berry.

wd = work.dir

# wripro.tex generates nothing (not literate).

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

$(xtpipes_derived): xtpipes.tex tex4ht-cpright.tex common.tex
	htlatex xtpipes "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"
# Derived files are generated in . and $(wd).
# (corresponds to src/java for xtpipes.tex)

destdir = ..
update:
	rmdir $(wd)/bin
	$(update) -r $(wd)/* $(destdir)/src/java/
	$(update) -r xtpipes.dtd xtpipes-map.dtd xtpipes-default.4xt \
	  $(destdir)/texmf/tex4ht/xtpipes/

clean:
	rm -rf $(wd)
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f xtpipes*html $(xtpipes_derived)

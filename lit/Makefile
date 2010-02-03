# Public domain.  Originally written 2010, Karl Berry.
wd = work.dir

xtpipes_derived = \
  $(wd)/xtpipes/Xtpipes.java \
  $(wd)/xtpipes/XtpipesPrintWriter.java \
  $(wd)/xtpipes.java \
  xtpipes.dtd \
  xtpipes-map.dtd \
  $(wd)/xtpipes/FileInfo.java \
  $(wd)/xtpipes/InputObject.java \
  $(wd)/xtpipes/XtpipesUni.java \
  xtpipes-default.4xt \
  $(wd)/xtpipes/util/ScriptsManager.java \
  $(wd)/xtpipes/util/ScriptsManagerLH.java \

$(xtpipes_derived): xtpipes.tex tex4ht-cpright.tex
	htlatex xtpipes "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"
# Derived files are generated in . and $(wd).
# (corresponds to src/java for xtpipes.tex)

clean:
	rm -rf $(wd)
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f xtpipes*html $(xtpipes_derived)

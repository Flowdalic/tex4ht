# $Id$
# This file is public domain.  Originally written 2010, Karl Berry.

wd = work.dir

default: all

common = tex4ht-cpright.tex common.tex
derived =

derived += $(tex4ht_ooffice_derived)
tex4ht_ooffice_derived = ooffice.4ht ooffice-mml.4ht

derived += $(tex4ht_ooimpress_derived)
tex4ht_ooimpress_derived = ooimpress.4ht

derived += $(tex4ht_options_derived)
tex4ht_options_derived = tex4ht.4ht

derived += $(tex4ht_svg_derived)
tex4ht_svg_derived = svg.4ht html4-svg.4ht

derived += $(tex4ht_t4ht_derived)
tex4ht_t4ht_derived = t4ht.c

derived += $(tex4ht_tei_derived)
tex4ht_tei_derived = tei.4ht tei-mml.4ht tei-math.4ht tei-mmltei.4ht

derived += $(tex4ht_unicode_derived)
tex4ht_unicode_derived = unicode.4ht

derived += $(tex4ht_word_derived)
tex4ht_word_derived = htmlw.4ht

derived += $(tex4ht_xhtml_xtpipes_derived)
tex4ht_xhtml_xtpipes_derived = xhtml.4xt XhtmlEmails.java

derived += $(tex4ht_xhtmml_xtpipes_derived)
tex4ht_xhtmml_xtpipes_derived = xhtmml.4xt XhtmmlUtilities.java

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

# 
all: $(derived)

$(tex4ht_ooffice_derived): tex4ht-ooffice.tex $(common)
	htlatex $< "xhtml,4,sections+" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_ooimpress_derived): tex4ht-ooimpress.tex $(common)
	htlatex $< "xhtml,4,sections+" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_options_derived): tex4ht-options.tex $(common)
	mk4ht xhlatex $<

$(tex4ht_sty_derived): tex4ht-sty.tex $(common)
	ht tex $<

$(tex4ht_svg_derived): tex4ht-svg.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_t4ht_derived): tex4ht-t4ht.tex $(common)
	ht tex $<

$(tex4ht_tei_derived): tex4ht-tei.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_unicode_derived): tex4ht-unicode.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_word_derived): tex4ht-word.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_xhtml_xtpipes_derived): tex4ht-xhtml-xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_xhtmml_xtpipes_derived): tex4ht-xhtmml-xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"

$(xtpipes_derived): xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "-d./" "-interaction=nonstopmode"
# Derived files are generated in . and $(wd).
# (corresponds to src/java for xtpipes.tex)

# 
destdir = ..
texmf_dest = $(destdir)/texmf/tex/generic/tex4ht
update = cp -pr
update: all
	$(update) $(tex4ht_ooffice_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_ooimpress_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_options_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_sty_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_svg_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_t4ht_derived) $(destdir)/src/
#
	$(update) $(tex4ht_tei_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_unicode_derived) $(texmf_dest)/
#
	$(update) $(tex4ht_word_derived) $(texmf_dest)/
#
	$(update) XhtmlEmails.java $(destdir)/src/java/
	$(update) xhtml.4xt $(destdir)/texmf/tex4ht/xtpipes/
#
	$(update) XhtmmlUtilities.java $(destdir)/src/java/
	$(update) xhtmml.4xt $(destdir)/texmf/tex4ht/xtpipes/
# this has to be done last. And does anything else use $(wd)? We'll see.
	rmdir $(wd)/bin
	$(update) $(wd)/* $(destdir)/src/java/
	$(update) xtpipes.dtd xtpipes-map.dtd xtpipes-default.4xt \
	  $(destdir)/texmf/tex4ht/xtpipes/

clean: mostlyclean
	rm -rf $(wd)
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f *.html *.png

mostlyclean:
	rm -f $(derived)

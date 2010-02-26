# $Id$
# This file is public domain.  Originally written 2010, Karl Berry.

wd = work.dir

default: all

common = tex4ht-cpright.tex common.tex common-code.tex
common_info = $(common) common-info.tex
derived = 

derived += $(tex4ht_info_mml_derived)
tex4ht_info_mml_derived = infomml.4ht

derived += $(tex4ht_info_ooffice_derived)
tex4ht_info_ooffice_derived = infoof.4ht

derived += $(tex4ht_info_svg_derived)
tex4ht_info_svg_derived = infosvg.4ht

#derived += $(tex4ht_info_derived)
#tex4ht_info_derived = info4ht.4ht

derived += $(tex4ht_javahelp_xtpipes_derived)
tex4ht_javahelp_xtpipes_derived = javahelp.4xt

derived += $(tex4ht_javahelp_derived)
tex4ht_javahelp_derived = javahelp.4ht javahelp-a.4ht

derived += $(tex4ht_jsmath_derived)
tex4ht_jsmath_derived = jsmath.4ht html-jsmath.4ht

derived += $(tex4ht_jsml_xtpipes_derived)
tex4ht_jsml_xtpipes_derived = \
  jsml.4xt \
  HtJsml.java GroupMn.java JsmlFilter.java JsmlMathBreak.java

derived += $(tex4ht_jsml_derived)
tex4ht_jsml_derived = jsml.4ht jsml-math.4ht

derived += $(tex4ht_mathltx_derived)
tex4ht_mathltx_derived = mathltx.4ht html-mltx.4ht

derived += $(tex4ht_mathplayer_derived)
tex4ht_mathplayer_derived = mathplayer.4ht

derived += $(tex4ht_mkht_derived)
tex4ht_mkht_derived = mkht.4ht mk4ht.perl mkht-scripts.4ht

derived += $(tex4ht_moz_derived)
tex4ht_moz_derived = mozilla.4ht

derived += $(tex4ht_oo_xtpipes_derived)
tex4ht_oo_xtpipes_derived = \
   oo-math.4xt oo-text.4xt \
   OoUtilities.java OomFilter.java OoFilter.java

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

$(tex4ht_info_mml_derived): tex4ht-info-mml.tex $(common_info)
	htlatex $< "html,sections+" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_info_ooffice_derived): tex4ht-info-ooffice.tex $(common_info)
	htlatex $< "html,sections+" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_info_svg_derived): tex4ht-info-svg.tex $(common_info)
	htlatex $< "html,sections+" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_info_derived): tex4ht-info.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_javahelp_xtpipes_derived): tex4ht-javahelp-xtpipes.tex $(common)
	htlatex $< "xhtml,next,3" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_javahelp_derived): tex4ht-javahelp.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_jsmath_derived): tex4ht-jsmath.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_jsml_xtpipes_derived): tex4ht-jsml-xtpipes.tex $(common)
	htlatex $< "xhtml,next,3" "" "-d./" "-interaction=nonstopmode"

$(tex4ht_jsml_derived): tex4ht-jsml.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_mathltx_derived): tex4ht-mathltx.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_mathplayer_derived): tex4ht-mathplayer.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_mkht_derived): tex4ht-mkht.tex $(common)
	latex -interaction=nonstopmode $<
	perl -c mk4ht.perl  # syntax check
	latex -interaction=nonstopmode mkht-scripts.4ht

$(tex4ht_moz_derived): tex4ht-moz.tex $(common)
	mk4ht xhlatex $< "html,3,sections+"

$(tex4ht_oo_xtpipes_derived): tex4ht-oo-xtpipes.tex $(common)
	htlatex $< "xhtml,next,3" "" "-d./" "-interaction=nonstopmode"

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
dest_texmf = $(destdir)/texmf/tex/generic/tex4ht
dest_xtpipes = $(destdir)/texmf/tex4ht/xtpipes
dest_java = $(destdir)/src/java
update = cp -pr
#
update: all
	$(update) $(tex4ht_info_mml_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_ooffice_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_svg_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_javahelp_xtpipes_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_javahelp_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_jsmath_derived) $(dest_texmf)/
#
	$(update) jsml.4xt $(dest_xtpipes)/
	$(update) HtJsml.java GroupMn.java JsmlFilter.java \
	          JsmlMathBreak.java $(dest_java)/
#
	$(update) $(tex4ht_jsml_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_mathltx_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_mathplayer_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_moz_derived) $(dest_texmf)/
#
	$(update) oo-text.4xt oo-math.4xt $(dest_xtpipes)/
	$(update) OoUtilities.java OomFilter.java $(dest_java)/
#
	$(update) $(tex4ht_ooffice_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_ooimpress_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_options_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_sty_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_svg_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_t4ht_derived) $(destdir)/src/
#
	$(update) $(tex4ht_tei_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_unicode_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_word_derived) $(dest_texmf)/
#
	$(update) xhtml.4xt $(dest_xtpipes)/
	$(update) XhtmlEmails.java $(dest_java)/
#
	$(update) xhtmml.4xt $(dest_xtpipes)/
	$(update) XhtmmlUtilities.java $(dest_java)/
#
# this has to be done last. Does anything else use $(wd)? We'll see.
	rmdir $(wd)/bin
	$(update) $(wd)/* $(dest_java)/
	$(update) xtpipes.dtd xtpipes-map.dtd xtpipes-default.4xt 
	  $(dest_xtpipes)/

clean: mostlyclean
	rm -rf $(wd)
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f *.html *.png

mostlyclean:
	rm -f $(derived)

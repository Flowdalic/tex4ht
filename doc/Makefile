# $Id$
# This file is public domain.  Originally written 2010, Karl Berry.

pdflatex = pdflatex -interaction=nonstopmode -file-line-error

tex4ht.pdf: tex4ht.tex cvrblog.sty *.tex
	$(pdflatex) $<

# texinfo attempt.
#texi2pdf = texi2pdf
##
#makeinfo = makeinfo
#texi2html = $(makeinfo) --html --no-split
#texi2info = $(makeinfo) --no-split
#texi2txt = $(makeinfo) --plaintext --no-split -o $@
#
#all: tex4ht.info tex4ht.pdf tex4ht.html tex4ht.txt
#
#tex4ht.html: tex4ht.texi
#	$(texi2html) $<
#
#tex4ht.info: tex4ht.texi
#	$(texi2info) $<
#
#tex4ht.pdf: tex4ht.texi
#	$(texi2pdf) $<
#
#tex4ht.txt: tex4ht.texi
#	$(texi2txt) $<

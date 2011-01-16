#
# Makefile to generate pdf and html
#

 file=tex4ht-process
 file=tex4ht-mathml
 file=tex4ht-configure1
 file=tex4ht-configure2
 file=tex4ht


pdf:
	pdflatex $(file)

view:
	xpdf $(file).pdf

html:
	./htlatex $(file) wp-blog

vhtml:
	firefox $(file).html

tidy:
	tidy -w 10000000 $(file).html > one.html

mode = draft
engine = 

ifeq (lualatex, lualatex)
	engine = -l
endif

ifeq (lualatex, xelatex)
	engine = -x
endif
	
all: tex4ht-doc.pdf tex4ht-doc.html

.PHONY: final

tex4ht-doc.pdf: tex4ht-doc.tex
	lualatex tex4ht-doc.tex

tex4ht-doc.html: tex4ht-doc.tex config.cfg
	make4ht -um $(mode) -c config $(engine) -e build.mk4  tex4ht-doc.tex

# use only one LaTeX run by default, request three compilations with final rule
final: mode=final
final: tex4ht-doc.html

clean:
	rm *.html *.aux *.4tc *.4ct *.toc *.xref 

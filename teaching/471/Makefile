################################################################################
#
#
#                          GENERATING HTML FROM LATEX
#
#
################################################################################

##################################################################################################
#


SOURCES = $(wildcard *.tex)

all: all_html all_pdf

all_html: $(SOURCES:.tex=.tex.html)

all_pdf: $(SOURCES:.tex=.pdf)

%.tex.html: %.tex
	touch $@
	rm $@
	cat class_header $^ class_footer > $@
	
%.pdf: %.tex
	pdflatex $^
	


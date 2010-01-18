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
	

install: 
	git pull	
	-git commit -a -m "updating to gosset."
	git push
	ssh go "cd public_html;git pull"
	ssh go "cd public_html/teaching/433/;make"
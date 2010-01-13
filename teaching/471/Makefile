################################################################################
#
#
#                          GENERATING OUTPUT from Rnw 
#
#
################################################################################


SOURCES = $(wildcard *.Rnw)

all: all_html all_pdf

all_html: $(SOURCES:.Rnw=.tex.html)

all_pdf: $(SOURCES:.Rnw=.pdf)

%.tex: %.Rnw
	R CMD Sweave $^

%.tex.html: %.tex
	touch $@
	rm $@
	cat class_header $^ class_footer > $@
	
%.pdf: %.tex
	pdflatex $^
	

install: all
	git pull	
	-git commit -a -m "updating to gosset."
	git push
	ssh go "cd public_html;git pull"
#	scp -p class_*.pdf go:public_html/teaching/471/
#	scp -p *.tex.html go:public_html/teaching/471/
	ssh go "cd public_html/teaching/471/;make"



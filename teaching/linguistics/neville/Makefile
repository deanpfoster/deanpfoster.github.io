################################################################################
#
#
#                          GENERATING OUTPUT from Rnw 
#
#
################################################################################

target: production.pdf

SOURCES = $(wildcard *.Rnw)

all: all_html all_pdf all_R CCA_talk_slides.pdf

all_html: $(SOURCES:.Rnw=.tex.html)

all_pdf: $(SOURCES:.Rnw=.pdf)

all_R: $(SOURCES:.Rnw=.R)

%.tex: %.Rnw
	R CMD Sweave $^

%.R: %.Rnw
	R CMD Stangle $^

%.tex.html: %.tex
	touch $@
	rm $@
	cat class_header $^ class_footer | sed "s/section\*/section/" > $@

%.pdf: %.tex
	pdflatex $^
	/bin/cp $@ Adobe\ Reader/

install: all
	git pull	
	-git commit -a -m "updating to gosset."
	git push
	ssh go "cd public_html;git pull"
#	scp -p class_*.pdf go:public_html/teaching/471/
#	scp -p *.tex.html go:public_html/teaching/471/
	ssh go "cd public_html/teaching/linguistics/;make"



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

all_pdf: $(SOURCES:.tex=.pdf)

%.tex.html: %.tex
	touch $@
	rm $@
	cat class_header $^ class_footer > $@

%.tex: %.Rnw
	R CMD Sweave $^

%.pdf: %.tex
	pdflatex $^

install: all
	git commit -a -m "updating to gosset."
	ssh go "cd public_html;git pull;cd teaching/510/;make"

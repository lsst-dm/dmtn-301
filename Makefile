DOCTYPE = DMTN
DOCNUMBER = 301
DOCNAME = C702

tex = $(filter-out $(wildcard *acronyms.tex) , $(wildcard *.tex))

GITVERSION := $(shell git log -1 --date=short --pretty=%h)
GITDATE := $(shell git log -1 --date=short --pretty=%ad)
GITSTATUS := $(shell git status --porcelain)
ifneq "$(GITSTATUS)" ""
	GITDIRTY = -dirty
endif

export TEXMFHOME ?= lsst-texmf/texmf

#asp tex is a bit odd so latexmk fails ..
$(DOCNAME).pdf: $(tex) meta.tex C702.bib authors.tex acronyms.tex
	pdflatex $(DOCNAME)
	bibtex $(DOCNAME)
	pdflatex $(DOCNAME)
	pdflatex $(DOCNAME)

# Acronym tool allows for selection of acronyms based on tags - you may want more than DM
acronyms.tex: $(tex) myacronyms.txt
	$(TEXMFHOME)/../bin/generateAcronyms.py -t "DM" $(tex)

authors.tex:  authors.yaml
	python3 $(TEXMFHOME)/../bin/db2authors.py --mode adass > authors.tex

.PHONY: clean
clean:
	latexmk -c
	rm -f $(DOCNAME).bbl
	rm -f $(DOCNAME).pdf
	rm -f meta.tex
	rm -f authors.tex

.FORCE:

meta.tex: Makefile .FORCE
	rm -f $@
	touch $@
	echo '% GENERATED FILE -- edit this in the Makefile' >>$@
	/bin/echo '\newcommand{\lsstDocType}{$(DOCTYPE)}' >>$@
	/bin/echo '\newcommand{\lsstDocNum}{$(DOCNUMBER)}' >>$@
	/bin/echo '\newcommand{\vcsRevision}{$(GITVERSION)$(GITDIRTY)}' >>$@
	/bin/echo '\newcommand{\vcsDate}{$(GITDATE)}' >>$@

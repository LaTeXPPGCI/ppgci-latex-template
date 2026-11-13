LATEX = pdflatex --interaction=batchmode
BIBTEX = biber
RM = rm -f
FILE = exemplo_dissertacao

all:	
	$(LATEX) $(FILE)
	$(BIBTEX) $(FILE)
	$(LATEX) $(FILE)
	$(LATEX) $(FILE)
	@echo ---------------------------------------------------
	@echo Ps: done.

clean:	
	$(RM) $(FILE).aux $(FILE).log $(FILE).out $(FILE).toc $(FILE).bbl $(FILE).blg $(FILE).bcf $(FILE).run.xml
	@echo ---------------------------------------------------
	@echo Directory cleaned

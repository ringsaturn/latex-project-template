all: main html docx clean

main:
	xelatex main.tex
	xelatex main.tex
	bibtex main
	xelatex main.tex

html:
	pandoc \
		--filter pandoc-citeproc \
		--bibliography=Bibliography.bib \
		--csl=iso690-numeric-cs.csl \
		--standalone \
		main.tex -o main.html

docx:
	pandoc \
		--filter pandoc-citeproc \
		--bibliography=Bibliography.bib \
		--csl=iso690-numeric-cs.csl \
		--standalone \
		main.tex -o main.docx

clean:
	rm -f *.aux *.bbl *.blg *.log *.lot *.toc *.out *.lof *.nav *.snm
	find . | grep -E "(./*.aux$)" | xargs rm -rf
paper:
	rubber -d paper.tex

appendix:
	rubber -d appendix_main.tex

all: paper appendix

clean:
	rubber -d --clean paper.tex
	rubber -d --clean appendix_main.tex

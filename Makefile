paper:
	rubber -d paper.tex

appendix:
	rubber -d appendix.tex

all: paper appendix

clean:
	rubber -d --clean paper.tex
	rubber -d --clean appendix.tex

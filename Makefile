P       := hw2_2
SHELL               = /bin/bash

ALL_SRC := $(wildcard *.sp)
ALL_PS  := $(wildcard *.ps)

default: pdf

#prevent confusion with any file named "clean"
#the dash "-" prevents rm from erroring out with file not found
.PHONY	: clean pdf
clean: 
	-rm -rf *.ps *.pdf

#%.pdf: %.ps
#	ps2pdf -dOptimize=true $^ graph_$@

#%.pdf: $(P).ps $(P).sp
%.ps: %.sp
	ngspice $^

pdf: $(P).ps $(P).sp
	ps2pdf -dOptimize=true $(P).ps $(P)_graph.pdf
	a2ps -R --define=user.name:"Will Kuhn"  --borders=0 -P pdf $(P).sp

pdf2:
	ps2pdf -dOptimize=true $^ $@
	a2ps -R --define=user.name:"Will Kuhn"  --borders=0 -P pdf 
	#a2ps -R --define=user.name:"Will Kuhn"  --borders=0 -P pdf main.c

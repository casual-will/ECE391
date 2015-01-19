SHELL               = /bin/bash


#prevent confusion with any file named "clean"
#the dash "-" prevents rm from erroring out with file not found
.PHONY	: clean pdf
clean: 
	-rm -rf *.ps

pdf:
	a2ps -R --define=user.name:"Will Kuhn"  --borders=0 -P pdf main.c

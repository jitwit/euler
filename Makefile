clean :
	find . -name "*~" -exec rm {} \;
	find . -name ".html~" -exec rm {} \;
	find . -name ".tex~" -exec rm {} \;

.PHONY : clean

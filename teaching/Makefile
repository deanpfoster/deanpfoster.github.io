################################################################################
#
#
#                          Push stuff to gosset
#
#
################################################################################

install: 
	git pull	
	-git commit -a -m "updating to gosset."
	git push
	ssh go "cd public_html;git pull"


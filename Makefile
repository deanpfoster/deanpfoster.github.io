
install: 
	git pull	
	-git commit -a -m "updating to gosset."
	git push
	ssh go "cd public_html;git pull;cd mortality;git pull"


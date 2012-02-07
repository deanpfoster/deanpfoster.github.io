
install: 
	git pull	
	-git commit -a -m "updating to gosset."
	-cd mortality; git pull; git commit -a -m "updating to gosset."
	-cd eigenwords; git pull; git commit -a -m "updating to gosset."
	git push
	ssh go "cd public_html;git pull"
	ssh go "cd public_html/mortality;git pull"
	ssh go "cd public_html/eigenwords;git pull"
	ssh go "cd public_html/teaching/471;git pull;make"


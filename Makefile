
install: 
	-cd ~/public_html; git pull; git commit -a -m "Make updating to gosset."
	-cd ~/public_html/mortality; git pull; git commit -a -m "Make updating to gosset."
	-cd ~/public_html/eigenwords; git pull; git commit -a -m "Make updating to gosset."
	-cd ~/public_html/teaching/471;git pull;git commit -a -m "Make updating to gosset.";make
	git push
	ssh go "cd public_html;git pull"
	ssh go "cd public_html/mortality;git pull"
	ssh go "cd public_html/eigenwords;git pull"
	ssh go "cd public_html/teaching/471;git pull;make"


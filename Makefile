default: local

install: local
	ssh gosset "cd public_html;git pull"
	ssh gosset "cd public_html/mortality;git pull"
	ssh gosset "cd public_html/eigenwords;git pull"
	ssh gosset "cd public_html/teaching/471;git pull;make"

local: 
	-cd ~/public_html_gosset             ; git pull; git commit -a -m "Make updating to gosset."; git push
	-cd ~/public_html_gosset/mortality   ; git pull; git commit -a -m "Make updating to gosset."; git push
	-cd ~/public_html_gosset/eigenwords  ; git pull; git commit -a -m "Make updating to gosset."; git push
	-cd ~/public_html_gosset/teaching/471; git pull; git commit -a -m "Make updating to gosset."; git push ;make

gosset: 
	-cd ~/public_html             ; git pull; git commit -a -m "Make updating to gosset."; git push
	-cd ~/public_html/mortality   ; git pull; git commit -a -m "Make updating to gosset."; git push
	-cd ~/public_html/eigenwords  ; git pull; git commit -a -m "Make updating to gosset."; git push
	-cd ~/public_html/teaching/471; git pull; git commit -a -m "Make updating to gosset."; git push ;make


#!/usr/bin/perl
# on www-stat use  #!/usr/local/bin/perl

# The above line states that this is a perl program so that the shell 
# knows what to do with it. It does not end with a semi-colon.

# Comments in perl are denoted by the "#" character.

### Our first perl program.
### Its job is to send back text to the browser.

### It's going to be executed by the server so make sure that it 
### is executable by "all".

### First we print an HTTP header. The header describes the content
### of the page.  The \r\n is a carriage return new line pair.
### It is rather vital to have the blank line in the header.
### We will send back text, but there are headers for images and all sorts.
### Notice that instructions end with a semi-colon.

print "Content-type: text/html\r\n";
print "\r\n";
 

### Now we will print out the HTML document. The print command is 
### quite flexible. This incantation prints everything down to EOF.

print <<EOF;
<HTML>
<HEAD>
<TITLE> Hello friends! </TITLE>
</HEAD>
<BODY>
<H1> Hello cruel world! (YEA!)</H1>
</BODY>
</HTML>
EOF



# open(PIPE,"|cat|");
# doesn't work--see page 431 (chapter 16) of programming perl

use IPC::Open2;
local(*Reader, *Writer);
$pid = open2(\*Reader, \*Writer, "R --vanilla");

print Writer "x <- 5\n";
print Writer "x^2\n";
close(Writer);
while(<Reader>)
{
    print if s/\[[0-9]*\]//;
}
waitpid($pid,0);


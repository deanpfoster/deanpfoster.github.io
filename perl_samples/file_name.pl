$filename = "./tmp/graph_".int(rand(999999)).".jpeg";
open(TMP,">$filename") || die "can't open";
print TMP "Hello file.";
print $filename;

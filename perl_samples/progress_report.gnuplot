#set term gif size 1200,800
#set term canvas mousing size 1200,800
set size .95,.95
#set output "~/progress.html"


set title "AUCTIONS: STREAMING FEATURE SELECTION\n(by Robert Stine and Dean Foster)";
set xlabel "Total number of variables considered";
set ylabel "alpha";
set y2label "Goodness of fit";
set log x 10;
set log y 10;
set tukey x -.15;
set tukey y .04;
set ytics (1e-7, 1e-6, 1e-5, .0001, .001, .01, .1, .5, 1,2,5,10,100);
set ytics add ("z = 1 -------" .316)
set ytics add ("z = 2 -------" .0454)
set ytics add ("z = 3 -------" .0026)
set ytics add ("z = 4 -------" 6.4e-5)
set ytics add ("z = 5 -------" 5.8e-7)
set ytics add ("z = 6 -------" 2e-9)
set ytics add ("z = 7 -------" 2.6e-12)
set ytics add ("z = 8 -------" 1.4e-15)
set ytics add ("z = 9 -------" 2.2e-19)
set ytics add ("z =21 -------" 1e-100)

set xtics (1,2,3,4, 5, 10, 20, 100, 1000, 10000, 1000000, 1e6, 1e7,  1e12, "infinity" 10e300);

# The "front" puts the grid ontop of curves.
#set grid front lc rgb "red"

set key below 

set yrange [*:1]

set y2tics

set datafile separator ","


# 

plot \
    "progress.csv" using 1:29               lc rgb "#FAFAF4" with filledcurves x2 title "" axis x1y2, \
    "progress.csv" using 1:29               lc rgb "#FAFAF4" with filledcurves y2 title "" axis x1y2, \
     "progress.csv" using 1:30 with lines   lc rgb "#FAE0FA" lt 1 lw 4 title "Out of sample error" axis x1y2,\
     "progress.csv" using 1:29  with lines  lc rgb "#E0FAFA" lt 1 lw 4 title "In sample error" axis x1y2,\
\
     "progress.csv" using 1:24 with lines lc rgb "#000000" lw 10  title  "winning bid",\
     "progress.csv" using 1:25 with  points pointsize .2 pt 7 lc rgb "#90D090"  notitle, \
     "progress.csv" using 1:($25 < $24 ? $25 : 1/0) with  points pointsize 2 pt 7 lc rgb "#90D090" title  "p-values", \
     "progress.csv" using 1:4  with lines lc rgb "#000000" title "Total alpha", \
\
     "progress.csv" using 1:($7 > 1e-9 ? $7 : 1/0) with points pointsize .2 pt 7 lc rgb "red"   notitle, \
     "progress.csv" using 1:($7 == $24 ? $7 : 1/0) with  points pointsize .4 pt 7 lc rgb "red" title "X's", \
     "progress.csv" using 1:($10 > 1e-9 ? $10 : 1/0) with points pointsize .2 pt 7 lc rgb "purple"  notitle, \
     "progress.csv" using 1:($10 == $24 ? $10 : 1/0) with  points pointsize .4 pt 7 lc rgb "purple" title "X*X", \
     "progress.csv" using 1:($13 > 1e-9 ? $13 : 1/0) with points pointsize .2 pt 7 lc rgb "purple"  notitle, \
     "progress.csv" using 1:($13 == $24 ? $13 : 1/0) with  points pointsize .4 pt 7 lc rgb "purple" title "X*X (used)", \
     "progress.csv" using 1:($16 > 1e-9 ? $16 : 1/0) with points pointsize .2 pt 7 lc rgb "purple"  notitle, \
     "progress.csv" using 1:($16 == $24 ? $16 : 1/0) with  points pointsize .4 pt 7 lc rgb "purple" title "X*X (skipped)", \
     "progress.csv" using 1:($19 > 1e-9 ? $19 : 1/0) with points pointsize .2 pt 7 lc rgb "blue"   notitle,\
     "progress.csv" using 1:($19 == $24 ? $19 : 1/0) with  points pointsize .4 pt 7 lc  rgb "blue"   title "Poly(X) (skipped)", \
\
     "progress.csv" using 1:30:27 with labels  axis x1y2 notitle


# 1 Round
# 2 Time
# 3 Goodness of Fit
# 4 Total Alpha
# 5, 6, 7, Universal bounded bidder/Columns Expert, Alpha, Current Bid, 
# 8, 9, 10, Universal bounded bidder/Column interactions Expert, Alpha, Current Bid, 
# 11, 12, 13 Universal bidder/Used-feature interactions Expert, Alpha, Current Bid, 
# 14, 15, 16 Universal bidder/Skipped-feature interactions Expert, Alpha, Current Bid,
# 17, 18, 19 Universal bidder/Skipped-feature polynomial Expert, Alpha, Current Bid, 

# 20  Fit bidder [Y_hat_]/Linear Model Expert,
# 21  Alpha, 
# 22  Current Bid, 

# 23 Winning Expert, 
# 24 High Bid
# 25 p-value
# 26 Variable, 
# 27 Outcome, 
# 28 Payoff,
# 29 RSS, 
# 30 CVSS



pause -1

exit

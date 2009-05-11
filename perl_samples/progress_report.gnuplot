#set term gif size 1200,800
set term canvas name 'progress_plot' mousing size 1200,800
set size .95,.95
set output "progress_plot.js"

set title "AUCTIONS: STREAMING FEATURE SELECTION\n(by Robert Stine and Dean Foster)";
set xlabel "Variables considered";
set ylabel "alpha";
set y2label "Goodness of fit";
set log x;
set log y;
set tukey x -.1;
set tukey y .04;
set ytics add (1e-7, 1e-6, 1e-5, .0001, .001, .01, .1, .5, 1,2,5,10,100);
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

set xtics add (1,2,3,4, 5, 10, 20, 100, 1000, 10000, 1000000, 1e6, 1e7,  1e12, "infinity" 10e300);

# The "front" puts the grid ontop of curves.
set grid front lc rgb "red"

set key below 

set yrange [*:1]

set y2tics

set datafile separator ","

plot "log/progress.csv" using 1:3  lc rgb "#FAFAF4" with filledcurves y2 title "" axis x1y2,\
     "log/progress.csv" using 1:3  with lines  lc rgb "#FAE0FA" lt 1 lw 4 title "goodness of fit" axis x1y2,\
     "log/progress.csv" using 1:21 with lines lc rgb "#000000" lw 4  title  "winning bid",\
     "log/progress.csv" using 1:22 with  points pointsize .2 pt 7 lc rgb "grey"  title  "p-values", \
     "log/progress.csv" using 1:($22 < $21 ? $22 : 1/0) with  points pointsize 1 pt 7 lc rgb "grey" notitle, \
     "log/progress.csv" using 1:4  with lines lc rgb "#000000" title "Total alpha", \
     "log/progress.csv" using 1:7  with lines lc rgb "red"  title "X's", \
     "log/progress.csv" using 1:10 with lines lc rgb "green"  title "X*X", \
     "log/progress.csv" using 1:13 with lines lc rgb "green"  title "X*X (used)", \
     "log/progress.csv" using 1:16 with lines lc rgb "green"  title "X*X (skipped)", \
     "log/progress.csv" using 1:19 with lines lc rgb "blue"   title "Poly(X) (skipped)",\
     "log/progress.csv" using 1:3:24 with labels  axis x1y2 notitle


# 1 Round
# 2 Time
# 3 Goodness of Fit
# 4 Total Alpha
# 5, 6, 7, Universal bounded bidder/Columns Expert, Alpha, Current Bid, 
# 8, 9, 10, Universal bounded bidder/Column interactions Expert, Alpha, Current Bid, 
# 11, 12, 13 Universal bidder/Used-feature interactions Expert, Alpha, Current Bid, 
# 14, 15, 16 Universal bidder/Skipped-feature interactions Expert, Alpha, Current Bid,
# 17, 18, 19 Universal bidder/Skipped-feature polynomial Expert, Alpha, Current Bid, 

# 20 Winning Expert, 
# 21 High Bid
# 22  p-value
# 23 Variable, 
# 24 Outcome, 
# 25 Payoff,
# 26 RSS, 
# 27 CVSS


exit

set term unknown


########################################################################################
#
#                          VARIALES IN THE FILE
#
#
# 1 Round
# 2 Time
# 3 Goodness of Fit
# 4 Total Alpha
# 5, 6, 7, Universal bounded bidder/Columns Expert, Alpha, Current Bid, 
# 8, 9, 10, Universal bounded bidder/Column interactions Expert, Alpha, Current Bid, 
# 11, 12, 13 Universal bidder/Used-feature interactions Expert, Alpha, Current Bid, 
# 14, 15, 16 Universal bidder/Skipped-feature interactions Expert, Alpha, Current Bid,
# 17, 18, 19 Universal bidder/Skipped-feature polynomial Expert, Alpha, Current Bid, 
#
# 20  Fit bidder [Y_hat_]/Linear Model Expert,
# 21  Alpha, 
# 22  Current Bid, 
#
# 23 Winning Expert, 
# 24 High Bid
# 25 p-value
# 26 Variable, 
# 27 Outcome, 
# 28 Payoff,
# 29 RSS, 
# 30 CVSS
#
########################################################################################





set title "AUCTIONS: STREAMING FEATURE SELECTION\n(by Robert Stine and Dean Foster)";
set xlabel "Total number of variables considered";
set ylabel "alpha";
set y2label "Goodness of fit";
set log x 10;
set log y 10;
set tukey x .15;
set tukey_center x -1
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
set grid front lc rgb "red"
set tics front
set ytics nomirror

set key below 

set yrange [*:1]
set xrange [0.00:*]

set y2tics

set datafile separator ","


# the following will make the RSS touch the upper left corner
set autoscale y2fixmax

# The following will make the RSS touch the lower left corner
set autoscale y2fixmin


#
#  Color definitions
#

lightGrey = "#FAFAF4"

# overFit is a wash color of InSample
overFit   = "#FAF0F0"
InSample  = "#FAE0FA"

# underFit is a wash color of OutSample
underFit  = "#F0FAF0"
OutSample = "#E0F0FA"
# 
#   RSS (grey background, done mostly as a fade)
#


plot   "progress.csv" using 1:30:29            lc rgb overFit   with filledcurves below title "" axis x1y2
replot "progress.csv" using 1:29:30            lc rgb underFit  with filledcurves below title "" axis x1y2
  
replot "progress.csv" using 1:29               lc rgb lightGrey with filledcurves x2 title "" axis x1y2
replot "progress.csv" using 1:29               lc rgb lightGrey with filledcurves y2 title "" axis x1y2
replot "progress.csv" using 1:30 with lines    lc rgb InSample  lt 1 lw 4    title "Out of sample error" axis x1y2
replot "progress.csv" using 1:29 with lines    lc rgb OutSample lt 1 lw 4    title "In sample error" axis x1y2

#
#   P value stuff
#
replot "progress.csv" using 1:24 with lines    lc rgb "#000000" lw 10  title  "winning bid"
replot "progress.csv" using 1:25 with  points pointsize .2 pt 7 lc rgb "#90D090"  notitle
replot "progress.csv" using 1:($25 < $24 ? $25 : 1/0) with  points pointsize 2 pt 7 lc rgb "#90D090" title  "p-values"
replot "progress.csv" using 1:4  with lines lc rgb "#000000" title "Total alpha"
replot "progress.csv" using 1:($7 > 1e-9 ? $7 : 1/0) with points pointsize .2 pt 7 lc rgb "red"   notitle
replot "progress.csv" using 1:($7 == $24 ? $7 : 1/0) with  points pointsize .4 pt 7 lc rgb "red" title "X's"
replot "progress.csv" using 1:($10 > 1e-9 ? $10 : 1/0) with points pointsize .2 pt 7 lc rgb "purple"  notitle
replot "progress.csv" using 1:($10 == $24 ? $10 : 1/0) with  points pointsize .4 pt 7 lc rgb "purple" title "X*X"
replot "progress.csv" using 1:($13 > 1e-9 ? $13 : 1/0) with points pointsize .2 pt 7 lc rgb "purple"  notitle
replot "progress.csv" using 1:($13 == $24 ? $13 : 1/0) with  points pointsize .4 pt 7 lc rgb "purple" title "X*X (used)"
replot "progress.csv" using 1:($16 > 1e-9 ? $16 : 1/0) with points pointsize .2 pt 7 lc rgb "purple"  notitle
replot "progress.csv" using 1:($16 == $24 ? $16 : 1/0) with  points pointsize .4 pt 7 lc rgb "purple" title "X*X (skipped)"
replot "progress.csv" using 1:($19 > 1e-9 ? $19 : 1/0) with points pointsize .2 pt 7 lc rgb "blue"   notitle
replot "progress.csv" using 1:($19 == $24 ? $19 : 1/0) with  points pointsize .4 pt 7 lc  rgb "blue"   title "Poly(X) (skipped)"

#
#  Add variable names to the RSS background stuff
#

  
replot "progress.csv" using 1:29:27 with labels left axis x1y2 notitle

unset grid

#
#  First get some ASCII art version
#

set term dumb feed 140, 60
replot

#
#  Now get a gif file  
#
  
set term gif size 1200,800
#set term canvas mousing size 1200,800
set size .95,.95
set output "progress.gif"
replot

#
#  Finally get an interactive termianl for my laptop and other linux systems
#

set term wxt 0
replot
  
if(system("hostname") eq "localhost") pause -1

exit

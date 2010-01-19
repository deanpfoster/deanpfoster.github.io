# To make remarks use the pound sign in fornt of the line
# One more important thing -- R is case sensitive so be careful!

# Asking for help -- just use the question mark and the name of the command 
# or use the help() command
?read.table
help(read.table)

# searching for words
apropos("read")


# here are a couple of useful ways to create and manipulate  a vector
ind<-1:10           # create a vector with the numbers 1 through 10
x1<-rep(3,9)        # create a vector containing the number 3 -- 9 times
x2<-rep(1:3,2)      # create a vector with the sequence 1,2,3 repeated twice
x3<-c(1,2,3,4)      # create a vector with the numbers 1 2 3 4
x4<-("big","gid","sig") # create a vector of strings

x4[1]          # access the first element in the vector
x4[-2]         # display all elements in this vector except the second one
x2[1:2]        # display only the first and second elements in the vector
x2[c(-1,-4)]   # display all the elements except for the first and fourth


#####################################################################
### Here are some useful commands that will help you with hw 1    ###
#####################################################################


# set the working directory by using setwd() command or with the R toolbar
setwd("F:/Teaching/stat471") # Use forward slashes NOT (like windows) backwards..

# Download the market data set which contains the monthly market return onto
# your working directory. Then next step is to read it into your R environment. 
# The approporiate command for that is read.table(). The first argument is the file name.
# we will also skip the first line since it is not really a header nor data

data<-read.table("market.txt",skip=1)  

# sanity check
# dim() command tells you the dimension of the dataset -- in our case we should 
# have 120 lines and one column
dim(data) 

# if you want to see the first element in the matrix you can type
data[1,1]  # the first argument is the row number and the second is the column number

# If you only want a subset of the data  this is one way to get it
# now lets look at the first ten lines
ind<-1:10
sub.data<-data[ind,] 
sub.data


# I would like to add some dates to the data set because it makes it more convenient..
# months will contain the month that corresponds to each of the data points. 
# Basically it is a vector containing the number 1 through 12, 10 times. 
# For each of the 10 years we have each of the months 
months<-rep(1:12,10)

# years is going to contain the year that corresponds to each of the data points.
years<-c(rep(1978,12),rep(1979,12),rep(1980,12),rep(1981,12),rep(1982,12),
rep(1983,12),rep(1984,12),rep(1985,12),rep(1986,12),rep(1987,12))

# Lets combine the months vector, years vector and the market returns into one data set using
# the cbind() command (cbind==column bind)
market<-cbind(months,years,data[,1])

# give names to all the column variables
colnames(market)<-c("months","years","market.return")


# now we want to get some summary statistics about this data
# we could have also used the command summary(market[,3])
# since we know that the market returns variable is the third variable in the data set
summary(market[,"market.return"]) 

# we also want the standard deviation and the variance
market.sd<-sd(market[,"market.return"])
market.var<-var(market[,"market.return"])

# and not surprising... when you square the standard deviation you get the variance!
market.sd^2
market.var

# now lets plot the time series
plot(market[,"market.return"],type="l",ylab="Monthly Market Return")

# Upload the risk free return -- the return on 30-day US Treasury bills 
# we will skip the first line since it is not really a header nor data
rkfree.data<-read.table("rkfree.txt",skip=1)  

# compute the overall market risk premium for each month in the data set
mrp<-market[,"market.return"]-rkfree.data[,1]

# now compute the yearly average for each year
# this is a more advanced command ...
# if you want to understand what it does you should go to the help file
yearly.avg<-tapply(market[,"market.return"],years,mean) 
annual.return<-(1+yearly.avg)^12-1

# upload the ibm monthly returns and then compute the company's risk premium
ibm.data<-read.table("ibm.txt",skip=1) 
ibm.rp<-ibm.data[,1]-rkfree.data[,1]


# plot ibm risk premium vs. the market risk premium
# you can add colors to plots, you can label the x and y axes, you can draw dots
# instead of lines and do many things.
# Look at help(plot) for more on this.

plot(x=mrp,y=ibm.rp,main="IBM monthly Risk Premium vs. Market Risk Premium between 1978-1987",
xlab="Market Risk Premium",ylab="IBM Risk Premium")

# lets run a simple linear regression model
# use the command lm(). The dependent variable should be on the left side of the tilda sign 
# and the independent variables should be on the right side (if there is more than one then use 
# the "+" plus sign between them.
results<-lm(ibm.rp~mrp)

# lets see how the line fits the data...
plot(mrp,ibm.rp)
abline(a=results$coef[1],b=results$coef[2],col="red")

# lets look at some hypotheses tests and general measures
summary(results)

# add some diagnostic plots
plot(results)


# two more remarks that might be helpful...

# lets say you want to exculde one row from the data set -- line 29 for example
tmp.mrp<-mrp[-29,]

# if you want to create a binary variable which takes the values 1 and zero
# for example a variable that takes the value one when the data corresponds
# to October,1980 and zero otherwise

bi.variable<-as.numeric(years==1980 & months==10)

# Good luck! and you can always email for help. 

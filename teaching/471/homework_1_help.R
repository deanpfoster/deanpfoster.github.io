# making remarks use pound sign infornt of the sentence
# One more immportant thing -- R is case sensitive so be careful!

# asking for help -- just use question mark and 
# the name of the command or help() function
?read.table
help()

# searching for words
apropos("read")


# here are a couple of useful tricks
ind<-1:10 # this means create a vector with the numbers 1 through ten
x1<-rep(3,9) #  a vector containing the number 3 -- 9 times
x2<-rep(1:3,2) # a vector which has the sequence 1,2,3 repeated twice
x3<-c(1,2,3,4) # a vector with the numbers 1 2 3 4
x4<-("big","gid","sig") # a vector of strings

x4[1]
x4[-2]
x2[1:2]
x2[c(-1,-4)]

# Here are some useful commands that will help you with hw 1


# set the working directory by using setwd command or with the R toolbar
setwd("F:/Teaching/stat471") # Please notice the slashes are forward not like windows backwards..

# now we are ready to start
# download the market data set which contains the monthly market return
# download the data to your working directory and read it to the R enviorment. 
data<-read.table("market.txt",skip=1)  # we will skip the first line since it is not really a header nor data

# sanity check
dim(data) # dim command tells you the dimension of the object -- in our case we should have 120 lines and one column

# if you want to see the first element in the matrix you can type
data[1,1]  # the first argument is the row number and the second is the column number


# look at the first ten lines
data[ind,] # this is useful if you only want a subset of the data

# another nice trick is the rep command

# I would like to add some dates to the data set because it makes it more convinient..
months<-rep(1:12,10)
years<-c(rep(1978,12),rep(1979,12),rep(1980,12),rep(1981,12),rep(1982,12),rep(1983,12),rep(1984,12),
rep(1985,12),rep(1986,12),rep(1987,12))

# lets combinde the months vector, years vector and the market returns into one data set using
# the cbind command (cbind==column bind)
market<-cbind(months,years,data[,1])

# give names to all the column variables
colnames(market)<-c("months","years","market.return")

# now we want to get some summary statistics about this data
summary(market[,"market.return"]) # we could have also used the command summary(market[,3])

# we also want the standard deviation and the variance
market.sd<-sd(market[,"market.return"])
market.var<-var(market[,"market.return"])

# and not surprising... when you square the standard deviation you get the variance!
market.sd^2
market.var

# now lets plot the time series
plot(market[,"market.return"],type="l",ylab="Monthly Market Return")

# now lets upload the risk free return -- the return on 30-day US Treasury bills 
rkfree.data<-read.table("rkfree.txt",skip=1)  # we will skip the first line since it is not really a header nor data

# compute the overall market risk premium for each month in the data set
mrp<-market[,"market.return"]-rkfree.data[,1]

# now compute the yearly average for each year
yearly.avg<-tapply(market[,"market.return"],years,mean) # this is a more advanced command ...

annual.return<-(1+yearly.avg)^12-1


# upload the ibm monthly returns and then compute the company's risk premium
ibm.data<-read.table("ibm.txt",skip=1) 
ibm.rp<-ibm.data[,1]-rkfree.data[,1]


# plot ibm risk premium vs. the market risk premium
plot(mrp,ibm.rp)

# lets run a simple linear regression model
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

#load the data. make sure to delete the descriptive text at the beginning.
data = read.table('europe-seasonal.txt',header=TRUE);
dim(data);

#what columns do we have
names(data);

#let's look at annual vs time
plot(data$Year, data$Annual, xlab='Year', ylab='Annual Temp');

#let's look at it as a time series
plot(data$Year, data$Annual, xlab='Year', ylab='Annual Temp', type='l');

#plot a couple of loess smooths with different spans on top
loess.smooth1 = loess.smooth(data$Year, data$Annual, span=0.25, evaluation=length(data$Annual));
loess.smooth2 = loess.smooth(data$Year, data$Annual, span=0.75, evaluation=length(data$Annual));
lines(loess.smooth1$x,loess.smooth1$y,col='blue');
lines(loess.smooth2$x,loess.smooth2$y,col='green');

#model for annual vs time
annual.model = lm(Annual~Year,data=data);
abline(annual.model,col='red');

#random walk
random.walk = rep(NA,505);
random.walk[1] = data$Annual[1];

#sd of random walk = sd of temperature data
random.sd = sd(data$Annual,na.rm=TRUE);

#generate the random walk
for (i in 2:length(random.walk))
{
	random.walk[i] = random.walk[i-1] + rnorm(1,mean=0,sd=random.sd);
}
#let's plot the random walk side-by-side with the annual data
par(mfrow=c(1,2));
plot(data$Year, data$Annual, xlab='Year', ylab='Annual Temp', type='l');
plot(data$Year, random.walk, xlab='Year', ylab='Random Walk', type='l');

#let's look at the slope for the random walk
random.model = lm(random.walk ~ data$Year);
summary(random.model);

#let's do a number of random walks
num.walks = 1000;
random.walk.t = rep(NA,num.walks);
for (j in 1:num.walks)
{
	#create the random walk
	random.walk = rep(NA,505);
	random.walk[1] = data$Annual[1];
	random.sd = sd(data$Annual,na.rm=TRUE);
	for (i in 2:length(random.walk))
	{
		random.walk[i] = random.walk[i-1] + rnorm(1,mean=0,sd=random.sd);
	}
	
	#estimate the model
	random.model = lm(random.walk ~ data$Year);
	
	#pull out the t-statistic for the slope of Year
	random.walk.t[j] = summary(random.model)$coefficients[2,3];
}

#let's look at the histogram of these t-statistics
hist(random.walk.t,xlab='t-Statistic for Slope of Year');

#fitting lines with knots
plot(data$Year, data$Annual, xlab='Year', ylab='Annual Temp', type='l');

#create knots at 1700, 1800 and 1900
after1900 = rep(0,nrow(data));
after1900[which(data$Year>=1900)] = 1;
after1900 = after1900*(data$Year-1900);

after1800 = rep(0,nrow(data));
after1800[which(data$Year>=1800)] = 1;
after1800 = after1800*(data$Year-1800);

after1700 = rep(0,nrow(data));
after1700[which(data$Year>=1700)] = 1;
after1700 = after1700*(data$Year-1700);

expanded.data = data.frame(data,after1900=after1900,after1800=after1800,after1700=after1700);
expanded.model = lm(Annual~Year+after1900+after1800+after1700,data=expanded.data);
plot(data$Year, data$Annual, xlab='Year', ylab='Annual Temp', type='l', main='Regression With Knots');
lines(data$Year, expanded.model$fitted.values, col='red');





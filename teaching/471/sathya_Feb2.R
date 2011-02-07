#read data from the web
sugar  <- read.csv("http://gosset.wharton.upenn.edu/~foster/teaching/471/domino_sugar.csv");  
tbills <- read.csv("http://gosset.wharton.upenn.edu/~foster/teaching/471/tbills-inflation.csv");  

#look at column names
names(sugar);
names(tbills);

#mean returns of sugar and the market
mean(sugar$RET,na.rm=TRUE);
[1] 0.01282553
mean(sugar$vwretd,na.rm=TRUE);
[1] 0.008421793

#sds of the returns
sd(sugar$RET,na.rm=TRUE)
[1] 0.09715933
sd(sugar$vwretd,na.rm=TRUE)
[1] 0.05477385

#sugar has higher return mean, but also higher sd
#i.e. sugar is more volatile than the market

#take 80% of sugar
mean(0.8*sugar$RET,na.rm=TRUE)
[1] 0.01026043
sd(0.8*sugar$RET,na.rm=TRUE)
[1] 0.07772747

#make mean of sugar equal to market mean
mean(0.63*sugar$RET,na.rm=TRUE)
[1] 0.008080087
sd(0.63*sugar$RET,na.rm=TRUE)
[1] 0.06121038

#sugar has the same mean return as the market
#but still has higher volatility (sd)

#take p% of market and (1-p)% of 0.63*sugar
p=seq(0,1,by=0.01);
sds.p = rep(NA,length(p));
means.p = rep(NA,length(p));
for (i in 1:length(p))
{
  weighted.return = p[i]*sugar$vwretd + (1-p[i])*0.63*sugar$RET;
  means.p[i] = mean(weighted.return,na.rm=TRUE)
  sds.p[i] = sd(weighted.return,na.rm=TRUE)
}
#which p has the minimum SD
p.min = p[which.min(sds.p)];
#plot SDs against values of p
plot(x=p,y=sds.p,xlab='Proportion,p',ylab='SD')
#add a line to denote the p for minimum SD
abline(v=p.min,col='red')

#plot Means against values of p
plot(x=p,y=means.p,xlab='Proportion,p',ylab='Mean',ylim=c(0,1))

#bootstrap sugar and vw returns
p=seq(-2,2,by=0.02);
num.samples = 500;
p.mins = rep(NA,num.samples);
#create a random extraction of sugar and vw returns
for (j in 1:num.samples)
{
	random.ix = sample(nrow(sugar),replace=TRUE);
	ret.random = sugar$RET[random.ix];
      vwret.random = sugar$vwretd[random.ix];

	sds.p = rep(NA,length(p));
	for (i in 1:length(p))
	{
	  weighted.return = p[i]*ret.random + (1-p[i])*mean(ret.random,na.rm=TRUE)/mean(vwret.random,na.rm=TRUE)*vwret.random;
	  sds.p[i] = sd(weighted.return,na.rm=TRUE)
	}
	#extract p for which SD is minimum
	p.mins[j] = p[which.min(sds.p)];	      
}

#look at the histogram of p's
hist(p.mins,xlab='P for Min SDs',ylab='Count',xlim=c(-0.2,1.2));
#IQR of p.mins
quantile(p.mins);


#plot Sugar vs Market Returns
plot(sugar$vwretd,sugar$RET,xlab='Market Return',ylab='Sugar Return')

#regress Sugar on Market returns
model = lm(sugar$RET~sugar$vwretd)
#add the regression line to the plot
abline(model,col='red')
#add a vertical line for x=0
abline(v=0,col='blue')
#add a grid to the plot
grid()

#the same plots for bootstrapped sample
windows()
random.ix = sample(nrow(sugar),replace=TRUE);
ret.random = sugar$RET[random.ix];
vwret.random = sugar$vwretd[random.ix];
plot(vwret.random,ret.random);
abline(lm(ret.random~vwret.random),col='red')
abline(v=0,col='blue')
grid()

#time series plot
plot(1:nrow(sugar),sugar$RET)
windows()
plot(1:length(ret.random),ret.random)



# Sivan's version of the code

# read data
data<-read.csv("appleData.csv",header=TRUE)

# sanity check
dim(data)
data[1:10,]

# columns we are interested in
# Excess.Return..S.P.500, Year,Date, t30ret (risk free rate), apple

# compute apple excess
apple.ex<-data[,"apple"]-data[,"t30ret"]

# make a histogram 
hist(apple.ex,breaks=10)

# market excess return
market.ex<-data[,"Excess.Return..S.P.500"]


# make a linear model betwen market.ex and apple.ex
lm.res<-lm(apple.ex~market.ex)

# how to save a picture to a pdf file
pdf("plot.pdf")

#CAPM plot
plot(market.ex,apple.ex,pch=19,col="blue",main="Apple vs. Market",xlab="Market Excess"
,ylab="Apple Excess")

# add the regression line
abline(a=lm.res$coef[1],b=lm.res$coef[2],col="red")

# add axes to the plot
abline(a=0,b=0,lty=2)
abline(a=0,b=10000000,lty=2)

# this is to tell the computer to close the pdf the connection.
# If you added another plot then it would have been plotted in the
# second page of this pdf file.. and so on until you use the following line to close it.
dev.off()

# summary of apple and market returns
summary(bind(market.ex,apple.ex))

# market and apple need to look at the same date
start<-662
end<-length(market.ex)

tmp.apple.ex<-apple.ex[start:end]
tmp.market.ex<-market.ex[start:end]

# the proportion of the portfolio
p<-0.5

# the portfolio
port<-p*(tmp.apple.ex/mean(tmp.apple.ex))+(1-p)*(tmp.market.ex/mean(tmp.market.ex))

# sanity check -- the mean needs to be 1
summary(port)



# make a vector with different values of p (from 0 to 2 with jumps of 0.001)
p.vec<-seq(0,2,by=0.001)

# prepare two vectors where you would save the mean and the variance of each portfolio
mean.port<-rep(NA,length(p.vec))
var.port<-rep(NA,length(p.vec))


# compute the mean for each of these portfolio
for(i in 1:length(p.vec)){
p<-p.vec[i]
port<-p*(tmp.apple.ex/mean(tmp.apple.ex))+(1-p)*(tmp.market.ex/mean(tmp.market.ex))
mean.port[i]<-mean(port)
var.port[i]<-var(port)
}

# plot the mean value for each one and it should be 1 all the time
plot(p.vec,mean.port,main="Mean Portfolio vs. p",ylab="mean",xlab="p",type="l")
plot(p.vec,var.port,main="Var Portfolio vs. p",ylab="var",xlab="p",type="l")

# find the p with the minimum of variance
p.vec[which(var.port==min(var.port))]


##################################
##################################
# bootstrap                   ####
##################################
##################################


n.boot<-1000
p.vec.boot<-rep(NA,n.boot)

tmp.data<-cbind(tmp.apple.ex,tmp.market.ex)
n<-dim(tmp.data)[1]

for(sample.ind in 1:n.boot){
boot.ind<-sample(1:n,n,replace=TRUE)
boot.sample<-tmp.data[boot.ind,]


tmp.apple.ex<-boot.sample[,"tmp.apple.ex"]
tmp.market.ex<-boot.sample[,"tmp.market.ex"]

p.vec<-seq(0,2,by=0.001)
mean.port<-rep(NA,length(p.vec))
var.port<-rep(NA,length(p.vec))


# compute the mean for each of these portfolio
for(i in 1:length(p.vec)){
p<-p.vec[i]
port<-p*(tmp.apple.ex/mean(tmp.apple.ex))+(1-p)*(tmp.market.ex/mean(tmp.market.ex))
mean.port[i]<-mean(port)
var.port[i]<-var(port)
}

# find the p with the minimum of variance
p.vec.boot[sample.ind]<-p.vec[which(var.port==min(var.port))]
}

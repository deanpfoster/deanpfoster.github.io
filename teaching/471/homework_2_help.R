data<-read.table("temp.txt",header=FALSE)

#sanity check
dim(data)
names(data)<-c("time","temp")

plot(data)

# ok.. now lets make a spline ourselves
temp<-data[,2]
time<-data[,1]

after1900.ind<-as.numeric(time>1900)
spline1900<- after1900.ind*(time-1900)

# now create a data frame with all of the variables

lm.data<-data.frame(temp,time,spline1900)
names(lm.data)<-c("temp","time","spline")
# now run a regression
lm.res=lm(temp~time+spline,data=lm.data)

summary(lm.res)

# plot the fitted values
y.pred<-lm.res$fitted

plot(time,temp,main="Temp series",col="green",pch=19)
# add the line of predictions
lines(time,y.pred,col="red",lwd=2)

# we want to fit cubic splines -- just square the splines
square.spline<-lm.data[,"spline"]^2
cubic.lm.data<-cbind(lm.data,square.spline)
cubic.lm.res=lm(temp~time+square.spline,data=cubic.lm.data)

# add the fitted line to the plot
lines(time,cubic.lm.res$fitted,col="orange",lwd=2)

# you want to find a smoothed line that fits well
# span is the parameter that controls how smooth is the curve
# smaller values of span will make the line more wiggly and higher
# values will make the line more straight.
lines(loess.smooth(time,temp,span=0.3),col="purple",lwd=2)

# fit a 3-degree polynomial
poly.fit<-lm(temp~poly(time,degree=3,raw=TRUE))

# add the line of predictions
lines(time,poly.fit$fitted,col="red",lwd=2)

# add a legend to the plot so it will be more readable
legend(x=1650,y=0.4,c("Spline Fit","Cubic Spline Fit","Smooth Fit",
"Polynomial Fit"),
lwd=2,col=c("red","orange","purple","red"))



# if you want to predict a value
new.x<-data.frame(time=2020,temp=NA,spline=(2020-1900))
predict(lm.res,new.x)

# if you need the residuals
resid<-lm.res$residuals

# plot residuals vs. time squared
time.2<-lm.data[,"time"]^2
plot(time.2,resid)


# if you want to fit a linear regression with weights=1/time^2...
lm.res=lm(temp~time,data=lm.data,weights=1/time^2)


# now for boostrap

# this is the original linear model
lm.res=lm(temp~time+spline,data=lm.data)


# number of boostrap samples
n.boot<-1000

# number of rows in each bootstrap is the same as the original sample number of rows
n.rows<-dim(lm.data)[1]

# we are going to keep the beta from each of the boostraps
bootstrap.beta<-rep(NA, n.boot)


for(i in 1:n.boot){
ind<-sample(1:n.rows,n.rows,replace = TRUE) # you sample the row 
#numbers with replacement
boot.data<-lm.data[ind,] # this is the boostrap sample
 # run the regression with this data
boot.lm.res=lm(temp~time+spline,data=boot.data)
bootstrap.beta[i]<-boot.lm.res$coef[2]  # you only need the slope of "time"
}


# plot the histogram of the bootstrapped beta
hist(bootstrap.beta,breaks=100)

# you want the 95% confidence interval

# compute the sd of the boostrapped betas and that the estimated SE

se.beta<-sd(bootstrap.beta)

# compute lower and upper confidence values
upper.conf<-lm.res$coef[2]+se.beta*qnorm(0.975)
lower.conf<-lm.res$coef[2]+se.beta*qnorm(0.025)



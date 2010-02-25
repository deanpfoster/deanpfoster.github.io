

data<-read.csv("population_total.csv",header=TRUE)

# create the VW
y<-log(cumprod(1+data$returns))

# combine it with the original data
new.data<-cbind(y,data)

# now lets create the differenced data set
n<-length(y)
new.data<-new.data[-1,]-new.data[-n,]

# I want to change the names of the columns to have the
# word diff infront of the name.
# Try it -- it is easier to understand once you run it
names(new.data)[1]<-"diff.log"
ages.names<-names(new.data)[-c(1:4)]
names(new.data)[-c(1:4)]<-paste("diff",ages.names,sep=".")

# combine it with the undifferenced values (minus the first row)
new.data<-cbind(new.data,data[-1,-c(1:3)])


# the starting model
lm0<-lm(diff.log~1,new.data)

# right the formula with all the explanatory variables in a nice way
formula.lm1<-paste("diff.log",paste(names(new.data)[-c(1:4)],collapse="+"),sep="~")
lm1<-lm(formula.lm1,data=new.data)

# now run the step command with the default setting
step(lm0,scope=list(upper=lm1))

# if you want to add some interactions
# here is an example with one interaction added

lm.interaction.formula<-paste(formula.lm1,"diff.age52*diff.age0",sep="+")
lm.interaction<-lm(lm.interaction.formula,data=new.data)
step(lm0,scope=list(upper=lm.interaction))




library(nnet,lib.loc="/home2/waterman/library")

uva <- read.table("/home2/waterman/public_html/DataSets/class_06.data",
sep="\t",header=T,row.names=1)

samp <- sample(1000,500)

votes <-  rep(0,500)

for(i in 1: 2){
nnet.out <- nnet(as.factor(Newbie) ~ Age + 
                                     Household.Income + 
                                     Gender + 
                                     Major.Occupation + 
                                     Marital.Status + 
                                     Education.Attainment, 
                 data =uva,
                 maxit=100,
                 subset=samp,
		 size=2,
                 skip=T,
                 decay=.0001)

votes <- votes + ifelse(predict(nnet.out,uva,type="raw") > .3333,1,0)
} 	

sink("out.txt")
print (votes)
rm(uva)
q(save="no")

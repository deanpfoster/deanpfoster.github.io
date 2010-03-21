
#### data preperation ###

# upload federal list

data<-read.csv("federalist.csv",header=TRUE)
dim(data)

y<-as.numeric(data[,2]=="HAMILTON")

# spilt the text into words
# this is a list where each element is a vector of the words
doc.words<-strsplit(as.character(data$text),split=" ")

# number of words in each document
num.words<-unlist(lapply(doc.words,length))

# get all the words in all the documents
all.words<-unlist(strsplit(as.character(data$text),split=" "))

# if you want to get the frequency of the words
# and then pick the 80 most common

#p is the number of common words
p<-80

most.common.words<-names(sort(table(all.words),decreasing=TRUE)[1:p])

# now you just want to count how many times a specific word 
# (or character) appears in each of the documents
word.count<-function(x,word){
tmp<-rep(word,length(x))
sum(x==tmp)
}

# now iterate through the list and count the number of times each 
# of these words appears in each document

# number of documents
n.doc<-length(doc.words)

# lets make a matrix that will have the counts of each of the 
# words for each of the documents
word.count.matrix<-matrix(NA, ncol=p,nrow=n.doc)

for(i in 1:p){
word.count.matrix[,i]<-unlist(lapply(doc.words,word.count,most.common.words[i]))
print(i)
}

#convert it into frequencies
freq.word.matrix<-apply(word.count.matrix,2,"/",num.words)

# lets do a pca!!!!
pca.results<-prcomp(freq.word.matrix)

# get the pca coefficients (we call them loadings)
pca.matrix<-as.matrix(pca.results$rotation)

# get the pca values for each of the observations.
pca <- freq.word.matrix %*% pca.matrix
colnames(pca)<-paste("pca",1:p,sep=".")

# plot the first pca classifications
colors <- c("red","green","black","gray","blue")[data$author]
plot(pca[,1], pch=19 , col=colors,ylab="PCA1")
legend(1,0.015,c("HAMILTON","HAMILTON AND MADISON"," HAMILTON OR MADISON",
"JAY","MADISON"),col=c("red","green","black","gray","blue"),pch=19)


## now predict using the first pca
lm.data<-data.frame(cbind(y,pca))
predictions <- lm(y ~pca.1,data=lm.data)$fitted
plot(predictions ~ data$number , ylab="Predicted Value based on the first pca",pch=16 , col=colors)
abline(.5,0)


## now predict using the first three pca
windows()
predictions <- lm(paste("y~",paste(names(lm.data[2:4]),collapse="+"),sep=""),data=lm.data)$fitted
plot(predictions ~ data$number , pch=16 , ylab="Predicted Value based on three pca", col=colors)
abline(.5,0)



## now predict using the first nine pca
windows()
predictions <- lm(paste("y~",paste(names(lm.data[2:10]),collapse="+"),sep=""),data=lm.data)$fitted
plot(predictions ~ data$number , pch=16 ,ylab="Predicted Value based on nine pca",  col=colors)
abline(.5,0)


## now predict using all the pca
windows()
predictions <- lm(paste("y~",paste(names(lm.data[-1]),collapse="+"),sep=""),data=lm.data)$fitted
plot(predictions ~ data$number , pch=16 ,ylab="Predicted Value based on all the pca",  col=colors)
abline(.5,0)




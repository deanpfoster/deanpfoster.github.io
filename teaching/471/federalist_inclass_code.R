#load the data
federal <- read.csv("http://gosset.wharton.upenn.edu/~foster/teaching/471/federalist.csv", header = TRUE);

#how many articles
dim(federal);

#how many authors
unique(federal$author);

#how many did each author write
table(federal$author);

#create num words/chars
federal$words <- strsplit(as.character(federal$text), " ");
federal$num.words <- c(lapply(federal$words, length), recursive = TRUE);
federal$num.char <- c(lapply(as.character(federal$text),
nchar),recursive = TRUE);

#sanity check on num words/chars
plot(federal$num.words,federal$num.char);

#2 for hamilton and 3 for madison
codes <- c(NA, "HAM", "MAD");
federal$training <- codes[1 + (federal$author == "HAMILTON") + 2 *
(federal$author == "MADISON")];
federal$training01 <- (federal$training == "HAM");

#check the coding scheme: TRUE=HAMILTON, FALSE=MADISON
federal[,match(c('author','training','training01'),names(federal))];

#regress on number of words
model1 = lm(training01~num.words,data=federal);
summary(model1);
#Rsq = 0.04

#regress on number of chars
model2 = lm(training01~num.char,data=federal);
summary(model2);
#Rsq = 0.08

#regress on both
model3 = lm(training01~num.words+num.char,data=federal);
summary(model3);
#Rsq = 0.60 i.e. the Rsqs here are super-additive

#color codes
col.code = rep(NA,nrow(federal));
col.code[federal$training01==1]='red';
col.code[federal$training01==0]='blue';
federal$color = col.code;
plot(federal$num.words,federal$num.char,col=federal$color);
#draw a line through the reds
abline(lm(num.char~num.words,data=federal[which(federal$training01==1),]));

#there seems to be a separation based on num chars per word
#create num.chars/num.word
federal$num.chars.per.word = federal$num.char/federal$num.words;

#plot num chars per word vs num words
plot(federal$num.words,federal$num.chars.per.word,col=federal$color);

#plot training01 vs num chars per word
plot(federal$num.chars.per.word,federal$training01,col=federal$color);

#regress on num chars per word
model4 = lm(training01~num.chars.per.word,data=federal);
summary(model4);
abline(model4);


#get all the words
all.words = c(federal$words, recursive=TRUE);

#count each word
word.counts = table(all.words);

#sort and look at most common words
most.common = sort(word.counts[which(word.counts>50)],decreasing=TRUE);
print(most.common);

#plot frequency vs. order
plot(1:length(most.common),most.common);

#plot log(frequency) vs. log(order)
plot(log(1:length(most.common)),log(most.common));


#function to get count of a given word in a list of words
count.word <- function(x,word) { sum(x==word); }
federal$freq.the = c(lapply(federal$words,count.word,word='the'),recursive=TRUE)/federal$num.words;
federal$freq.c   = c(lapply(federal$words,count.word,word='<c>'),recursive=TRUE)/federal$num.words;
federal$freq.of  = c(lapply(federal$words,count.word,word='of'),recursive=TRUE)/federal$num.words;
federal$freq.to  = c(lapply(federal$words,count.word,word='to'),recursive=TRUE)/federal$num.words;
federal$freq.p   = c(lapply(federal$words,count.word,word='<p>'),recursive=TRUE)/federal$num.words;

#look at if freq of 'the' is related to number of words
plot(federal$num.words,federal$freq.the,col=federal$color);

#regress training01 on the above created frequencies
model5 = lm(training01~num.chars.per.word+freq.the+freq.c+freq.of+freq.to+freq.p,data=federal);
summary(model5);

#plot fitted values vs. num chars per word
keep.ix = which(!is.na(federal$training01));
plot(federal$num.chars.per.word[keep.ix],model5$fitted.values,col=federal$color[keep.ix]);

#predict for articles where author is unknown
na.ix = which(federal$author=='HAMILTON OR MADISON');
na.pred = predict(model5,newdata=federal[na.ix,]);
points(federal$num.chars.per.word[na.ix],na.pred,col='green');


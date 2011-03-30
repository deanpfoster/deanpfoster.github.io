#read in the datasets
nyse = read.csv('wrds_nyse.csv',header=TRUE);
tbills = read.csv('wrds_tbills.csv',header=TRUE);

#take out the first date as there are NAs in tbills
nyse = nyse[-1,];
tbills = tbills[-1,];

#sanity checks
names(nyse);
names(tbills);

dim(nyse);
dim(tbills);

#do the dates line up
not.matched = which(nyse$caldt!=tbills$caldt);
if (length(not.matched)>0)
{
	data.frame(nyse.dt=nyse$caldt[not.matched],tbills.dt=tbills$caldt[not.matched]);
}
## the mismatches are off by a day and appear to be coding errors. 

#correct the 10 decile returns
nyse.cor = nyse[,match(sprintf('CAP%dRET',1:10),names(nyse))] - tbills[,'t30ret'];

#pca
nyse.pca = prcomp(nyse.cor);
components = nyse.pca$rotation;

#get the eigen values
nyse.eigen = svd(nyse.cor)$d;

#plot the first component
plot(1:ncol(components),components[,1],ylim=c(-1,1));
points(1:ncol(components),components[,2],col='blue');


#read in alice data
alice <- scan("http://www.gutenberg.org/files/11/11.txt", what = "character", quote = "", skip = 25);

alice.table = table(alice);
ten.most.common = sort(alice.table,decreasing=TRUE)[1:10];

zipf.y = log(sort(alice.table,decreasing=TRUE));
zipf.x = log(1:length(alice.table));
plot(zipf.x,zipf.y);
zipf.model = lm(zipf.y~zipf.x);
abline(zipf.model,col='red');


index <- round(runif(1) * length(alice)); 
index;
cat(alice[(index - 20):(index - 11)], "\n", alice[(index - 10):(index - 1)]);





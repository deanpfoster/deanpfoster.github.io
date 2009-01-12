## The S file to read in the C programs.

partoprob <- function(params,cats,family){
if (family()$family[[1]] == "Poisson" ){ intfamily <- 1}
if (family()$family[[1]] == "Binomial"){ intfamily <- 2}
probs <- rep(0,cats) 

storage.mode(cats) <- storage.mode(intfamily) <- "integer"
storage.mode(params) <- storage.mode(probs) <- "double"

.C("partoprob",params,cats,intfamily,probs)[[4]]
}

drawsome <- function(howmany,probs){
numcats <- length(probs)
result <- as.integer(rep(0,howmany))
storage.mode(howmany) <- storage.mode(numcats) <- "integer"
storage.mode(probs) <- "double"

.C("drawsome",howmany,probs,numcats,result)[[4]]
}



unix("gcc -c drawsome.c")
dyn.load("drawsome.o")
unix("gcc -c partoprob.c")
dyn.load("partoprob.o")

partoprob(c(.8,.2),10,poisson)
dpois(c(0:10),exp(.8))


drawsome(10,partoprob(c(.8,.2),10,poisson))

###################################################
### chunk number 1: 
###################################################
pca <- function(x, scale=T, center=T, proj=T) {
  nobs <- nrow(x);  nvars <- ncol(x)
  x <- scale(x, scale=scale, center=center)
  s <- svd(x/sqrt(nobs-1))   # svd() instead of eigen()
  pca.lst <- list(Evals=s$d^2, Loadings=t(t(s$v)*s$d))
  if(proj) pca.lst$Projections <- t(t(s$u)*s$d)*sqrt(nobs-1)
  names(pca.lst$Evals)       <- paste("Eval ",1:nvars,sep="")
  dimnames(pca.lst$Loadings) <- list(colnames(x),paste("Load ",1:nvars,sep=""))
  if(proj) dimnames(pca.lst$Projections) <-
    list(rownames(x),paste("Proj ",1:nvars,sep=""))
  for(j in 1:nvars)
    if(sum(pca.lst$l[,j]) < 0)   # Sign change for interpretability
      { pca.lst$Loadings[,j] <- -pca.lst$Loadings[,j];
        if(proj) pca.lst$Projections[,j] <- -pca.lst$Projections[,j] }  
  pca.lst }


###################################################
### chunk number 2: 
###################################################
    url.buja <- "http://stat.wharton.upenn.edu/~buja/STAT-541/"
source("http://stat.wharton.upenn.edu/~buja/STAT-541/plot-plus.R")
source("http://stat.wharton.upenn.edu/~buja/STAT-541/pairs-plus.R")

    mktg <- read.table(header=T, file=paste(url.buja,"mktg.dat",sep=""))
    dim(mktg)
    names(mktg)
    pairs.plus(mktg, gap=0, cex=.1)  # Reminder: pairs.plus() is from 
    pairs.plus(mktg, gap=0, pch=".") # the above website.
    # The first three variables are quantitative,
    # the next three binary,
    # the last three multi-categorical.
    # In what follows we should only use the first 8 variables because
    # the last was generated from the others with k-means clustering.


###################################################
### chunk number 3: 
###################################################
    mktg.pca <- pca(mktg[,1:8])  
    names(mktg.pca)


###################################################
### chunk number 4: 
###################################################
    length(mktg.pca$Eval)
    plot(mktg.pca$Eval, pch=16, type="b", ylab="Eigenvalues of Mktg Data",
         ylim=c(0,max(mktg.pca$Eval)))


###################################################
### chunk number 5: 
###################################################
    round(mktg.pca$Eval, 3)
#      eval 1 eval 2 eval 3 eval 4 eval 5 eval 6 eval 7 eval 8 
#       2.640  1.689  1.034  0.812  0.673  0.527  0.422  0.203 


###################################################
### chunk number 6: 
###################################################
    sum(mktg.pca$Eval)


###################################################
### chunk number 7: 
###################################################
    round(cumsum(mktg.pca$Eval)/sum(mktg.pca$Eval)*100, 1)
#      eval 1 eval 2 eval 3 eval 4 eval 5 eval 6 eval 7 eval 8 
#        33.0   54.1   67.0   77.2   85.6   92.2   97.5  100.0 


###################################################
### chunk number 8: 
###################################################
    plot(sqrt(mktg.pca$Eval), pch=16, type="b",
         ylab="Root-Eigenvalues of Mktg Data",
         ylim=c(0,max(sqrt(mktg.pca$Eval))))


###################################################
### chunk number 9: 
###################################################
    round(sqrt(mktg.pca$Eval), 2)
#      eval 1 eval 2 eval 3 eval 4 eval 5 eval 6 eval 7 eval 8 
#        1.62   1.30   1.02   0.90   0.82   0.73   0.65   0.45


###################################################
### chunk number 10: 
###################################################
#       1.62 / 0.45
#         [1] 3.6


###################################################
### chunk number 11: 
###################################################
    dim(mktg.pca$Load)
    round(mktg.pca$Load, 3)


###################################################
### chunk number 12: 
###################################################
      plot(scale(mktg[,c(2,3)]), pch=16);  abline(a=0,b=1)


###################################################
### chunk number 13: 
###################################################
#     windows(10,10);
 par(mgp=c(1.8,.5,0), mar=c(3,3,2,1))
     xlim <- ylim <- range(mktg.pca$Proj)
      pairs.plus(mktg.pca$Proj, pch=".", cex.lab=.5,
                 xlim=xlim, ylim=ylim, gap=.1)


###################################################
### chunk number 14: foo
###################################################
      pairs.plus(mktg.pca$Proj, pch=".", cex=1, xlim=xlim, ylim=ylim,
                 col=c("red","green","blue","orange")[mktg[,"seg"]],
                 gap=.1)


###################################################
### chunk number 15: 
###################################################
      par(mfrow=c(1,1), mgp=c(1.8,.5,0), mar=c(3,3,1,1))
      plot.plus(mktg.pca$Proj[,1:2], pch=16, cex=.5, xlim=xlim, ylim=ylim,
                 col=c("red","green","blue","orange")[mktg[,"seg"]])


###################################################
### chunk number 16: 
###################################################
#    windows(wid=12, hei=6)
    par(mfrow=c(2,4), mar=c(1,1,2,2), mgp=c(1.5,.5,0))
    xlim <- ylim <- c(-5,5)
    for(i in names(mktg)[1:8])
    plot.plus(mktg.pca$Proj[,1:2], pch=16, cex=.2,
              xlim=xlim, ylim=ylim, main=i,
              xaxt="n", yaxt="n", xlab="", ylab="",
              col=c("red","green")[(mktg[,i]>median(mktg[,i]))+1] )


###################################################
### chunk number 17: 
###################################################
#    windows(wid=12, hei=6)
    par(mfrow=c(2,4), mar=c(1,1,2,2), mgp=c(1.5,.5,0))
    xlim <- ylim <- c(-5,5)
    ang <- -pi/6
    rot <- cbind(c( cos(ang), sin(ang)),  # 2x2 rotation matrix
                 c(-sin(ang), cos(ang)) )
    for(i in names(mktg)[1:8])
      plot.plus(mktg.pca$Proj[,1:2] %*% rot, pch=16, cex=.2,
                xlim=xlim, ylim=ylim, main=i,
                xaxt="n", yaxt="n", xlab="", ylab="",
                col=c("red","green")[(mktg[,i]>median(mktg[,i]))+1] )


###################################################
### chunk number 18: 
###################################################
    scale(mktg.pca$Load[,1:2],center=F) %*% rot


###################################################
### chunk number 19: 
###################################################
   swiss.pca <- pca(swiss)


###################################################
### chunk number 20: 
###################################################
    plot(swiss.pca$Eval, pch=16, type="b",
         ylab="Eigenvalues of Mktg Data")


###################################################
### chunk number 21: 
###################################################
    round(swiss.pca$Eval, 3)
#      eval 1 eval 2 eval 3 eval 4 eval 5 eval 6 
#       3.200  1.188  0.848  0.439  0.205  0.121 


###################################################
### chunk number 22: 
###################################################
    round(cumsum(swiss.pca$Eval)/sum(swiss.pca$Eval)*100, 1)
#      eval 1 eval 2 eval 3 eval 4 eval 5 eval 6 
#        53.3   73.1   87.3   94.6   98.0  100.0 


###################################################
### chunk number 23: 
###################################################
    round(swiss.pca$Load, 3)


###################################################
### chunk number 24: 
###################################################
#      windows()
      par(mgp=c(1.8,.5,0), mar=c(3,3,2,1))
      xlim <- ylim <- 1.1*range(swiss.pca$Proj)
      pairs.plus(swiss.pca$Proj, pch=16, cex=.5, gap=0,
                 xlim=xlim, ylim=ylim)
#  Here the most interesting plot is Projection 1 versus 3, which
#  reveals natural clustering.
      plot(swiss.pca$Proj[,c(1,3)], xlim=xlim, ylim=ylim, pch=16)
      identify(swiss.pca$Proj[,c(1,3)], labels=rownames(swiss), cex=.8)


###################################################
### chunk number 25: 
###################################################
    plot(swiss.pca$Eval, pch=16, type="b",
         ylab="Eigenvalues of Mktg Data")
    for(i in 1:100) lines(pca(apply(swiss, 2, sample))$Eval, col="gray")
    points(swiss.pca$Eval, type="b")


###################################################
### chunk number 26: 
###################################################
    boot <- function(x) x[sample(1:nrow(x),repl=T),]
    plot(swiss.pca$Eval, pch=16, type="b",
         ylab="Eigenvalues of Mktg Data", ylim=c(0,4))
    for(i in 1:100) lines(pca(boot(swiss))$Eval, col="gray")
    points(swiss.pca$Eval, type="b")



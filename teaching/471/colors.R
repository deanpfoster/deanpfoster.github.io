# this version has options to print either 1st and 2nd or 2nd and 3rd PCs
plot_PC12 = FALSE
plot_PC23 = TRUE
plot_background = TRUE    # and to plot the background or not.

system("touch colors.csv")
system("rm colors.csv")
system("./find_colors > colors.csv")
colors = read.csv("colors.csv",header=T)
# note: you can't have duplicates of the following, even in comments, since it is executed via grep!
#allwords = read.csv("pretty/pretty_m_3_grams_PHC_50k.csv",header=T)
#allwords = read.csv("pretty/pca_3_grams_PHC_50k.csv",header=T)
#allwords = read.csv("pretty/pretty_4_grams_PHC_10k_30.csv",header=T)
all.words = read.csv("pretty/pretty_3_grams_PHC_50k_30.csv",header=T)

# best: just the attribute dictionary
columns.to.use <- 6:35    # attribute dictionary only
#columns.to.use <- 36:125  # context only for 4-grams, state size 30
#columns.to.use <- 6:125   # attribute + context for 4-grams, state size 30
#columns.to.use <- 36:95  # context only for 3-grams, state size 30
#columns.to.use <- 6:95   # attribute + context for 3-grams, state size 30
c.mat <- as.matrix(colors[,columns.to.use])
#
#
all.mat <- as.matrix(all.words[,columns.to.use])
c.svd <- svd(c.mat)


word_plot <- function(basis)
  {
                                        #scaling <-  diag(1/c.svd$d[1:2])
    scaling <-  diag(c(1,1))
                                        # full reconstruction
                                        # colSums(c.mat - c.svd$u %*% diag(c.svd$d) %*% t(c.svd$v))
                                        # best 2d reconstruction
                                        # colSums(c.mat - c.svd$u[,1:2] %*% diag(c.svd$d) %*% t(basis))
    if (plot_PC12) plot(c.mat %*% basis %*% scaling,col="white",asp=1,xlab="PC 1",ylab="PC 2")
    if (plot_PC23) plot(c.mat %*% basis %*% scaling,col="white",asp=1,xlab="PC 2",ylab="PC 3")
    text(c.mat %*% basis  %*% scaling,labels=colors[,1],col="black",cex=1.5)
                                        # Plot invisible points 
    if( plot_background) {
      values <- all.mat %*% basis  %*% scaling
      points(values[101:1000,],col="gray",pch=16,asp=.4)         # obscure words are dots
                                        #points(c.mat %*% basis %*% scaling,col="blue",pch=16)
                                        # Plot words
      text(values[1:100,],labels=all.words[1:100,1],col="blue")   # background words
      text(c.mat %*% basis  %*% scaling,labels=colors[,1],col="red",cex=1.5)   # foreground words
    }
  }

if (plot_PC12) word_plot(c.svd$v[,1:2])  # project onto the first two PCs
if (plot_PC23) word_plot(c.svd$v[,2:3])  # project onto the second and third PCs


#
#   M D S
#
#d <- dist(c.mat)
#fit <- cmdscale(d)
#plot(fit)
#text(fit,labels=colors[,1],col="red")


#
#   
#


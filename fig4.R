#Figure 4
#Random sampling of SNPs

source('~/Downloads/fancy_qq_plot2.R')

#Generate 10 sets of random SNPs matching them to the actual number of SNPs obtained in DMRs
randomsamplelist = list()
for(i in 1:10){
      randomsamplelist[i] <- list(sample(scz.mhcmasked$p.corr, size = 6356, replace = T))
}


#Store each of the 10 sets as separate Trellis objects
a <- qqunif.plot(list('Random SNPs' = randomsamplelist[[1]], 'SCZ GWAS' = scz.mhcmasked$p.corr, 'Original DMR SNPs' = sczmhcmasked.dmroverlapvals$p.corr ), auto.key = list(corner = c(.95, .05)))
b <- qqunif.plot(randomsamplelist[[2]])
c <- qqunif.plot(randomsamplelist[[3]])
d <- qqunif.plot(randomsamplelist[[4]])
e <- qqunif.plot(randomsamplelist[[5]])
f <- qqunif.plot(randomsamplelist[[6]])
g <- qqunif.plot(randomsamplelist[[7]])
h <- qqunif.plot(randomsamplelist[[8]])
i <- qqunif.plot(randomsamplelist[[9]])
j <- qqunif.plot(randomsamplelist[[10]])

#Plot all 10 plots together 
library(latticeExtra)
a + as.layer(b) + as.layer(c) + as.layer(d) + as.layer(e) + as.layer(f) + as.layer(g) + as.layer(h) + as.layer(i) + as.layer(j)
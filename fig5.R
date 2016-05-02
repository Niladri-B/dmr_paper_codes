
load('~/Downloads/heatmaps_in_R.Rdata')  
library(gplots)

break.pairs <- c(seq(0.003, 0.099, length.out=50),seq(0.1, 1,length.out=50))
#mycol <- colorpanel(n=99,low="navy",mid="deepskyblue3",high="aliceblue")
# mycol <- colorpanel(n=99,low="navy",mid="deepskyblue3",high="ghostwhite")
#mycol <- colorpanel(n=99,low="dodgerblue",mid="black",high="yellow")
#mycol <- colorpanel(n=99,low="BLACK",mid="firebrick3",high="yellow")
#mycol <- colorpanel(n=99,low="navy",mid="white",high="firebrick")
mycol <- colorpanel(n=99,low="firebrick",mid="black",high="aliceblue")

lmat <- rbind(c(0,4), c(2,1), c(0,3))  #Format plot area into 3x2 matrix i.e 3 rows and 2 columns
lhei <- c(0.76,4,1.5) #1st number is Key, 2nd is Heatmap, 3rd is Coln. Dendogram
lwid <- c(1,4) #1st is Row Dendograms, 2nd is Key + Heatmap + Coln Dendograms

heatmap.2(correctedpvals_matrix, breaks=break.pairs, col=mycol, density.info = "none", trace = "none", dendrogram = "none", Rowv = "none", Colv = "none",
          key.xlab = 'Corrected P-values', key = T, lmat = lmat, lhei = lhei, lwid = lwid, key.title = NA, srtCol=315, adjCol = c(0,1),
          key.xtickfun=function() {
                cex <- par("cex")*par("cex.axis")
                side <- 1
                line <- 0
                col <- par("col.axis")
                font <- par("font.axis")
                mtext("0.1", side=side, at=0.1, adj=0,
                      line=line, cex=cex, col=col, font=font)
                mtext("1", side=side, at=1, adj=1,
                      line=line, cex=cex, col=col, font=font)
                return(list(labels=FALSE, tick=FALSE))
          }
)
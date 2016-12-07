#Figure 5
#INRICH heatmap results

load('/Volumes/Macintosh HD2/OldDownloads/heatmaps_in_R.Rdata')  
 library(gplots)

break.pairs <- c(seq(0.003, 0.099, length.out=50),seq(0.1, 1,length.out=50))
#mycol <- colorpanel(n=99,low="navy",mid="deepskyblue3",high="aliceblue")
# mycol <- colorpanel(n=99,low="navy",mid="deepskyblue3",high="ghostwhite")
#mycol <- colorpanel(n=99,low="dodgerblue",mid="black",high="yellow")
#mycol <- colorpanel(n=99,low="BLACK",mid="firebrick3",high="yellow")
#mycol <- colorpanel(n=99,low="navy",mid="white",high="firebrick")
mycol <- colorpanel(n=99,low="firebrick",mid="black",high="aliceblue")

#lmat <- rbind(c(0,4), c(2,1), c(0,3))  #Format plot area into 3x2 matrix i.e 3 rows and 2 columns
lmat <- rbind(c(0,4), c(2,1), c(0,3))  #Format plot area into 3x2 matrix i.e 3 rows and 2 columns #Here Row dendogram(2) & column dendogram(3) are not plotted
lhei <- c(1,4,2) #1st number is Key, 2nd is Heatmap, 3rd is Coln. Dendogram
lwid <- c(0.5,4) #1st is Row Dendograms, 2nd is Key + Heatmap + Coln Dendograms

#Lmat defaults
#[,1] [,2]

#[1,]   4    3

#[2,]   2    1

#1 - heatmap, 2- row dendogram, 3 - column dendogram, 4 - key

#Lmat modified
#[,1]  [,2]

#[1,]   0     3

#[2,]   2     1

#[3,]   4     0
#Written as lmat = rbind(c(0,3),c(2,1),c(4,0))

heatmap.2( emppvals3_matrix, breaks=break.pairs, col=mycol, density.info = "none", trace = "none", dendrogram = "none", Rowv = "none", Colv = "none",
          #emppvals_matrix_wout.D.N #emppvals2_matrix #emppvals2_matrix_wout.D.N
          key.xlab = 'Empirical P-values', key = T, lmat = lmat, lhei = lhei, lwid = lwid, key.title = NA, srtCol=315, adjCol = c(0,1), 
          margins = c(0.5,9), #margin(cel height,right hand margin with higher the number higher the displacement from right edge)
          #strCol determines degree of rotation of txt on x-axis, adjCol detrmines how far it is from figure
          key.xtickfun=function() {#Remember to change key.xlab to empirical/bootstrapped based on dataset being plotted
                cex <- par("cex")*par("cex.axis")
                side <- 1
                line <- 0
                col <- par("col.axis")
                font <- par("font.axis")
                mtext("0.1", side=side, at=0.1, adj=0, #Put text label 0.1 at position 0.1
                      line=line, cex=cex, col=col, font=font)
                mtext("1", side=side, at=1, adj=1,
                      line=line, cex=cex, col=col, font=font)
                return(list(labels=FALSE, tick=FALSE))
              
          }
)

heatmap.2( bootpavls_matrix2, breaks=break.pairs, col=mycol, density.info = "none", trace = "none", dendrogram = "none", Rowv = "none", Colv = "none", 
           #correctedpvals_matrix_wout.D.N #bootpavls_matrix
           key.xlab = 'Bootstrapped P-values', key = T, lmat = lmat, lhei = lhei, lwid = lwid, key.title = NA, srtCol=315, adjCol = c(0,1),
          margins = c(0.5,9),
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

#Figure3
# Human vs Neanderthal vs Denisovan DMRs
source('~/Downloads/fancy_qq_plot2.R')

#GWAS Genomic Corrections
# chisq <- qchisq(scz.gwas.mhcmasked$V4, 1, lower.tail=FALSE )#gwas$p
# scz.lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
# scz.lambda ##global.lambda
# scz.gwas.mhcmasked$p.corr<- pchisq( chisq/scz.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
# rm(chisq)

chisq <- qchisq(scz.gwas.full$p, 1, lower.tail=FALSE )#gwas$p
scz.lambda.full <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
scz.lambda.full ##global.lambda
scz.gwas.full$p.corr<- pchisq( chisq/scz.lambda.full, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)


#DMR Genomic Corrections
# chisq <- qchisq(scz.overlap.mhcmasked.H$V1, 1, lower.tail=FALSE )#Human DMRs MHC Masked
# scz.overlap.mhcmasked.H$p.corr<- pchisq( chisq/scz.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
# rm(chisq)

chisq <- qchisq(scz.overlap.withmhc.H$V1, 1, lower.tail=FALSE )#Human DMRs with MHC
scz.overlap.withmhc.H$p.corr<- pchisq( chisq/scz.lambda.full, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)


chisq <- qchisq(scz.overlap.withmhc.N$V1, 1, lower.tail=FALSE )#Neanderthal DMRs with MHC
scz.overlap.withmhc.N$p.corr<- pchisq( chisq/scz.lambda.full, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

chisq <- qchisq(scz.overlap.withmhc.D$V1, 1, lower.tail=FALSE )#Denisovan DMRs with MHC
scz.overlap.withmhc.D$p.corr<- pchisq( chisq/scz.lambda.full, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

#QQ Plot Trellis Objects
#scz.hdmr.fig3 <- list('Human DMR' = scz.overlap.mhcmasked.H$p.corr, 'SCZ GWAS' = scz.gwas.mhcmasked$p.corr) #Without MHC
#hdmr.plot.fig3 <- qqunif.plot(scz.hdmr.fig3, pch = 20, cex = 0.3, type = c("p","g"),auto.key = list (corner = c(.95, .05)))

scz.hdmr.fig3.withmhc <- list('Human DMR' = scz.overlap.withmhc.H$p.corr, 'SCZ GWAS' = scz.gwas.full$p.corr) #With MHC
hdmr.plot.fig3.withmhc <- qqunif.plot(scz.hdmr.fig3.withmhc, pch = 20, cex = 0.3, type = ('a'),lwd = 2, auto.key = list (corner = c(.95, .05))) #type = c("p","g"),  


scz.ndmr.fig3 <- list('Neanderthal DMR' = scz.overlap.withmhc.N$p.corr, 'SCZ GWAS' = scz.gwas.full$p.corr) #With MHC
ndmr.plot.fig3 <- qqunif.plot(scz.ndmr.fig3, pch = 20, cex = 0.3, type = ('a') ,lwd = 2,auto.key = list (corner = c(.95, .05))) #type = c("p","g")

scz.ddmr.fig3 <- list('Denisovan DMR' = scz.overlap.withmhc.D$p.corr, 'SCZ GWAS' = scz.gwas.full$p.corr) #With MHC
ddmr.plot.fig3 <- qqunif.plot(scz.ddmr.fig3, pch = 20, cex = 0.3, type = ('a'),lwd = 2, auto.key = list (corner = c(.95, .05) )) #type = c("p","g")
                             #col = c("red", "limegreen")) 

#Multipanel Conditioning
plot(hdmr.plot.fig3.withmhc, split = c(1,1,3,1)) #plot SCZ qqplot at 1,1 in a grid of 3 by 1 i.e 3 COLUMNS x 1 ROWS
plot(ndmr.plot.fig3, split = c(2,1,3,1), newpage = F)
plot(ddmr.plot.fig3, split = c(3,1,3,1), newpage = F)

#Figure1
#SCZ without MHC
#BPD,BMI,Height with MHC,
source('~/Downloads/fancy_qq_plot2.R')#Newer version

#GWAS Genomic Corrections
chisq <- qchisq(scz_gwas2$p, 1, lower.tail=FALSE )#gwas$p
scz.lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
scz.lambda ##global.lambda
scz_gwas2$p.corr<- pchisq( chisq/scz.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

chisq <- qchisq(bpd_gwas$p, 1, lower.tail=FALSE )#gwas$p
bpd.lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
bpd.lambda ##global.lambda
bpd_gwas$p.corr<- pchisq( chisq/bpd.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

chisq <- qchisq(bmi_gwas$p, 1, lower.tail=FALSE )#gwas$p
bmi.lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
bmi.lambda ##global.lambda
bmi_gwas$p.corr<- pchisq( chisq/bmi.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

chisq <- qchisq(height_gwas$p, 1, lower.tail=FALSE )#gwas$p
height.lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
height.lambda ##global.lambda
height_gwas$p.corr<- pchisq( chisq/height.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

#DMR Genomic Corrections
#chisq <- qchisq(scz.full.dmr.pval.overlap.mhccmasked$V1, 1, lower.tail=FALSE )#gwas$p
chisq <- qchisq(scz.full.dmr.pval.ld.mhccmasked$V1, 1, lower.tail=FALSE )#gwas$p
#lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
#lambda ##global.lambda
#scz.full.dmr.pval.overlap.mhccmasked$p.corr<- pchisq( chisq/scz.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
scz.full.dmr.pval.ld.mhccmasked$p.corr<- pchisq( chisq/scz.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

#chisq <- qchisq(bpd.full.dmr.pval.overlap$V1, 1, lower.tail=FALSE )#gwas$p
chisq <- qchisq(bpd.full.dmr.pval.ld$V1, 1, lower.tail=FALSE )#gwas$p
#lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
#lambda ##global.lambda
#bpd.full.dmr.pval.overlap$p.corr<- pchisq( chisq/bpd.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
bpd.full.dmr.pval.ld$p.corr<- pchisq( chisq/bpd.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

#chisq <- qchisq(bmi.full.dmr.pval.overlap$V1, 1, lower.tail=FALSE )#gwas$p
chisq <- qchisq(bmi.full.dmr.pval.ld$V1, 1, lower.tail=FALSE )#gwas$p
#lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
#lambda ##global.lambda
#bmi.full.dmr.pval.overlap$p.corr<- pchisq( chisq/bmi.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
bmi.full.dmr.pval.ld$p.corr<- pchisq( chisq/bmi.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

#chisq <- qchisq(height.full.dmr.pval.overlap$V1, 1, lower.tail=FALSE )#gwas$p
chisq <- qchisq(height.full.dmr.pval.ld$V1, 1, lower.tail=FALSE )#gwas$p
#lambda <- median( chisq, na.rm=TRUE )/0.454#qchisq(0.5,1)#
#lambda ##global.lambda
#height.full.dmr.pval.overlap$p.corr<- pchisq( chisq/height.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
height.full.dmr.pval.ld$p.corr<- pchisq( chisq/height.lambda, 1, lower.tail=FALSE ) ##corrected by global lambda 
rm(chisq)

#QQ Plot Trellis Objects
scz.list.fig1 <- list('SCZ DMR' = scz.full.dmr.pval.ld.mhccmasked$p.corr, 'SCZ GWAS' = scz_gwas2$p.corr)
scz.plot.fig1 <- qqunif.plot(scz.list.fig1, pch = 20, cex = 0.3, type = c("p","g"),auto.key = list (corner = c(.95, .05)))

bpd.list.fig1 <- list('BPD DMR' = bpd.full.dmr.pval.ld$p.corr, 'BPD GWAS' = bpd_gwas$p.corr)
bpd.plot.fig1 <- qqunif.plot(bpd.list.fig1, pch = 20, cex = 0.3, type = c("p","g"),auto.key = list (corner = c(.95, .05)))

bmi.list.fig1 <- list('BMI DMR' = bmi.full.dmr.pval.ld$p.corr, 'BMI GWAS' = bmi_gwas$p.corr)
bmi.plot.fig1 <- qqunif.plot(bmi.list.fig1, pch = 20, cex = 0.3, type = c("p","g"),auto.key = list (corner = c(.95, .05)))

height.list.fig1 <- list('Height DMR' = height.full.dmr.pval.ld$p.corr, 'Height GWAS' = height_gwas$p.corr)
height.plot.fig1 <- qqunif.plot(height.list.fig1 , pch = 20, cex = 0.3, type = c("p","g"),auto.key = list (corner = c(.95, .05)))

#Multipanel Conditioning
plot(scz.plot.fig1, split = c(1,1,2,2)) #plot SCZ qqplot at 1,1 in a grid of 2 by 2 i.e 2 COLUMNS x 2 ROWS
plot(bpd.plot.fig1, split = c(2,1,2,2), newpage = F)
plot(bmi.plot.fig1, split = c(1,2,2,2), newpage = F)
plot(height.plot.fig1, split = c(2,2,2,2), newpage = F)

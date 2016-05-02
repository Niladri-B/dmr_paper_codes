
primateHARs.pvals <- read.table('~/Downloads/HAR_analysis2/pvals.sczmhcmasked.primateHAR.out')
HARs.pvals <- read.table('~/Downloads/HAR_analysis2/pvals.sczmhcmasked.HAR.out')
PARs.pvals <- read.table('~/Downloads/HAR_analysis2/pvals.sczmhcmasked.PAR.out')


#GENOMIC CORRECTIONS
#HAR
chisq <- qchisq(HARs.pvals$V1, 1, lower.tail = FALSE)
lambda_har <- median( chisq, na.rm = TRUE) /0.454
lambda_har
HARs.pvals$p.corr.gwas <- pchisq( chisq/lambda_gwas, 1, lower.tail = FALSE )
rm(chisq)

#PAR
chisq <- qchisq(PARs.pvals$V1, 1, lower.tail = FALSE)
lambda_par <- median( chisq, na.rm = TRUE) /0.454
lambda_par
PARs.pvals$p.corr.gwas <- pchisq( chisq/lambda_gwas, 1, lower.tail = FALSE )
rm(chisq)

#primateHAR
chisq <- qchisq(primateHARs.pvals$V1, 1, lower.tail = FALSE)
lambda_primateHAR <- median( chisq, na.rm = TRUE) /0.454
lambda_primateHAR
primateHARs.pvals$p.corr.gwas <- pchisq( chisq/lambda_gwas, 1, lower.tail = FALSE )
rm(chisq)

#QQ plots

source('~/Downloads/fancy_qq_plot2.R')
list.XU.etAl.HARs.DMR.NSS <- list('Primate HARs corrected' = primateHARs.pvals$p.corr.gwas, 'HARs corrected' =HARs.pvals$p.corr.gwas ,'PARs corrected' = PARs.pvals$p.corr.gwas,'Human DMRs corrected' = all_scz_dmr_ld_pvals$p.corr.gwas, 'NSS Corrected' = nss_neg_and_pvals$p.corr.gwas, 'SCZ GWAS Corrected' = scz_gwas_full$p.corr)
DMR.NSS.Xu.et.al.HARs.plot11 = qqunif.plot(list.XU.etAl.HARs.DMR.NSS, auto.key = list(corner = c(.95, .05)))
plot(DMR.NSS.Xu.et.al.HARs.plot11)
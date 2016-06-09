#Figure 3
#Comparison of DMRs with other evolutionary annotations: NSS, HARs, PARs, primateHARs

#Load up HAR, PAR, primateHAR, NSS and DMR files
#Load up SCZ GWAS lambda value


#GENOMIC CORRECTIONS
#HAR
chisq <- qchisq(HARs.pvals$V1, 1, lower.tail = FALSE)
HARs.pvals$p.corr.gwas <- pchisq( chisq/lambda_gwas, 1, lower.tail = FALSE )
rm(chisq)

#PAR
chisq <- qchisq(PARs.pvals$V1, 1, lower.tail = FALSE)
PARs.pvals$p.corr.gwas <- pchisq( chisq/lambda_gwas, 1, lower.tail = FALSE )
rm(chisq)

#primateHAR
chisq <- qchisq(primateHARs.pvals$V1, 1, lower.tail = FALSE)
primateHARs.pvals$p.corr.gwas <- pchisq( chisq/lambda_gwas, 1, lower.tail = FALSE )
rm(chisq)

#QQ plots
source('~/Downloads/fancy_qq_plot2.R')
list.HARs.DMR.NSS <- list('Primate HARs corrected' = primateHARs.pvals$p.corr.gwas, 'HARs corrected' =HARs.pvals$p.corr.gwas ,'PARs corrected' = PARs.pvals$p.corr.gwas,'Human DMRs corrected' = all_scz_dmr_ld_pvals$p.corr.gwas, 'NSS Corrected' = nss_neg_and_pvals$p.corr.gwas, 'SCZ GWAS Corrected' = scz_gwas_full$p.corr)
DMR.NSS.HARs = qqunif.plot(list.HARs.DMR.NSS, auto.key = list(corner = c(.95, .05)))
plot(DMR.NSS.Xu.et.al.HARs.plot11)
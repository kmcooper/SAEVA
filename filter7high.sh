cat $WORK/SAEVA_outputs/changes/7high3lows/1/results.txt | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \"((ANN[*].IMPACT = 'MODIFIER') | (ANN[*].IMPACT='MISSENSE'))"\  > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/filtered.vcf

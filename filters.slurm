#!/bin/sh
##SBATCH --mem-per-cpu=8192       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=filter
#SBATCH --error=filter1.%J.err
#SBATCH --output=filter1.%J.out
module load java/1.8

#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high0.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT = 'MODERATE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high0.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high1.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high1.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH')  | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high2.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high3.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE')  |(ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high3.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') | (ANN[*].IMPACT='MISSENSE') | (ANN[*].EFFECT='DOWNSTREAM'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high4.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high5.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') | (ANN[*].IMPACT='MISSENSE') | (ANN[*].EFFECT='UPSTREAM'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high5.filtered.vcf
cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_high6.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') | (ANN[*].IMPACT='MISSENSE') | (ANN[*].REGION='UPSTREAM' has ))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/high6.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_low0.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH')  | (ANN[*].IMPACT='missense_variant'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/low0.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_low1.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH')  | (ANN[*].IMPACT='missense_variant'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/low1.filtered.vcf
#cat $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/1-snpEff_low2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='missense_variant'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered/low2.filtered.vcf




#$WORK/SAEVA_softwares/snpEFF/snpEff/scripts/vcfInfoOnePerLine.pl

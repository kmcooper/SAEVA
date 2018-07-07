#!/bin/sh
##SBATCH --mem-per-cpu=8192       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update-snpEFF
#SBATCH --error=7high3lowssnpEFF2.%J.err
#SBATCH --output=7high3lowssnpEFF2.%J.out
module load java/1.8

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0000.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0001.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0002.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high2_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0003.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high3.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high3_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high3_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0004.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high4.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high4_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high4_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0005.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high5.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high5_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high5_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/high/0006.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high6.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_high6_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_high6_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/low/0000.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_low0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_low0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_low0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/low/0001.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_low1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_low1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_low1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/2/low/0002.vcf > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_low2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-gene/2-snpEff_low2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/snpEff-summary/2-snpEff_low2_summary.htmlH

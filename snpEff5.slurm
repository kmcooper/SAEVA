#!/bin/sh
##SBATCH --mem-per-cpu=8393       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update-snpEFF
#SBATCH --error=snpEFF3.%J.err
#SBATCH --output=snpEFF3.%J.out
module load java/1.8

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0000.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_high0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_high0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0001.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_high1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_high1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0002.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_high2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_high1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0003.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high3.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_high3_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_high3_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0004.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high4.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_high4_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_high4_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0005.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high5.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_high5_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_high5_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0000.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_low0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_low0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_low0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0003.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_low1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_low1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_low1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0002.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_low2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_low2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_low2_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0003.vcf > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_low3.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-gene/5-snpEff_low3_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/snpEff-summary/5-snpEff_low3_summary.html


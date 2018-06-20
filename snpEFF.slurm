#!/bin/sh
##SBATCH --time=10:00:00          # Run time in hh:mm:ss
##SBATCH --mem-per-cpu=8192       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=snpEFF
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
module load java/1.8

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0000.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_high0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0001.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_high1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0002.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_high2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high2_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0003.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high3.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_high3_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high3_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0004.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high4.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_high4_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_high4_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0000.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_low0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_low0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_low0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/low/0001.vcf > $WORK/SAEVA_outputs/snpEff_outputs/snpEff_low1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/snpEff_outputssnpEff_low1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/snpEff_outputs/snpEff_low1_summary.html

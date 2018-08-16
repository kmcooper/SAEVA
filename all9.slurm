#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=7high3low
#SBATCH --error=7high3low.%J.err
#SBATCH --output=7high3low.%J.out

## included 24,23,21,18,20,17,15 as High
## included 22,19,14 as low

module load bcftools/1.8
bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/result/changes/7high3low-2/high -n=7;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/result/changes/7high3low-2/low -n=3;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/result/changes/7high3low-2/all -n=10;

sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/changes/7high3low-2/*/*;

cd $WORK/SAEVA_outputs/result/changes/7high3low-2/all/
mkdir snpEff

module load java/1.8


java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/changes/7high3low-2/all/0000.vcf > $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/snpEff.ann.vcf
mv $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff_genes.txt $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/2-snpEff_genes-all.txt
mv $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff_summary.html $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/2-snpEff_summary-all.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/changes/7high3low-2/high/0000.vcf > $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/snpEffhigh.ann.vcf
mv $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff_genes.txt $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/2-snpEff_genes-high.txt
mv $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff_summary.html $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/2-snpEff_summary-high.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/changes/7high3low-2/low/0000.vcf > $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/snpEfflow.ann.vcf
mv $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff_genes.txt $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/2-snpEff_genes-low.txt
mv $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff_summary.html $WORK/SAEVA_outputs/result/changes/7high3low-2/all/snpEff/2-snpEff_summary-low.html

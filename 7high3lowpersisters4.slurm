#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=persisters4.%J.err
#SBATCH --output=persisters4.%J.out


## included 24,23,21,18,20,17,15 as High
## included 22,14,16 as low

module load bcftools/1.8


bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/changes/7high3lows/4/high -n=7;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/changes/7high3lows/4/low -n=3;

sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0000.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0001.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0002.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0003.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0004.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0005.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/high/0006.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/low/0000.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/low/0001.vcf; 
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/7high3lows/4/low/0002.vcf;

module load java/1.8
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0000.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high0_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0001.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high1_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0002.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high2_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0003.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high3.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high3_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high3_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0004.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high4.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high4_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high4_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0005.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high5.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high5_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high5_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/high/0006.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high6.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_high6_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_high6_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/low/0000.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_low0.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_low0_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_low0_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/low/0001.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_low1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_low1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_low1_summary.html
	

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/changes/7high3lows/4/low/0002.vcf > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_low2.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-gene/4-snpEff_low2_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/snpEff-summary/4-snpEff_low2_summary.html

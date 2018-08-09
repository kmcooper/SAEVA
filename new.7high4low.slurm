#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=new_persisters
#SBATCH --error=new_persisters.%J.err
#SBATCH --output=new_persisters.%J.out
cd $WORK/SAEVA_outputs/
mkdir new
cd new
mkdir outputs
module load bcftools/1.8
bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/new/high -n=7;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/new/low -n4;


######################################################################################################################
######################### change chr in vcf file to Chromosome which is acceptable via snpEff ####################################
######################################################################################################################

sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0000.vcf; 
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0001.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0002.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0003.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0004.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0005.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0006.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0000.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0001.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0002.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0003.vcf;
######################################################################################################################
########################### make directories for snpEff output file, genes and summary of analysis #############################
######################################################################################################################
cd $WORK/SAEVA_outputs/new/
mkdir snpEff
cd snpEff
mkdir snpEff-gene
mkdir snpEff-summary
module load java/1.8
######################################################################################################################
##################### make snpEff annotation and change the Chromosome column of each file to it’s name #########################
######################################################################################################################
java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/0000.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-HSS12071M1.ann.vcf;
sed -i 's/^Chromosome/high-HSS12071M1/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-HSS12071M1.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-HSS12071M1-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-HSS12071M1-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/0001.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman99624A1_S20.ann.vcf;
sed -i 's/^Chromosome/high-Silverman99624A1_S20/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman99624A1_S20.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman99624A1_S20-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman99624A1_S20-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/0002.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf;
sed -i 's/^Chromosome/high-Silverman37712B1_S21/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman37712B1_S21-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman37712B1_S21-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/0003.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf;
sed -i 's/^Chromosome/high-Silverman99382M1_S15/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman99382M1_S15-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman99382M1_S15-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/0004.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf;
sed -i 's/^Chromosome/high-Silverman62129B1_S17/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman62129B1_S17-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman62129B1_S17-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/0005.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf;
sed -i 's/^Chromosome/high-Silverman60383B1_S18/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman60383B1_S18-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman60383B1_S18-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/high/00006.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman79414A1_S23.ann.vcf;
sed -i 's/^Chromosome/high-Silverman79414A1_S23/' $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman79414A1_S23.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman79414A1_S23-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman79414A1_S23-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/low/0000.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf;
sed -i 's/^Chromosome/low-Silverman93954A1_S19/' $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman93954A1_S19-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman93954A1_S19-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/low/0001.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEfflow-Silverman99624D1_S16.ann.vcf;
sed -i 's/^Chromosome/low-Silverman99624D1_S16 /' $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman99624D1_S16.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman99624D1_S16-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman99624D1_S16-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/low/0002.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman94232M1_S14.ann.vcf;
sed -i 's/^Chromosome/low-Silverman94232M1_S14/' $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman94232M1_S14.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman94232M1_S14-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman94232M1_S14-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/low/0003.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf;
sed -i 's/^Chromosome/low-Silverman99382B1_S22/' $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf;
mv $WORK/SAEVA/snpEff-genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman99382B1_S22-genes.txt;
mv $WORK/SAEVAsnpEff-summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman99382B1_S22-summary.html;


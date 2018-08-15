#!/bin/sh
#SBATCH --time=02:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=snpEff1-7high3low
#SBATCH --error=snpEff1-7high3low.%J.err
#SBATCH --output=snpEff1-7high3low.%J.out
cd $WORK/SAEVA_outputs/
mkdir result


## included 24,23,21,18,20,17,15 as High
## included 22,19,16 as low

module load bcftools/1.8
bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/output/high -n=7;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/output/low -n4;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/output/combine -n=11;


######################################################################################################################
######################### change chr in vcf file to Chromosome which is acceptable via snpEff ####################################
######################################################################################################################
cp $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-HSS12071M1.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-HSS12071M1.vcf; 
cp $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-Silverman79414A1_S23.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-Silverman79414A1_S23.vcf;  
cp $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-Silverman37712B1_S21.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-Silverman37712B1_S21.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-Silverman99624A1_S20.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-Silverman99624A1_S20.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-Silverman60383B1_S18.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-Silverman60383B1_S18.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-Silverman62129B1_S17.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-Silverman62129B1_S17.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/high-Silverman99382M1_S15.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/high-Silverman99382M1_S15.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/low-Silverman99382B1_S22.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/low-Silverman99382B1_S22.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/low-Silverman93954A1_S19.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/low-Silverman93954A1_S19.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/low-Silverman99624D1_S16.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/low-Silverman99624D1_S16.vcf;
cp $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/result/low-Silverman94232M1_S14.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/result/low-Silverman94232M1_S14.vcf;
######################################################################################################################
########################### make directories for snpEff output file, genes and summary of analysis #############################
######################################################################################################################
mkdir snpEff
cd snpEff
mkdir snpEff-gene
mkdir snpEff-summary
module load java/1.8
######################################################################################################################
##################### make snpEff annotation and change the Chromosome column of each file to it's name #########################
######################################################################################################################
java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high-HSS12071M1.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-HSS12071M1.ann.vcf;
sed -i 's/^Chromosome/high-HSS12071M1/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-HSS12071M1.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-HSS12071M1-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-HSS12071M1-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high-Silverman79414A1_S23.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman79414A1_S23.ann.vcf;
sed -i 's/^Chromosome/high-Silverman79414A1_S23/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman79414A1_S23.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-Silverman79414A1_S23-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-Silverman79414A1_S23-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high/0002.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf;
sed -i 's/^Chromosome/high-Silverman37712B1_S21/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-Silverman37712B1_S21-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-Silverman37712B1_S21-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high/0003.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman99624A1_S20.ann.vcf;
sed -i 's/^Chromosome/high-Silverman99624A1_S20/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman99624A1_S20.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-Silverman99624A1_S20-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-Silverman99624A1_S20-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high/0004.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf;
sed -i 's/^Chromosome/high-Silverman60383B1_S18/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-Silverman60383B1_S18-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-Silverman60383B1_S18-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high/0005.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf;
sed -i 's/^Chromosome/high-Silverman62129B1_S17/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-Silverman62129B1_S17-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-Silverman62129B1_S17-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/high/0006.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf;
sed -i 's/^Chromosome/high-Silverman99382M1_S15/' $WORK/SAEVA_outputs/result/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-high-Silverman99382M1_S15-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-high-Silverman99382M1_S15-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/low/0000.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf;
sed -i 's/^Chromosome/low-Silverman99382B1_S22/' $WORK/SAEVA_outputs/result/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-low-Silverman99382B1_S22-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-low-Silverman99382B1_S22-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/low/0001.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf;
sed -i 's/^Chromosome/low-Silverman93954A1_S19/' $WORK/SAEVA_outputs/result/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-low-Silverman93954A1_S19-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-low-Silverman93954A1_S19-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/result/low/0002.vcf > $WORK/SAEVA_outputs/result/snpEff/snpEff-low-Silverman99624D1_S16.ann.vcf;
sed -i 's/^Chromosome/low-Silverman99624D1_S16/' $WORK/SAEVA_outputs/result/snpEff/snpEff-low-Silverman99624D1_S16.ann.vcf;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_genes.txt $WORK/SAEVA_outputs/result/snpEff/snpEff-gene/snpEff-low-Silverman99624D1_S16-genes.txt;
mv $WORK/SAEVA_outputs/result/snpEff/snpEff_summary.html $WORK/SAEVA_outputs/result/snpEff/snpEff-summary/snpEff-low-Silverman99624D1_S16-summary.html;

################################################################################################################################################
###########################################            combine to find common genes                ######################################
cd $WORK/SAEVA_outputs/new/ 
mkdir textfile
###############               merge all files together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/result/snpEff/*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/result/combined7high4low.vcf;
cat $WORK/SAEVA_outputs/result/combined7high4low.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/result/clean-combined7high4low.vcf;
cp $WORK/SAEVA_outputs/result/clean-combined7high4low.vcf $WORK/SAEVA_outputs/result/clean-combined7high4low.txt;

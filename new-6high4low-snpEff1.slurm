#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=snpEff1-6high4low
#SBATCH --error=snpEff1-6high4low.%J.err
#SBATCH --output=snpEff1-6high4low.%J.out
cd $WORK/SAEVA_outputs/new/
mkdir 6high4low
cd 6high4low
mkdir 1

## included 24,21,20,18,17,15 as High
## included 22,19,16,14 as low

module load bcftools/1.8
bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/new/6high4low/1/high -n=6;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/new/6high4low/1/low -n=4;


######################################################################################################################
######################### change chr in vcf file to Chromosome which is acceptable via snpEff ####################################
######################################################################################################################

sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/high/0000.vcf; 
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/high/0001.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/high/0002.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/high/0003.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/high/0004.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/high/0005.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/low/0000.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/low/0001.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/low/0002.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/6high4low/1/low/0003.vcf;
######################################################################################################################
########################### make directories for snpEff output file, genes and summary of analysis #############################
######################################################################################################################
cd 1
mkdir snpEff
cd snpEff
mkdir snpEff-gene
mkdir snpEff-summary
module load java/1.8
######################################################################################################################
##################### make snpEff annotation and change the Chromosome column of each file to it’s name #########################
######################################################################################################################
java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/high/0000.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-HSS12071M1.ann.vcf;
sed -i 's/^Chromosome/high-HSS12071M1/' $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-HSS12071M1.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-high-HSS12071M1-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-high-HSS12071M1-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/high/0001.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf;
sed -i 's/^Chromosome/high-Silverman37712B1_S21/' $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-high-Silverman37712B1_S21-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-high-Silverman37712B1_S21-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/high/0002.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman99624A1_S20.ann.vcf;
sed -i 's/^Chromosome/high-Silverman99624A1_S20/' $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman99624A1_S20.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-high-Silverman99624A1_S20-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-high-Silverman99624A1_S20-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/high/0003.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf;
sed -i 's/^Chromosome/high-Silverman60383B1_S18/' $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-high-Silverman60383B1_S18-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-high-Silverman60383B1_S18-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/7high3lows/1/high/0004.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf;
sed -i 's/^Chromosome/high-Silverman62129B1_S17/' $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-high-Silverman62129B1_S17-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-high-Silverman62129B1_S17-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/high/0005.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf;
sed -i 's/^Chromosome/high-Silverman99382M1_S15/' $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-high-Silverman99382M1_S15-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-high-Silverman99382M1_S15-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/low/0000.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf;
sed -i 's/^Chromosome/low-Silverman99382B1_S22/' $WORK/SAEVA_outputs/new/new/6high4low/3/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-low-Silverman99382B1_S22-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-low-Silverman99382B1_S22-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/low/0001.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf;
sed -i 's/^Chromosome/low-Silverman93954A1_S19/' $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-low-Silverman93954A1_S19-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-low-Silverman93954A1_S19-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/low/0002.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-low-Silverman99624D1_S16.ann.vcf;
sed -i 's/^Chromosome/low-Silverman99624D1_S16/' $WORK/SAEVA_outputs/new/6high4low/3/snpEff/snpEff-low-Silverman99624D1_S16.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-low-Silverman99624D1_S16-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-low-Silverman99624D1_S16-summary.html;

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/6high4low/1/low/0003.vcf > $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-low-Silverman94232M1_S14.ann.vcf;
sed -i 's/^Chromosome/low-Silverman94232M1_S14/' $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman94232M1_S14.ann.vcf;
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-gene/snpEff-low-Silverman94232M1_S14-genes.txt;
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/6high4low/1/snpEff/snpEff-summary/snpEff-low-Silverman94232M1_S14-summary.html;

################################################################################################################################################
###########################################            combine to find common genes                ######################################
cd $WORK/SAEVA_outputs/new/ 
mkdir textfile
###############               merge all files together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/6high4low/1/snpEff/*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined6high4low-1.vcf;
cat $WORK/SAEVA_outputs/new/combined6high4low-1.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/clean-combined6high4low-1.vcf;
cp $WORK/SAEVA_outputs/new/clean-combined6high4low-1.vcf $WORK/SAEVA_outputs/new/textfile/clean-combined6high4low-1.txt;
################################################################################################################
###############               merge all highs together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/6high4low/1/snpEff/*high*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/textfile/combined6high-1.vcf;
cat $WORK/SAEVA_outputs/new/combined6high-1.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/clean-combined6high-1.vcf;
cp $WORK/SAEVA_outputs/new/clean-combined6high-1.vcf $WORK/SAEVA_outputs/new/textfile/clean-combined6high-1.txt;
################################################################################################################
###############               merge all lows together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/6high4low/1/snpEff/*low*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/textfile/combined4low-1.vcf;
cat $WORK/SAEVA_outputs/new/combined4low-1.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/clean-combined4low-1.vcf;
cp $WORK/SAEVA_outputs/new/clean-combined4low-1.vcf $WORK/SAEVA_outputs/new/textfile/clean-combined4low-1.txt;


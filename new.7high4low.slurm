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

bcftools annotate -c ID -a Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf> na12878_q20_annot.vcf

java -jar /work/biocore/kimia/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar annotate -dbsnp $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf > $WORK/SAEVA_outputs/new/x.dbSnp.vcf


sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0000.vcf; 
cp $WORK/SAEVA_outputs/new/high/0000.vcf $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0001.vcf;
cp $WORK/SAEVA_outputs/new/high/0001.vcf $WORK/SAEVA_outputs/new/outputs/high-Silverman99624A1_S20.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0002.vcf;
cp $WORK/SAEVA_outputs/new/high/0002.vcf $WORK/SAEVA_outputs/new/outputs/high-Silverman37712B1_S21.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0003.vcf;
cp $WORK/SAEVA_outputs/new/high/0003.vcf $WORK/SAEVA_outputs/new/outputs/high-Silverman99382M1_S15.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0004.vcf;
cp $WORK/SAEVA_outputs/new/high/0004.vcf $WORK/SAEVA_outputs/new/outputs/high-Silverman62129B1_S17.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0005.vcf;
cp $WORK/SAEVA_outputs/new/high/0005.vcf $WORK/SAEVA_outputs/new/outputs/high-Silverman60383B1_S18.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/high/0006.vcf;
cp $WORK/SAEVA_outputs/new/high/0006.vcf $WORK/SAEVA_outputs/new/outputs/high-Silverman79414A1_S23.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0000.vcf;
cp $WORK/SAEVA_outputs/new/high/0000.vcf $WORK/SAEVA_outputs/new/outputs/low-Silverman93954A1_S19.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0001.vcf;
cp $WORK/SAEVA_outputs/new/high/0001.vcf $WORK/SAEVA_outputs/new/outputs/low-Silverman99624D1_S16.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0002.vcf;
cp $WORK/SAEVA_outputs/new/high/0002.vcf $WORK/SAEVA_outputs/new/outputs/low-Silverman94232M1_S14.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/new/low/0003.vcf;
cp $WORK/SAEVA_outputs/new/high/0003.vcf $WORK/SAEVA_outputs/new/outputs/low-Silverman99382B1_S22.vcf;

cd $WORK/SAEVA_outputs/new/
mkdir snpEff
module load java/1.8

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-HSS12071M1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-HSS12071M1_genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-HSS12071M1_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-Silverman99624A1_S20.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff- high-Silverman99624A1_S20.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman99624A1_S20 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman99624A1_S20 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-Silverman37712B1_S21.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman37712B1_S21.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman37712B1_S21 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman37712B1_S21 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-Silverman99382M1_S15.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman99382M1_S15.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman99382M1_S15 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman99382M1_S15 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-Silverman62129B1_S17.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman62129B1_S17.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman62129B1_S17 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman62129B1_S17 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-Silverman60383B1_S18.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman60383B1_S18.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman60383B1_S18 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman60383B1_S18 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/high-Silverman79414A1_S23.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-high-Silverman79414A1_S23.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-high-Silverman79414A1_S23 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-high-Silverman79414A1_S23 _summary.html


java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/low-Silverman93954A1_S19.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman93954A1_S19.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman93954A1_S19 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman93954A1_S19 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/low-Silverman99624D1_S16.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff_low1.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman99624D1_S16 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman99624D1_S16 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/low-Silverman94232M1_S14.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff- lowSilverman94232M1_S14.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman94232M1_S14 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman94232M1_S14 _summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA_outputs/new/outputs/low-Silverman99382B1_S22.vcf > $WORK/SAEVA_outputs/new/snpEff/snpEff-low-Silverman99382B1_S22.ann.vcf
mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA_outputs/new/snpEff/snpEff-gene/snpEff-low-Silverman99382B1_S22 _genes.txt
mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA_outputs/new/snpEff/snpEff-summary/snpEff-low-Silverman99382B1_S22 _summary.html


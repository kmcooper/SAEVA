#!/bin/sh
#SBATCH --time=02:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=BCFTools
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

module load bcftools/1.8

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/HSS12071M1.vcf > $WORK/vcffilterq5000/HSS12071M1_q5000.vcf 
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/HSS12071M1_q5000.vcf > $WORK/vcffilterq5000-dp250/HSS12071M1_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/HSS12071M1_q5000_dp250.vcf >$WORK/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman99624D1_S16.vcf > $WORK/vcffilterq5000/Silverman99624D1_S16_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman99624D1_S16_q5000.vcf >$WORK/vcffilterq5000-dp250/Silverman99624D1_S16_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman99624D1_S16_q5000_dp250.vcf >$WORK/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman37712B1_S21.vcf > $WORK/vcffilterq5000/Silverman37712B1_S21_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman37712B1_S21_q5000.vcf > $WORK/vcffilterq5000-dp250/Silverman37712B1_S21_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman37712B1_S21_q5000_dp250.vcf >$WORK/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman62129B1_S17.vcf >  $WORK/vcffilterq5000/Silverman62129B1_S17_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman62129B1_S17_q5000.vcf > $WORK/vcffilterq5000-dp250/Silverman62129B1_S17_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman62129B1_S17_q5000_dp250.vcf >$WORK/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman93954A1_S19.vcf > $WORK/vcffilterq5000/Silverman93954A1_S19_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman93954A1_S19_q5000.vcf >$WORK/vcffilterq5000-dp250/Silverman93954A1_S19_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman93954A1_S19_q5000_dp250.vcf >$WORK/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman99382B1_S22.vcf > $WORK/vcffilterq5000/Silverman99382B1_S22_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman99382B1_S22_q5000.vcf >$WORK/vcffilterq5000-dp250/Silverman99382B1_S22_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman99382B1_S22_q5000_dp250.vcf >$WORK/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman99624A1_S20.vcf > $WORK/vcffilterq5000/Silverman99624A1_S20_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman99624A1_S20_q5000.vcf >$WORK/vcffilterq5000-dp250/Silverman99624A1_S20_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman99624A1_S20_q5000_dp250.vcf >$WORK/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman60383B1_S18.vcf > $WORK/vcffilterq5000/Silverman60383B1_S18_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman60383B1_S18_q5000.vcf >$WORK/vcffilterq5000-dp250/Silverman60383B1_S18_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman60383B1_S18_q5000_dp250.vcf >$WORK/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman79414A1_S23.vcf > $WORK/vcffilterq5000/Silverman79414A1_S23_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman79414A1_S23_q5000.vcf > $WORK/vcffilterq5000-dp250/Silverman79414A1_S23_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman79414A1_S23_q5000_dp250.vcf >$WORK/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz;


$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman94232M1_S14.vcf > $WORK/vcffilterq5000/Silverman94232M1_S14_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman94232M1_S14_q5000.vcf > $WORK/vcffilterq5000-dp250/Silverman94232M1_S14_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman94232M1_S14_q5000_dp250.vcf > $WORK/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz;

$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman99382M1_S15.vcf > $WORK/vcffilterq5000/Silverman99382M1_S15_q5000.vcf
$WORK/softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/vcffilterq5000/Silverman99382M1_S15_q5000.vcf > $WORK/vcffilterq5000-dp250/Silverman99382M1_S15_q5000_dp250.vcf;
bcftools view -Ob $WORK/vcffilterq5000-dp250/Silverman99382M1_S15_q5000_dp250.vcf > $WORK/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz;
bcftools index $WORK/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz;

#!/bin/sh
#SBATCH --time=20:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=4096      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=BCFTools
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

module load bcftools/1.8

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/HSS12071M1.vcf > $WORKSAEVA_outputs/vcffilterq5000/HSS12071M1_q5000.vcf 
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/HSS12071M1_q5000.vcf > $WORK/SAEVA_outputs/vcffilterq5000-dp250/HSS12071M1_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/HSS12071M1_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman99624D1_S16.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman99624D1_S16_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman99624D1_S16_q5000.vcf >$WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99624D1_S16_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99624D1_S16_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman37712B1_S21.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman37712B1_S21_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman37712B1_S21_q5000.vcf > $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman37712B1_S21_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman37712B1_S21_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/freebayesoutput/Silverman62129B1_S17.vcf >  $WORK/SAEVA_outputs/vcffilterq5000/Silverman62129B1_S17_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman62129B1_S17_q5000.vcf > $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman62129B1_S17_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman62129B1_S17_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman93954A1_S19.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman93954A1_S19_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/SAEVA_outputs/vcffilterq5000/Silverman93954A1_S19_q5000.vcf >$WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman93954A1_S19_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman93954A1_S19_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman99382B1_S22.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman99382B1_S22_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman99382B1_S22_q5000.vcf >$WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99382B1_S22_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99382B1_S22_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman99624A1_S20.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman99624A1_S20_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman99624A1_S20_q5000.vcf >$WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99624A1_S20_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99624A1_S20_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman60383B1_S18.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman60383B1_S18_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman60383B1_S18_q5000.vcf >$WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman60383B1_S18_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman60383B1_S18_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman79414A1_S23.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman79414A1_S23_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman79414A1_S23_q5000.vcf > $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman79414A1_S23_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman79414A1_S23_q5000_dp250.vcf >$WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz;


$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman94232M1_S14.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman94232M1_S14_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman94232M1_S14_q5000.vcf > $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman94232M1_S14_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman94232M1_S14_q5000_dp250.vcf > $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz;

$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA_outputs/freebayesoutput/Silverman99382M1_S15.vcf > $WORK/SAEVA_outputs/vcffilterq5000/Silverman99382M1_S15_q5000.vcf
$WORK/SAEVA_softwares/freebayes/freebayes/vcflib/bin/vcffilter -f "DP > 250" $WORK/SAEVA_outputs/vcffilterq5000/Silverman99382M1_S15_q5000.vcf > $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99382M1_S15_q5000_dp250.vcf;
bcftools view -Ob $WORK/SAEVA_outputs/vcffilterq5000-dp250/Silverman99382M1_S15_q5000_dp250.vcf > $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz;
bcftools index $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz;

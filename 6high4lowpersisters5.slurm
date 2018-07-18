#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=persisters.%J.err
#SBATCH --output=persisters.%J.out

## included 24,23,21,20,18,17 as High
## included 22,19,16,14 as low

module load bcftools/1.8
bcftools isec $WORK/SAEVA_outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/changes/6highs4lows/3/high -n=6;

bcftools isec $WORK/SAEVA_outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz $WORK/SAEVA_outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz -p $WORK/SAEVA_outputs/changes/6highs4lows/4/low -n=4;

sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0000.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0001.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0002.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0003.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0004.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/high/0005.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0000.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0001.vcf; 
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0002.vcf; 
sed -i 's/^chr/Chromosome/' $WORK/SAEVA_outputs/changes/6highs4lows/5/low/0003.vcf; 

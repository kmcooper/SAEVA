#!/bin/sh
#SBATCH --time=2:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=persisters
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

module load bcftools/1.8

bcftools isec $WORK/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz -p high -n=5;

bcftools isec $WORK/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz -p low -n=2 ;



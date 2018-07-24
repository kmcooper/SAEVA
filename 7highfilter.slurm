#!/bin/sh
##SBATCH --mem-per-cpu=8192       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=filter7high
#SBATCH --error=filter7high.%J.err
#SBATCH --output=filter7high.%J.out
module load java/1.8

cat $WORK/SAEVA_outputs/update/resultshigh.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT = 'MODERATE')| (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/7highfiltered.vcf


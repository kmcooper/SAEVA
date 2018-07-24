#!/bin/sh
##SBATCH --mem-per-cpu=8192       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=filter
#SBATCH --error=filter1.%J.err
#SBATCH --output=filter1.%J.out
module load java/1.8
cat $WORK/SAEVA_outputs/changes/7high3lows/1/results.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter " ANN[*].IMPACT='MISSENSE' " > $WORK/SAEVA_outputs/changes/7high3lows/1/filtered.vcf;

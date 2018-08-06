#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=java
#SBATCH --error=java.%J.err
#SBATCH --output=java.%J.out

module load java/1.8
java -Xmx4g -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar -download;
#java -Xmx4g -jar snpEff.jar databasejava -Xmx4g -jar /work/biocore/kimia/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar annotate -dbsnp $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf > $WORK/SAEVA_outputs/new/x.dbSnp.vcf


#cat $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar annotate -dbsnp $WORK/SAEVA_outputs/new/outputs/high-HSS12071M1.vcf > $WORK/SAEVA_outputs/new/x.dbSnp.vcf

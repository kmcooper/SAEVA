#!/bin/sh
#SBATCH --time=01:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=8192      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=4low-filters
#SBATCH --error=4low-filters.%J.err
#SBATCH --output=4low-filters.%J.out

module load java/1.8
################                             make approporiate directory               #########
cd $WORK/SAEVA_outputs/new/
mkdir filter
cd $WORK/SAEVA_outputs/new/snpEff/ 
###############               merge all files together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/snpEff/*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined7high4low.vcf;


cat $WORK/SAEVA_outputs/new/combined7high4low.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='LOW')"\ > $WORK/SAEVA_outputs/new/filter/low-combined7high4low.filter.vcf;
cat $WORK/SAEVA_outputs/new/filter/low-combined7high4low.filter.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/filter/clean-lowimpact-combined7high4low.vcf;
rm $WORK/SAEVA_outputs/new/filter/low-combined7high4low.filter.vcf;

################################################################################################################
###############               merge all highs together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/snpEff/*high*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined7high.vcf;

################################################################################################################
###############               merge all lows together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/snpEff/*low*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined4low.vcf;

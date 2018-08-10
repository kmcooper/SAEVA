#!/bin/sh
#SBATCH --time=01:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=4096      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=new-common
#SBATCH --error=new-common.%J.err
#SBATCH --output=new-common.%J.out
module load java/1.8
################                             make approporiate directory               #########

cd $WORK/SAEVA_outputs/new/snpEff/ 
mkdir textfile
###############               merge all files together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/snpEff/*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined7high4low.vcf;
cat $WORK/SAEVA_outputs/new/combined7high4low.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/clean-combined7high4low.vcf;
cp $WORK/SAEVA_outputs/new/combined7high4low.vcf $WORK/SAEVA_outputs/new/textfile/clean-combined7high4low.txt;
################################################################################################################
###############               merge all highs together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/snpEff/*high*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined7high.vcf;
cat $WORK/SAEVA_outputs/new/combined7high.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/clean-combined7high.vcf;
cp $WORK/SAEVA_outputs/new/clean-combined4low.vcf $WORK/SAEVA_outputs/new/textfile/clean-combined7high.txt;
################################################################################################################
###############               merge all lows together,remove headers and sort based on positions      #########
cat $WORK/SAEVA_outputs/new/snpEff/*low*.vcf | sort -k2,2 | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/new/combined4low.vcf;
cat $WORK/SAEVA_outputs/new/combined4low.vcf|grep -v '##' |cut -f1,2,4,5,6,8| sed 's/AB=.*;ANN=/ANN=/'> $WORK/SAEVA_outputs/new/clean-combined4low.vcf;
cp $WORK/SAEVA_outputs/new/clean-combined4low.vcf $WORK/SAEVA_outputs/new/textfile/clean-combined4low.txt;

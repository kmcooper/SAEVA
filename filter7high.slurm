#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=update_persisters.%J.err
#SBATCH --output=update_persisters.%J.out
module load java/1.8

cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
echo `pwd`
cat *_high*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined7high.vcf;
cat $WORK/SAEVA_outputs/update/combinedhigh.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlineshigh7.txt
result=$(cat $WORK/SAEVA_outputs/update/countlineshigh7.txt |grep -w "7"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/combined7high.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/common7high.ann.vcf

cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))" \ > $WORK/SAEVA_outputs/update/filter/high-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))" \ > $WORK/SAEVA_outputs/update/filter/moderate-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))" \ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-7high.filter.vcf;



#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=update_persisters.%J.err
#SBATCH --output=update_persisters.%J.out
module load java/1.8

cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
echo `pwd`
cat *_low*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined4low.vcf;
cat $WORK/SAEVA_outputs/update/combinedhigh.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines4low.txt
result=$(cat $WORK/SAEVA_outputs/update/countlines4low.txt |grep -w "4"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/combined4low.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/common4low.ann.vcf
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))" \ > $WORK/SAEVA_outputs/update/filter/high-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))" \ > $WORK/SAEVA_outputs/update/filter/moderate-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))" \ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-4low.filter.vcf;


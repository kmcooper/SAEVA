#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=4low-filters.%J.err
#SBATCH --output=4low-filters.%J.out
module load java/1.8

cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
echo `pwd`
cat *low*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined4low.vcf;
cat $WORK/SAEVA_outputs/update/combined4low.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines4low.txt;
result=$(cat $WORK/SAEVA_outputs/update/countlines4low.txt |grep -w "4"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/combined4low.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results4low.vcf;
filter=$(cat $WORK/SAEVA_outputs/update/results4low.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_low0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/update/tempcommon4low.ann.vcf;
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_low0.ann.vcf | grep '##'>header.vcf;
cat $WORK/SAEVA_outputs/update/header.vcf $WORK/SAEVA_outputs/update/tempcommon4low.ann.vcf> $WORK/SAEVA_outputs/update/common4low.ann.vcf;
rm $WORK/SAEVA_outputs/update/header.vcf
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-misssens-4low.filter.vcf;

cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/update/filter/modifier-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/moderate-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-4low.filter.vcf;

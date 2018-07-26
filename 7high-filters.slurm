#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=7high-filters
#SBATCH --error=7high-filters.%J.err
#SBATCH --output=7high-filters.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/update/
mkdir filter
cd update-snpEff_outputs/
echo `pwd`
cat *high*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined7high.vcf;
cat $WORK/SAEVA_outputs/update/combined7high.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines7high.txt;
result=$(cat $WORK/SAEVA_outputs/update/countlines7high.txt |grep -w "7"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/combined7high.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results7high.vcf;
filter=$(cat $WORK/SAEVA_outputs/update/results7high.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/update/tempcommon7high.ann.vcf;
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/update/header.vcf;
cat $WORK/SAEVA_outputs/update/header.vcf $WORK/SAEVA_outputs/update/tempcommon7high.ann.vcf> $WORK/SAEVA_outputs/update/common7high.ann.vcf;
rm $WORK/SAEVA_outputs/update/header.vcf
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-misssens-7high.filter.vcf;

cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/update/filter/modifier-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/moderate-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/update/filter/misssens-7high.filter.vcf;

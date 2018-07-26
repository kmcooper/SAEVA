#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=7high-4low-filters.%J.err
#SBATCH --output=7high-4low-filters.%J.out
module load java/1.8

cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined.vcf;
cat $WORK/SAEVA_outputs/update/combined.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines.txt;
result=$(cat $WORK/SAEVA_outputs/update/countlines7high.txt |grep -w "11"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/combined.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results7high.vcf;
filter=$(cat $WORK/SAEVA_outputs/update/results.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/update/tempcommon.ann.vcf;
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/update/header.vcf;
cat $WORK/SAEVA_outputs/update/header.vcf $WORK/SAEVA_outputs/update/tempcommon.ann.vcf> $WORK/SAEVA_outputs/update/common.ann.vcf;
rm $WORK/SAEVA_outputs/update/header.vcf

cat $WORK/SAEVA_outputs/update/common.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/update/filter/high-moderate-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-moderate-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-moderate-common.txt;
cat $WORK/SAEVA_outputs/update/common.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/update/filter/modifier-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-common.txt;
cat $WORK/SAEVA_outputs/update/common.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-misssens-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-misssens-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-misssens-common.txt;
cat $WORK/SAEVA_outputs/update/common.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/moderate-misssens-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-misssens-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-misssens-common.txt;
cat $WORK/SAEVA_outputs/update/common.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-misssens-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-misssens-common.txt;
cat $WORK/SAEVA_outputs/update/common.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-misssens-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-misssens-common.txt;
cat $WORK/SAEVA_outputs/update/common.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/update/filter/misssens-common.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/misssens-common.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/misssens-common.txt;

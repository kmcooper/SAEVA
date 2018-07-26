#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=7high-3low-filter4.%J.err
#SBATCH --output=7high-3low-filter4.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/changes/7high3lows/4/
mkdir filter
cd snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/combined-7high3lows.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/combined-7high3lows.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/countlines-7high3lows.txt;
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/countlines-7high3lows.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/combined-7high3lows.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/results-7high3lows.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/results-7high3lows.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/tempcommon-7high3lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/header.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/header.vcf $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/tempcommon7high.ann.vcf> $WORK/SAEVA_outputs/update/common-7high3lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/header.vcf
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-misssens-7high3lows.filter.vcf;

cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/modifier-7high3lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-misssens-7high3lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/moderate-misssens-7high3lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-and-misssens-7high3lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-7high3lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/misssens-7high3lows.filter.vcf;
####################################################################################

##################################################
cat *low*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/combined-lows-7high3lows.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/combined-7high3lows-lows.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/countlines-7high3lows.txt;
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/countlines-lows-7high3lows.txt |grep -w "3"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/combined-lows-7high3lows.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/results-7high3lows.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/results-lows-7high3lows.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_low0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/tempcommon-7high3lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/4-snpEff_low0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/header.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/header.vcf $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/tempcommon7high.ann.vcf> $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-7high3lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/header.vcf
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-misssens-lows.filter.vcf;

cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/modifier-lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-misssens-lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/moderate-misssens-lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-and-misssens-lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/high-lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/common-lows-7high3lows.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/7high3lows/4/filter/misssens-lows.filter.vcf;


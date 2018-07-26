#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=update_persisters
#SBATCH --error=6high-4lows-filter3.%J.err
#SBATCH --output=6high-4lows-filter3.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/changes/6highs4lows/5/
mkdir filter
cd snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/combined-6highs4lows.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/combined-6highs4lows.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/countlines-6highs4lows.txt;
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/countlines-6highs4lows.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/combined-6highs4lows.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/results-6highs4lows.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/results-6highs4lows.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/tempcommon-6highs4lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/header.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/header.vcf $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/tempcommon7high.ann.vcf> $WORK/SAEVA_outputs/update/common-6highs4lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/header.vcf
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-misssens-6highs4lows.filter.vcf;

cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/modifier-6highs4lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-misssens-6highs4lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/moderate-misssens-6highs4lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-and-misssens-6highs4lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-6highs4lows.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/misssens-6highs4lows.filter.vcf;
####################################################################################
### for highs###
##################################################
cat *high*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/combined-high-6highs4lows.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/combined-6highs4lows-high.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/countlines-6highs4lows.txt;
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/countlines-high-6highs4lows.txt |grep -w "6"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/combined-high-6highs4lows.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/results-6highs4lows.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/results-high-6highs4lows.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/tempcommon-6highs4lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/5-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/header.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/header.vcf $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/tempcommon7high.ann.vcf> $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-6highs4lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/header.vcf
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-misssens-high.filter.vcf;

cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/modifier-high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-misssens-high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/moderate-misssens-high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-and-misssens-high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/high-high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/5/snpEff_outputs/common-high-6highs4lows.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/5/filter/misssens-high.filter.vcf;


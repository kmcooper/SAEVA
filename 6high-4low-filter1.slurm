#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=6high-4lows-filter1
#SBATCH --error=6high-4lows-filter1.%J.err
#SBATCH --output=6high-4lows-filter1.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/changes/6highs4lows/1/
mkdir filter
cd filter
mkdir textfiles
cd ../
cd snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/combined-6highs4lows.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/combined-6highs4lows.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/1/countlines-6highs4lows.txt;
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/1 /countlines-6highs4lows.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/combined-6highs4lows.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/1 /results-6highs4lows.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/1 /results-6highs4lows.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/1-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/6highs4lows/1/tempcommon-6highs4lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/1-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/6highs4lows/1 /header.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1 /header.vcf $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/tempcommon7high.ann.vcf> $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/6highs4lows/1 /header.vcf
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-moderate-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-moderate-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-moderate-4low.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/modifier-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1//filter/modifier-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/modifier-4low.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-misssens-4low.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/filter/moderate-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/moderate-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/moderate-misssens-4low.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-misssens-7high.filter.vcf | grep -v '##' >$WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-misssens-4low.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-and-misssens-4low.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/common-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/misssens-4low.txt;

####################################################################################
### for highs###
##################################################
cat *high*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/6highs4lows/1/combined-6highs4lows-high.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined-6highs4lows-high.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/1/countlines-6highs4lows-high.txt;
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/1/countlines-6highs4lows-high.txt |grep -w "6"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined-6highs4lows-high.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/results--6highs4lows-high.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/1/results--6highs4lows-high.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/1-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/temphigh-6highs4lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/1-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/6highs4lows/1/header.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/header.vcf $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/temphigh-6highs4lows.ann.vcf> $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/6highs4lows/1/header.vcf

cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-moderate-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-moderate-6high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-moderate-6high.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/modifier-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1//filter/modifier-6high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/modifier-6high.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-misssens-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-misssens-6high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-misssens-6high.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/filter/moderate-misssens-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/moderate-misssens-6high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/moderate-misssens-6high.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') | (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-and-misssens-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-misssens-6high.filter.vcf | grep -v '##' >$WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-misssens-6high.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/high-and-misssens-6high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/high-and-misssens-6high.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/high-6highs4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/misssens-6high.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/misssens-6high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6highs4lows/1/filter/textfiles/misssens-6high.txt;

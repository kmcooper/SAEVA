#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=7high4lows-filters
#SBATCH --error=7high4lows-filters.%J.err
#SBATCH --output=7high4lows-filters.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/update/
mkdir filter
cd filter
mkdir textfiles
cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
##### merge all high files together, sort, remove the headers, and save as combined7high4lows.vcf####
cat *low*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined7high4lows.vcf;
##### remove the annotation information, remove uniq files and count them####
cat $WORK/SAEVA_outputs/update/combined7high4lows.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines7high4lows.txt;
#### find mutations, which repeated 11 times ####
result=$(cat $WORK/SAEVA_outputs/update/countlines7high4lows.txt |grep -w "11"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
################
cat $WORK/SAEVA_outputs/update/combined7high4lows.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results7high4lows.vcf;
filter=$(cat $WORK/SAEVA_outputs/update/results7high4lows.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
#### find the whole information of each repeated mutation in one file####
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/update/tempcommon7high4lows.ann.vcf;
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/update/header.vcf;
cat $WORK/SAEVA_outputs/update/header.vcf $WORK/SAEVA_outputs/update/tempcommon7high4lows.ann.vcf> $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf;
rm $WORK/SAEVA_outputs/update/header.vcf


############################################################################################################################
### Find High impact mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-7high4lows.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/update/filter/moderate-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-7high4lows.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = LOW)"\ > $WORK/SAEVA_outputs/update/filter/low-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-7high4lows.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/update/filter/modifier-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-7high4lows.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/update/filter/misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/misssens-7high4lows.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-misssens-7high4lows.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/moderate-and-misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-and-misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-and-misssens-7high4lows.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = LOW) & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/low-and-misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-and-misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-and-misssens-7high4lows.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/modifier-and-misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-and-misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-and-misssens-7high4lows.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT=SYNONYMOUS)"\ > $WORK/SAEVA_outputs/update/filter/synonymous-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/synonymous-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/synonymous-7high4lows.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/update/filter/modifier-and-synonymous-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-and-synonymous-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-and-synonymous-7high4lows.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/update/filter/high-and-synonymous-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-synonymous-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-synonymous-7high4lows.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/update/filter/low-and-synonymous-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-and-synonymous-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-and-synonymous-7high4lows.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/downstream-and-misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/downstream-and-misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/downstream-and-misssens-7high4lows.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high4lows.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/stop-and-misssens-7high4lows.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/stop-and-misssens-7high4lows.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/stop-and-misssens-7high4lows.txt;

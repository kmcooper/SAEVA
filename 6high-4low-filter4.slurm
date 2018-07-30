#!/bin/sh
#SBATCH --time=01:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=6high4lows-4-filters
#SBATCH --error=6high4lows-4-filters.%J.err
#SBATCH --output=6high4lows-4-filters.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/changes/6high4lows/4/
mkdir filter
cd filter
mkdir textfiles
cd $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/
##### merge all high files together, sort, remove the headers, and save as combined6high4lows-4.vcf####
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/6high4lows/4/combined6high4lows-4.vcf;
##### remove the annotation information, remove uniq files and count them####
cat $WORK/SAEVA_outputs/changes/6high4lows/4/combined6high4lows-4.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6high4lows/4/countlines6high4lows-4.txt;
#### find mutations, which repeated 10 times ####
result=$(cat $WORK/SAEVA_outputs/changes/6high4lows/4/countlines6high4lows-4.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
################
cat $WORK/SAEVA_outputs/changes/6high4lows/4/combined6high4lows-4.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6high4lows/4/results6high4lows-4.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/6high4lows/4/results6high4lows-4.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
#### find the whole information of each repeated mutation in one file####
cat $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/6high4lows/4/tempcommon6high4lows-4.ann.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/6high4lows/4/header.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/header.vcf $WORK/SAEVA_outputs/changes/6high4lows/4/tempcommon6high4lows-4.ann.vcf> $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf;
rm $WORK/SAEVA_outputs/changes/6high4lows/4/header.vcf


############################################################################################################################
### Find High impact mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/high-6high4lows-4.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/moderate-6high4lows-4.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = LOW)"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/low-6high4lows-4.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/modifier-6high4lows-4.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/misssens-6high4lows-4.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/high-and-misssens-6high4lows-4.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-and-misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-and-misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/moderate-and-misssens-6high4lows-4.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = LOW) & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/low-and-misssens-6high4lows-4.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/modifier-and-misssens-6high4lows-4.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT=SYNONYMOUS)"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/synonymous-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/synonymous-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/synonymous-6high4lows-4.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-synonymous-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-synonymous-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/modifier-and-synonymous-6high4lows-4.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-synonymous-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-synonymous-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/high-and-synonymous-6high4lows-4.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-synonymous-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-synonymous-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/low-and-synonymous-6high4lows-4.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/downstream-and-misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/downstream-and-misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/downstream-and-misssens-6high4lows-4.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/stop-and-misssens-6high4lows-4.filter.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/stop-and-misssens-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/stop-and-misssens-6high4lows-4.txt;
####################################################################################
### for highs###
##################################################
cat *high*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/6high4lows/4/combined-6high4lows-4-high.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/combined-6high4lows-4-high.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6high4lows/4/countlines-6high4lows-high.txt;
result=$(cat $WORK/SAEVA_outputs/changes/6high4lows/4/countlines-6high4lows-high.txt |grep -w "6"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6high4lows/4/combined-6high4lows-4-high.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/results-6high4lows-high.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/6high4lows/4/results-6high4lows-high.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/temphigh-6high4lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/4-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/6high4lows/4/header.vcf;
cat $WORK/SAEVA_outputs/changes/6high4lows/4/header.vcf $WORK/SAEVA_outputs/changes/6high4lows/4/snpEff_outputs/temphigh-6high4lows.ann.vcf> $WORK/SAEVA_outputs/changes/6high4lows/4/high-6high4lows.ann.vcf;
rm $WORK/SAEVA_outputs/changes/6high4lows/4/header.vcf
############################################################################################################################
### Find High impact mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/high-HIGH-6high4lows-4.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/moderate-HIGH-6high4lows-4.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = LOW)"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/low-HIGH-6high4lows-4.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/modifier-HIGH-6high4lows-4.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/misssens-HIGH-6high4lows-4.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/high-and-misssens-HIGH-6high4lows-4.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-and-misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/moderate-and-misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/moderate-and-misssens-HIGH-6high4lows-4.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = LOW) & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/low-and-misssens-HIGH-6high4lows-4.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/modifier-and-misssens-HIGH-6high4lows-4.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT=SYNONYMOUS)"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/synonymous-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/synonymous-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/synonymous-HIGH-6high4lows-4.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-synonymous-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/modifier-and-synonymous-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/modifier-and-synonymous-HIGH-6high4lows-4.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-synonymous-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/high-and-synonymous-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/high-and-synonymous-HIGH-6high4lows-4.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-synonymous-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/low-and-synonymous-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/low-and-synonymous-HIGH-6high4lows-4.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/downstream-and-misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/downstream-and-misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/downstream-and-misssens-HIGH-6high4lows-4.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/changes/6high4lows/4/common6high4lows-4.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/stop-and-misssens-High-6high4lows-4.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/6high4lows/4/filter/stop-and-misssens-High-6high4lows-4.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/6high4lows/4/filter/textfiles/stop-and-misssens-HIGH-6high4lows-4.txt;




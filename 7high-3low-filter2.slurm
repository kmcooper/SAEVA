#!/bin/sh
#SBATCH --time=01:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=7high3lows-2-filters
#SBATCH --error=7high3lows-2-filters.%J.err
#SBATCH --output=7high3lows-2-filters.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/changes/7high3lows/2/
mkdir filter
cd filter
mkdir textfiles
cd $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/
##### merge all high files together, sort, remove the headers, and save as combined7high3lows-2.vcf####
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/7high3lows/2/combined7high3lows-2.vcf;
##### remove the annotation information, remove uniq files and count them####
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined7high3lows-2.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/2/countlines7high3lows-2.txt;
#### find mutations, which repeated 10 times ####
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/2/countlines7high3lows-2.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
################
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined7high3lows-2.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/2/results7high3lows-2.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/7high3lows/2/results7high3lows-2.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
#### find the whole information of each repeated mutation in one file####
cat $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/7high3lows/2/tempcommon7high3lows-2.ann.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_high0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/7high3lows/2/header.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/header.vcf $WORK/SAEVA_outputs/changes/7high3lows/2/tempcommon7high3lows-2.ann.vcf> $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf;
rm $WORK/SAEVA_outputs/changes/7high3lows/2/header.vcf


############################################################################################################################
### Find High impact mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/high-7high3lows-2.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/moderate-7high3lows-2.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = LOW)"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/low-7high3lows-2.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/modifier-7high3lows-2.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/misssens-7high3lows-2.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/high-and-misssens-7high3lows-2.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-and-misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-and-misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/moderate-and-misssens-7high3lows-2.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = LOW) & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/low-and-misssens-7high3lows-2.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/modifier-and-misssens-7high3lows-2.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT=SYNONYMOUS)"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/synonymous-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/synonymous-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/synonymous-7high3lows-2.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-synonymous-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-synonymous-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/modifier-and-synonymous-7high3lows-2.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-synonymous-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-synonymous-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/high-and-synonymous-7high3lows-2.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-synonymous-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-synonymous-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/low-and-synonymous-7high3lows-2.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/downstream-and-misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/downstream-and-misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/downstream-and-misssens-7high3lows-2.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/common7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/stop-and-misssens-7high3lows-2.filter.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/stop-and-misssens-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/stop-and-misssens-7high3lows-2.txt;
####################################################################################
### for lows###
####################################################################################
cat *low*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/7high3lows/2/combined-7high3lows-2-low.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined-7high3lows-2-low.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/2/countlines-7high3lows-low.txt;
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/2/countlines-7high3lows-low.txt |grep -w "3"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined-7high3lows-2-low.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/2/results-7high3lows-low.vcf;
filter=$(cat $WORK/SAEVA_outputs/changes/7high3lows/2/results-7high3lows-low.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_low0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/templow-7high3lows.ann.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/2-snpEff_low0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/changes/7high3lows/2/header.vcf;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/header.vcf $WORK/SAEVA_outputs/changes/7high3lows/2/templow-7high3lows.ann.vcf> $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf;
rm $WORK/SAEVA_outputs/changes/7high3lows/2/header.vcf
######################################################################################
### Find High impact mutations###
######################################################################################
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/high-HIGH-7high3lows-2.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/moderate-LOW-7high3lows-2.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = LOW)"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/low-LOW-7high3lows-2.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/modifier-LOW-7high3lows-2.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/misssens-LOW-7high3lows-2.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/high-and-misssens-LOW-7high3lows-2.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-and-misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/moderate-and-misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/moderate-and-misssens-LOW-7high3lows-2.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = LOW) & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/low-and-misssens-LOW-7high3lows-2.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/modifier-and-misssens-LOW-7high3lows-2.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT=SYNONYMOUS)"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/synonymous-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/synonymous-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/synonymous-LOW-7high3lows-2.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-synonymous-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/modifier-and-synonymous-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/modifier-and-synonymous-LOW-7high3lows-2.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-synonymous-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/high-and-synonymous-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/high-and-synonymous-LOW-7high3lows-2.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-synonymous-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/low-and-synonymous-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/low-and-synonymous-LOW-7high3lows-2.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/downstream-and-misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/downstream-and-misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/downstream-and-misssens-LOW-7high3lows-2.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/changes/7high3lows/2/low-7high3lows-2.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/stop-and-misssens-Low-7high3lows-2.filter.vcf; 
cat $WORK/SAEVA_outputs/changes/7high3lows/2/filter/stop-and-misssens-Low-7high3lows-2.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/changes/7high3lows/2/filter/textfiles/stop-and-misssens-LOW-7high3lows-2.txt;




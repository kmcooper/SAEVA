#!/bin/sh
#SBATCH --time=01:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=7high-filters
#SBATCH --error=7high-filters.%J.err
#SBATCH --output=7high-filters.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/update/
mkdir filter
cd filter
mkdir textfiles
cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
##### merge all high files together, sort, remove the headers, and save as combined7high.vcf####
cat *high*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined7high.vcf;
##### remove the annotation information, remove uniq files and count them####
cat $WORK/SAEVA_outputs/update/combined7high.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines7high.txt;
#### find mutations, which repeated 4 times ####
result=$(cat $WORK/SAEVA_outputs/update/countlines7high.txt |grep -w "7"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
################
cat $WORK/SAEVA_outputs/update/combined7high.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results7high.vcf;
filter=$(cat $WORK/SAEVA_outputs/update/results7high.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
#### find the whole information of each repeated mutation in one file####
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_high0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/update/common7high.ann.vcf;

############################################################################################################################
### Find High impact mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-7high.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/update/filter/moderate-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-7high.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'LOW')"\ > $WORK/SAEVA_outputs/update/filter/low-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-7high.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/update/filter/modifier-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-7high.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/update/filter/misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/misssens-7high.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-misssens-7high.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/moderate-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-and-misssens-7high.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'LOW') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/low-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-and-misssens-7high.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/modifier-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-and-misssens-7high.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='SYNONYMOUS')"\ > $WORK/SAEVA_outputs/update/filter/synonymous-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/synonymous-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/synonymous-7high.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= 'SYNONYMOUS'))"\ > $WORK/SAEVA_outputs/update/filter/modifier-and-synonymous-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-and-synonymous-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-and-synonymous-7high.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= 'SYNONYMOUS'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-synonymous-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-synonymous-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-synonymous-7high.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= 'SYNONYMOUS'))"\ > $WORK/SAEVA_outputs/update/filter/low-and-synonymous-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-and-synonymous-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-and-synonymous-7high.txt;
### Find DownStream mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].EFFECT has 'downstream')"\ > $WORK/SAEVA_outputs/update/filter/downstream-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/downstream7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/downstream-7high.txt;
### Find DownStream and High mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='HIGH'))"\ > $WORK/SAEVA_outputs/update/filter/downstream-and-high-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/downstream-and-high-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/downstream-and-high-7high.txt;
### Find DownStream and moderate mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MODERATE'))"\ > $WORK/SAEVA_outputs/update/filter/downstream-and-moderate-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/downstream-and-moderate-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/downstream-and-moderate-7high.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/downstream-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/downstream-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/downstream-and-misssens-7high.txt;
### Find Stop mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].EFFECT has 'stop_gained')"\ > $WORK/SAEVA_outputs/update/filter/stop-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/stop-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/stop7high.txt;
### Find Stop and High mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='HIGH'))"\ > $WORK/SAEVA_outputs/update/filter/stop-and-high-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/stop-and-high-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/stop-and-high-7high.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/stop-and-misssens-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/stop-and-misssens-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/stop-and-misssens-7high.txt;
### Find Stop and Moderate mutations###
cat $WORK/SAEVA_outputs/update/common7high.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MODERATE'))"\ > $WORK/SAEVA_outputs/update/filter/stop-and-moderate-7high.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/stop-and-moderate-7high.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/stop-and-moderate-7high.txt;

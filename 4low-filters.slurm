#!/bin/sh
#SBATCH --time=00:30:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=1024      # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=4low-filters
#SBATCH --error=4low-filters.%J.err
#SBATCH --output=4low-filters.%J.out
module load java/1.8
cd $WORK/SAEVA_outputs/update/
mkdir filter
cd filter
mkdir textfiles
cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
##### merge all Low files together, sort, remove the headers, and save as combined4low.vcf####
cat *low*.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined4low.vcf;
##### remove the annotation information, remove uniq files and count them####
cat $WORK/SAEVA_outputs/update/combined4low.vcf |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines4low.txt;
#### find mutations, which repeated 4 times ####
result=$(cat $WORK/SAEVA_outputs/update/countlines4low.txt |grep -w "3"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
################
cat $WORK/SAEVA_outputs/update/combined4low.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results4low.vcf;
filter=$(cat $WORK/SAEVA_outputs/update/results4low.vcf | cut -f2);
filter=$(echo $filter | sed 's/ /|/g')
#### find the whole information of each repeated mutation in one file####
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_low0.ann.vcf | egrep $filter > $WORK/SAEVA_outputs/update/tempcommon4low.ann.vcf;
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/update-snpEff_low0.ann.vcf | grep '##'>$WORK/SAEVA_outputs/update/header.vcf;
cat $WORK/SAEVA_outputs/update/header.vcf $WORK/SAEVA_outputs/update/tempcommon4low.ann.vcf> $WORK/SAEVA_outputs/update/common4low.ann.vcf;
rm $WORK/SAEVA_outputs/update/header.vcf


############################################################################################################################
### Find High impact mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'HIGH')"\ > $WORK/SAEVA_outputs/update/filter/high-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-4low.txt;
### Find Moderate impact mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = 'MODERATE')"\ > $WORK/SAEVA_outputs/update/filter/moderate-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-4low.txt;
### Find Low impact mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf| java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT = LOW)"\ > $WORK/SAEVA_outputs/update/filter/low-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-4low.txt;
### Find modifiers mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MODIFIER')"\ > $WORK/SAEVA_outputs/update/filter/modifier-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-4low.txt;
### Find Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT='MISSENSE')"\ > $WORK/SAEVA_outputs/update/filter/misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/misssens-4low.txt;
### Find High and Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'HIGH') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/high-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-misssens-4low.txt;
### Find Moderate and Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODERATE') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/moderate-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/moderate-and-misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/moderate-and-misssens-4low.txt;
### Find Low and Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = LOW) & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/low-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-and-misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-and-misssens-4low.txt;
### Find Modifier and Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/modifier-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-and-misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-and-misssens-4low.txt;
### Find Synonymous mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "(ANN[*].IMPACT=SYNONYMOUS)"\ > $WORK/SAEVA_outputs/update/filter/synonymous-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/synonymous-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/synonymous-4low.txt;
### Find Synonymous and Modifier mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/update/filter/modifier-and-synonymous-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/modifier-and-synonymous-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/modifier-and-synonymous-4low.txt;
### Find Synonymous and High mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/update/filter/high-and-synonymous-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/high-and-synonymous-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/high-and-synonymous-4low.txt;
### Find Synonymous and low mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].IMPACT = 'MODIFIER') & (ANN[*].IMPACT= SYNONYMOUS))"\ > $WORK/SAEVA_outputs/update/filter/low-and-synonymous-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/low-and-synonymous-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/low-and-synonymous-4low.txt;
### Find DownStream and Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'downstream') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/downstream-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/downstream-and-misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/downstream-and-misssens-4low.txt;
### Find Stop and Missense mutations###
cat $WORK/SAEVA_outputs/update/common4low.ann.vcf | java -jar $WORK/SAEVA_softwares/snpEFF/snpEff/SnpSift.jar filter \ "((ANN[*].EFFECT has 'stop_gained') & (ANN[*].IMPACT='MISSENSE'))"\ > $WORK/SAEVA_outputs/update/filter/stop-and-misssens-4low.filter.vcf;
cat $WORK/SAEVA_outputs/update/filter/stop-and-misssens-4low.filter.vcf | grep -v '##' > $WORK/SAEVA_outputs/update/filter/textfiles/stop-and-misssens-4low.txt;

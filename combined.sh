cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/update-snpEff_outputs/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/update-snpEff_outputs/countlines.txt
result=$(cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/countlines.txt |grep -w "11"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/update-snpEff_outputs/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/update-snpEff_outputs/results.txt

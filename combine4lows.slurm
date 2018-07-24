cd $WORK/SAEVA_outputs/update/update-snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/update/combined4lows.ann.vcf;
cat $WORK/SAEVA_outputs/update/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/update/countlines4lows.txt
result=$(cat $WORK/SAEVA_outputs/update/countlines4lows.txt |grep -w "4"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/update/combined4lows.ann.vcf |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/update/results4lows.filter.vcf

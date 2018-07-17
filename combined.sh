cd $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/1/countlines.txt
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/1/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/1/results.txt

cd $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/2/countlines.txt
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/2/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/2/results.txt


cd $WORK/SAEVA_outputs/changes/7high3lows/3/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/7high3lows/3/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/3/countlines.txt
result=$(cat $WORK/SAEVA_outputs/changes/7high3lows/3/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/3/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/3/results.txt


cd $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/7high3lows/4/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/4/countlines.txt
result4=$(cat $WORK/SAEVA_outputs/changes/7high3lows/4/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/7high3lows/4/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/7high3lows/4/results.txt


cd $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/1/countlines.txt
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/1/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/1/results.txt


cd $WORK/SAEVA_outputs/changes/6highs4lows/2/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/2/countlines.txt
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/2/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/2/results.txt


cd $WORK/SAEVA_outputs/changes/6highs4lows/3/snpEff_outputs/
echo `pwd`
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/6highs4lows/3/combined.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/3/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/3/countlines.txt
result=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/3/countlines.txt |grep -w "10"|cut -f2);
result=$(echo $result | sed 's/ /|/g')
cat $WORK/SAEVA_outputs/changes/6highs4lows/3/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed 's/AB=.*;ANN=/ANN=/' |uniq > $WORK/SAEVA_outputs/changes/6highs4lows/3/results.txt

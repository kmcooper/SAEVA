cd $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#' >$WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/1/countlines.txt
result1=$(cat $WORK/SAEVA_outputs/changes/7high3lows/1/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |grep -w $result1 | uniq -c > $WORK/SAEVA_outputs/changes/7high3lows/1/results.txt

cd $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/2/countlines.txt
result2=$(cat $WORK/SAEVA_outputs/changes/7high3lows/2/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt |grep -w $result2| uniq -c > $WORK/SAEVA_outputs/changes/7high3lows/2/results.txt


cd $WORK/SAEVA_outputs/changes/7high3lows/3/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/7high3lows/3/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/3/countlines.txt
result3=$(cat $WORK/SAEVA_outputs/changes/7high3lows/3/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/7high3lows/3/combined.txt |grep -w $result3| uniq -c > $WORK/SAEVA_outputs/changes/7high3lows/3/results.txt


cd $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/7high3lows/4/combined.txt;
cat $WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/7high3lows/4/countlines.txt
result4=$(cat $WORK/SAEVA_outputs/changes/7high3lows/4/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/7high3lows/4/combined.txt |grep -w $result4 | uniq -c > $WORK/SAEVA_outputs/changes/7high3lows/4/results.txt


cd $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/1/countlines.txt
result5=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/1/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt | grep -w $result5| uniq -c > $WORK/SAEVA_outputs/changes/6highs4lows/1/results.txt


cd $WORK/SAEVA_outputs/changes/6highs4lows/2/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/2/countlines.txt
result6=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/2/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt |grep -w $result6 | uniq -c > $WORK/SAEVA_outputs/changes/6highs4lows/2/results.txt


cd $WORK/SAEVA_outputs/changes/6highs4lows/3/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#'>$WORK/SAEVA_outputs/changes/6highs4lows/3/combined.txt;
cat $WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/changes/6highs4lows/13/countlines.txt
result7=$(cat $WORK/SAEVA_outputs/changes/6highs4lows/3/countlines.txt |grep -w "10"|cut -f2);
cat $WORK/SAEVA_outputs/changes/6highs4lows/3/combined.txt |grep -w $result7| uniq -c > $WORK/SAEVA_outputs/changes/6highs4lows/3/results.txt

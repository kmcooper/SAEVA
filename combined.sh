cd $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*' >$WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt;


cd $WORK/SAEVA_outputs/changes/7high3lows/2/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*'>$WORK/SAEVA_outputs/changes/7high3lows/2/combined.txt;

cd $WORK/SAEVA_outputs/changes/7high3lows/3/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*'>$WORK/SAEVA_outputs/changes/7high3lows/3/combined.txt;

cd $WORK/SAEVA_outputs/changes/7high3lows/4/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*'>$WORK/SAEVA_outputs/changes/7high3lows/4/combined.txt;

cd $WORK/SAEVA_outputs/changes/6highs4lows/1/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*'>$WORK/SAEVA_outputs/changes/6highs4lows/1/combined.txt;

cd $WORK/SAEVA_outputs/changes/6highs4lows/2/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*'>$WORK/SAEVA_outputs/changes/6highs4lows/2/combined.txt;

cd $WORK/SAEVA_outputs/changes/6highs4lows/3/snpEff_outputs/
cat *.vcf | sort | grep -v '##'| grep -v '#*'>$WORK/SAEVA_outputs/changes/6highs4lows/3/combined.txt;

cd $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/

cat *.vcf | sort | grep -v '##'>$WORK/SAEVA_outputs/changes/7high3lows/1/combined.txt;

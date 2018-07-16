cd $WORK/SAEVA_outputs/changes/7high3lows/1/snpEff_outputs/
cat *.vcf |sed -i 's/^Chromosome/' >$WORK/SAEVA_outputs/changes/7high3lows/1/combined.vcf;

cd $WORK/SAEVA_softwares/snpEFF
wget http://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip

unzip snpEff_latest_core.zip
rm snpEff_latest_core.zip


cd $WORK/SAEVA
sbatch update-snpEff.slurm


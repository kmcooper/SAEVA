cd $WORK/softwares/freebayes/freebayes/vcflip
make
cd $WORK/SAEVA
sbatch bcf_vcf.slurm

cd $WORK/SAEVA_softwares/freebayes/freebayes/vcflip
make
cd $WORK/SAEVA
sbatch bcf-vcf.slurm

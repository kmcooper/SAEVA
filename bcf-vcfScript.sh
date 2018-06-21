cd $WORK/SAEVA_softwares/freebayes/freebayes/vcflib
make
cd $WORK/SAEVA
sbatch bcf-vcf.slurm

cd $WORK/SAEVA_softwares/freebayes/
git clone --recursive git://github.com/ekg/freebayes.git
cd freebayes
make
cd $WORK/SAEVA
sbatch freebayes*.slurm

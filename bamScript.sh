cd $WORK/softwares/bwa
wget https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2
tar -xvjf bwa-0.7.17.tar.bz2
rm bwa-0.7.17.tar.bz2
cd $WORK/SAEVA

sbatch bam.slurm

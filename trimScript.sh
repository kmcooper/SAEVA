pd=`pwd`
cd $HOME
mkdir data
cd $WORK
mkdir trimmomatic
cd trimmomatic
mkdir slurm
mkdir trimlog
cd $pd
sbatch trimmomatic.slurm

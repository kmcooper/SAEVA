pd=`pwd`
cd $HOME
## make trimmomatic directory
mkdir data
cd $WORK
mkdir trimmomatic
cd trimmomatic
mkdir trimlog
cd $pd
# run Trimmomatic slurm
sbatch trimmomatic.slurm

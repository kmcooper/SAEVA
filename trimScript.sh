pd=`pwd`
cd $HOME
## make trimmomatic directory
mkdir data
cd $WORK
mkdir trimmomatic
cd trimmomatic
mkdir slurm
mkdir trimlog
cd $pd
# run Trimmomatic slurm
sbatch trimmomatic.slurm
# download reference genome
cd $HOME
mkdir reference_genome
cd refrence_genome
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
tar –xzf Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
rm Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
cd ..
##samfiles
cd $WORK
mkdir samfiles
cd samfiles
mkdir samslurm
mkdir samoutput/   ## for sam outputs
cd $pd
sbatch samfiles.slurm

pd=`pwd`
# download reference genome
cd $HOME
mkdir reference_genome
cd reference_genome
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
tar –xzf Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
rm Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
cd ..
##samfiles
cd $WORK
mkdir samfiles
cd $pd
sbatch samfiles.slurm

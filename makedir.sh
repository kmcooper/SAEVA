pd= `pwd`
cd $HOME
mkdir data
mkdir bin
mkdir reference_genome
cd reference_genome
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
tar -xzf Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
rm Staphylococcus_aureus_NCTC_8325_NCBI_2006-02-13.tar.gz
cd $WORK
## make trimmomatic directory
mkdir trimmomatic
cd trimmomatic
mkdir trimlog
cd ..
## make BWA
mkdir samfiles
## make bam
mkdir bamfiles

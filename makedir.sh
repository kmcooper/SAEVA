pd= `pwd`
cd $HOME
mkdir data
mkdir reference_genome
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
mkdir flagsam
mkdir sortsam
mkdir picard
mkdir freebayesoutput
mkdir vcffilterq5000
mkdir bcfoutput
mkdir vcffilterq5000-dp250
cd picard
mkdir picardlog
cd ..
mkdir softwares
cd softwares
mkdir freebayes
mkdir bwa
mkdir vcftools

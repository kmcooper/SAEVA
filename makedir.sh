pd= `pwd`
cd $HOME
mkdir data
mkdir SAEVA_reference_genome
cd $WORK
mkdir SAEVA_outputs
cd SAEVA_outputs
mkdir snpEff_outputs
cd snpEff_outputs
mkdir snpEff-summary
mkdir snpEff-gene
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
## make snEff
mkdir snpEff_outputs
cd snpEff_outputs
mkdir snpEff_high0
mkdir snpEff_high1
mkdir snpEff_high2
mkdir snpEff_high3
mkdir snpEff_high4
mkdir snpEff_low0
mkdir snpEff_low1

cd $WORK
mkdir SAEVA_softwares
cd SAEVA_softwares
mkdir freebayes
mkdir bwa

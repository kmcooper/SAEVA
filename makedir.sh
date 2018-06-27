pd= `pwd`
cd $HOME
mkdir data
mkdir SAEVA_reference_genome
cd $WORK
mkdir SAEVA_outputs
cd SAEVA_outputs

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
## make snEff
mkdir snpEff_outputs
cd snpEff_outputs
mkdir snpEff-summary
mkdir snpEff-gene
cd ..
###updates
mkdir update
cd update
mkdir update-snpEff_outputs
cd update-snpEff_outputs
mkdir update-snpEff-summary
mkdir update-snpEff-gene
cd $WORK
mkdir SAEVA_softwares
cd SAEVA_softwares
mkdir freebayes
mkdir bwa
mkdir snpEFF

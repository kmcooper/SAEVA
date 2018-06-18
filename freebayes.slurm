#!/bin/sh
#SBATCH --time=15:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=freebayes
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/HSS12071M1.picard.bam >$WORK/freebayesoutput/HSS12071M1.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman37712B1_S21.picard.bam >$WORK/freebayesoutput/Silverman37712B1_S21.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f /$HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman60383B1_S18.picard.bam >$freebayesoutput/Silverman60383B1_S18.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman62129B1_S17.picard.bam >$WORK/freebayesoutput/Silverman62129B1_S17.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman79414A1_S23.picard.bam >$WORK/freebayesoutput/Silverman79414A1_S23.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman93954A1_S19.picard.bam >$WORK/freebayesoutput//Silverman93954A1_S19.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman94232M1_S14.picard.bam >$WORK/freebayesoutput/Silverman94232M1_S14.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /$WORK/picard/Silverman99382B1_S22.picard.bam >$WORK/freebayesoutput/Silverman99382B1_S22.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman99382M1_S15.picard.bam >$WORK/freebayesoutput/Silverman99382M1_S15.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman99624A1_S20.picard.bam >$WORK/freebayesoutput/Silverman99624A1_S20.vcf;

$WORK/softwares/freebayes/freebayes/bin/freebayes -f $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/picard/Silverman99624D1_S16.picard.bam >$WORK/freebayesoutput/Silverman99624D1_S16.vcf;


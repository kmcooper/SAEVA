#!/bin/sh
#SBATCH --time=7:00:00          # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=bwa
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/HSS12071M1_pool_S24_L007_R1_001.paired.fq $WORK/trimmomatic/HSS12071M1_pool_S24_L007_R2_001.paired.fq >$WORK/samfiles/aln_HSS12071M1_pool_S24.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman37712B1_S21_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman37712B1_S21_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman37712B1_S21.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman60383B1_S18_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman60383B1_S18_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman60383B1_S18.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman62129B1_S17_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman62129B1_S17_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman62129B1_S17.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman79414A1_S23_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman79414A1_S23_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman79414A1_S23.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman93954A1_S19_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman93954A1_S19_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman93954A1_S19.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman94232M1_S14_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman94232M1_S14_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman94232M1_S14.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman99382B1_S22_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman99382B1_S22_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman99382B1_S22.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman99382M1_S15_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman99382M1_S15_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman99382M1_S15.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman99624D1_S16_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman99624D1_S16_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman99624A1_S20.sam
$WORK/softwares/bwa/bwa-0.7.17/bwa mem $HOME/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa $WORK/trimmomatic/Silverman99624A1_S20_L007_R1_001.paired.fq $WORK/trimmomatic/Silverman99624A1_S20_L007_R2_001.paired.fq >$WORK/samfiles/aln_Silverman99624D1_S16.sam

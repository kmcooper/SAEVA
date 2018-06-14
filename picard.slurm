#!/bin/sh
##SBATCH --time=10:00:00          # Run time in hh:mm:ss
##SBATCH --mem-per-cpu=2048       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=picards
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

module load picard/2.18

picard MarkDuplicates I=$WORK/sortsam/aln_HSS12071M1_pool_S24.sorted.bam O=$WORK/picard/HSS12071M1.picard.bam M=$WORK/picard/picardlog/HSS12071M1.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman37712B1_S21.sorted.bam O=$WORK/picard/Silverman37712B1_S21.picard.bam M=$WORK/picard/picardlog/Silverman37712B1_S21.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman60383B1_S18.sorted.bam O=$WORK/picard/Silverman60383B1_S18.picard.bam M=$WORK/picard/picardlog/Silverman60383B1_S18.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman62129B1_S17.sorted.bam O=$WORK/picard/Silverman62129B1_S17.picard.bam M=$WORK/picard/picardlog/Silverman62129B1_S17.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman79414A1_S23.sorted.bam O=$WORK/picard/Silverman79414A1_S23.picard.bam M=$WORK/picard/picardlog/Silverman79414A1_S23.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman93954A1_S19.sorted.bam O=$WORK/picard/Silverman93954A1_S19.picard.bam M=$WORK/picard/picardlog/Silverman93954A1_S19.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman94232M1_S14.sorted.bam O=$WORK/picard/Silverman94232M1_S14.picard.bam M=$WORK/picard/picardlog/Silverman94232M1_S14.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman99382B1_S22.sorted.bam O=$WORK/picard/Silverman99382B1_S22.picard.bam M=$WORK/picard/picardlog/Silverman99382B1_S22.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman99382M1_S15.sorted.bam O=$WORK/picard/Silverman99382M1_S15.picard.bam M=$WORK/picard/picardlog/Silverman99382M1_S15.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman99624A1_S20.sorted.bam O=$WORK/picard/Silverman99624A1_S20.picard.bam M=$WORK/picard/picardlog/Silverman99624A1_S20.picard.log;
picard MarkDuplicates I=$WORK/sortsam/aln_Silverman99624D1_S16.sorted.bam O=$WORK/picard/Silverman99624D1_S16.picard.bam M=$WORK/picard/picardlog/Silverman99624D1_S16.picard.log;

#!/bin/sh
#SBATCH --time=05:00:00   # Run time in hh:mm:ss
#SBATCH --mem-per-cpu=2048       # Maximum memory required per CPU (in megabytes)
#SBATCH --job-name=freebayes
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/HSS12071M1.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/HSS12071M1.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman37712B1_S21.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman37712B1_S21.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman60383B1_S18.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman60383B1_S18.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman62129B1_S17.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman62129B1_S17.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman79414A1_S23.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman79414A1_S23.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman93954A1_S19.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput//Silverman93954A1_S19.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman94232M1_S14.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman94232M1_S14.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman99382B1_S22.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman99382B1_S22.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman99382M1_S15.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman99382M1_S15.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman99624A1_S20.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman99624A1_S20.vcf;

/work/biocore/kimia/nuxoll/freebayes/bin/freebayes -f /home/biocore/kimia/nuxoll/reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/Sequence/BWAIndex/genome.fa /work/biocore/kimia/nuxoll/picard/Silverman99624D1_S16.picard.bam >/work/biocore/kimia/nuxoll/freebayes/FreeBayesoutput/Silverman99624D1_S16.vcf;


cd $WORK
cd softwares
wget https://sourceforge.net/projects/samtools/files/samtools/1.5/samtools-1.5.tar.bz2
tar -xvjf samtools-1.5.tar.bz2
rm samtools-1.5.tar.bz2
cd samtools-1.5 # Within the unpacked release directory
sh configure
cd $pd
    

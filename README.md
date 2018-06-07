 ### the **S***taphylococcus* **A***ureus /* **E***pidermidis* **V**ariant **A**nalysis pipeline
## First step:
   #### 1: Download the Compressed fastq files from the link.
   ##### cd $HOME
   ##### mkdir data
   ##### cd data
   #### 2: unzip and store under data, $HOME.
## Second step:
   #### 1: Quality Control
   #### a: Use the most recent version of FastQC from this link:
   ##### Mac users:
        https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.dmg
   ##### Windows users:
         https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
   #### b: store FastQC reports for these original files in the folder name FastQC-befor-trimmomatic
### ***to run the whole program you need to download the clone in your WORK directory***
#### cd $WORK
#### git clone https://github.com/kmcooper/SAEVA.git
#### cd SAEVA
   ##### to run the slurm use this command:
   #### sh AllScript.sh
   ###### the trimmomatic out put must used again for FastQC to see the result of trimmomatic in the folder name FastQC-after-trimmomatic
## Third step:
##### Read Mapping with BWA

        
  

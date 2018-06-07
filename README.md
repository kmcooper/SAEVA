 ### the **S***taphylococcus* **A***ureus /* **E***pidermidis* **V**ariant **A**nalysis pipeline
## to start you need to download the code in your WORK directory
### cd $HOME
### mkdir data
#### cd data
### First step:
   #### 1: Download the Compressed fastq files from the link.
   #### 2: unzip and store under data, $HOME.
#### Second step:
   #### 1: Quality Control
   #### a: Use the most recent version of FastQC from this link:
   ##### Mac users:
        https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.dmg
   ##### Windows users:
         https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
   #### b: store FastQC reports for these original files in the folder name FastQC-befor-trimmomatic
   ### cd $WORK
### git clone https://github.com/kmcooper/SAEVA.git
   #### to run the slurm use this command:
   #### sh trimScript.sh
   ##### the trimmomatic aout put must used again for FastQC to see the result of trimmomatic in the folder name FastQC-after-trimmomatic
#### Third step:
##### Read Mapping with BWA
###### 1: The Latest version of Bowtie(1.2.1.1) download from this links:
####### Mac users:
        
####### Windows users:
        
  

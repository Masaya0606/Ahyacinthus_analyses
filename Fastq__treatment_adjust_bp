#Treated fastq files with fatsp 

#!/usr/bin/sh
#$ -S /usr/bin/bash
#$ -cwd
#$ -l s_vmem=100G
#$ -l mem_req=100G

ls ../TabularAcropora_Fastq_directory | cut -f 1 -d "." | sort -u > fq_list.txt

for i in `cat fq_list.txt`
do

fastp -l 150 -i ../TabularAcropora_Fastq_directory/"$i".1.fastq.gz -I ../TabularAcropora_Fastq_directory/"$i".2.fastq.gz -o "$i".1_out.fq.gz -O "$i".2_out.fq.gz

done

mkdir fastq
cp *.gz fastq/
cd fastq
gunzip *

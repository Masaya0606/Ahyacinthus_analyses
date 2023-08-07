#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=100G
#$ -l mem_req=100G


module load singularity
bwa-mem2 index -p A_hya_1.0 /reference_directory/GCA_014634145.1_Ahya_1.0_genomic.fna


ls /Ahyacinthus_fastp_treated_directory | cut -d "." -f 1 | sort -u > list.txt

mkdir sam

for i in `cat list.txt`
do

bwa-mem2 mem -t 8 A_hya_1.0 -R "@RG\tID:${i}\tSM:${i}\tPL:ILLUMINA\tLB:${i}" /Ahyacinthus_fastp_treated_directory/"$i".1_out.fq /Ahyacinthus_fastp_treated_directory/"$i".2_out.fq > sam/"$i".sam

singularity exec /usr/local/biotools/s/samtools\:1.9--h46bd0b3_0 samtools sort -O bam -o "$i".bam sam/"$i".sam
singularity exec /usr/local/biotools/s/samtools\:1.9--h46bd0b3_0 samtools index "$i".bam

done

mkdir bam
mv *.bam bam/
mv *.bai bam/

##Isolate fasta file from A.cytherea reference. Please do both common_sites and A.subulata and A.cytherea specific sites.

#!/usr/bin/bash


fatt unfold GCA_014634045.1_Acyt_1.0_genomic.fna > unfold_genome.fasta

sed 1d Acyt_ref_common.sites | nl | sed "s/ //g" | sed "s/^/SNP_/" | tr " " "," | tr "\t" "," > Fst.txt

mkdir fasta

for i in `cat Fst.txt`
do

echo "$i" > line.tmp
ID=`cut -f 1 -d "," line.tmp`
CHR=`cut -f 2 -d "," line.tmp`
STR=`cut -f 3 -d "," line.tmp | awk '{print $0-200}'`
END=`cut -f 3 -d "," line.tmp | awk '{print $0+200}'`

echo -e ">$ID" > fasta/"$ID".fasta

grep -A1 "$CHR" unfold_genome.fasta | cut -c "$STR"-"$END" | tail -1 >> fasta/"$ID".fasta

done

##Isolate fasta file from A.hyacinthus reference. Please do both common_sites and A.subulata and A.cytherea specific sites

#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=156G
#$ -l mem_req=156G
#$ -l d_rt=100:00:00
#$ -l s_rt=100:00:00

fatt unfold GCA_014634145.1_Ahya_1.0_genomic.fna > unfold_genome.fasta

sed 1d Ahya_ref_common.sites | nl | sed "s/ //g" | sed "s/^/SNP_/" | tr " " "," | tr "\t" "," > Fst_hya_common.txt

mkdir fasta_common_ref_Ahya

for i in `cat Fst_hya_common.txt`
do

echo "$i" > line.tmp
ID=`cut -f 1 -d "," line.tmp`
CHR=`cut -f 2 -d "," line.tmp`
STR=`cut -f 3 -d "," line.tmp | awk '{print $0-200}'`
END=`cut -f 3 -d "," line.tmp | awk '{print $0+200}'`

echo -e ">$ID" > fasta_common_ref_Ahya/"$ID".fasta

grep -A1 "$CHR" unfold_genome.fasta | cut -c "$STR"-"$END" | tail -1 >> fasta_common_ref_Ahya/"$ID".fasta

done

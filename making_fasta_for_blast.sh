##Isolate fasta file from A.cytherea reference

#!/usr/bin/bash


fatt unfold GCA_014634045.1_Acyt_1.0_genomic.fna > unfold_genome.fasta

sed 1d Ahya_ref_cyt_sub_hya_cyt_bif_common_loci_Fst08 | nl | sed "s/ //g" | sed "s/^/SNP_/" | tr " " "," | tr "\t" "," > Fst.txt

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

##Isolate fasta file from A.hyacinthus reference

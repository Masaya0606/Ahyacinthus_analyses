##download blast results of multifasta file
##Isolate gene ID, Gene_name_Gene_ID, SNPID Ahyacinthus reference

grep -A 5 SNP blast_result_Ahya.txt |grep "NA" >Blast_result_gene_name_Gene_ID_Ahya
grep -A 5 SNP blast_result_Ahya.txt |grep "NA"|rev|cut -b 1-17|rev　>Blast_result_Gene_ID_Ahya
grep -A 5 SNP blast_result_Ahya.txt |grep "NA"|rev|cut -b 1-17|rev|sort|uniq　>Blast_result_Gene_ID_Ahya_sort
grep -A SNP blast_result_Ahya.txt |sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g" >Blast_result_SNPID_Ahya
paste Blast_result_SNPID_Ahya Blast_result_gene_name_Gene_ID_Ahya>Blast_result_gene_name_Gene_ID_SNPID_Ahya

##Isolate gene ID, Gene_name_Gene_ID, SNPID Acytherea reference

grep -A 5 SNP blast_result_Acyt.txt |grep "NA" >Blast_result_gene_name_Gene_ID_Acyt
grep -A 5 SNP blast_result_Acyt.txt |grep "NA"|rev|cut -b 1-17|rev　>Blast_result_Gene_ID_Acyt
grep -A 5 SNP blast_result_Acyt.txt |grep "NA"|rev|cut -b 1-17|rev|sort|uniq　>Blast_result_Gene_ID_Acyt_sort
grep -A SNP blast_result_Acyt.txt |sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g" >Blast_result_SNPID_Acyt
paste Blast_result_SNPID_Acyt Blast_result_gene_name_Gene_ID_Acyt >Blast_result_gene_name_Gene_ID_SNPID_Acyt

##Isolate common isolated genes

grep -f Blast_result_Gene_ID_Ahya_sort Blast_result_Gene_ID_Acyt_sort >Ahya_Acyt_common_GeneID
grep -f Ahya_Acyt_common_GeneID Blast_result_gene_name_Gene_ID_SNPID_Acyt >Acyt_common_Gene_name_Gene_ID_SNP
grep -f Ahya_Ahya_common_GeneID Blast_result_gene_name_Gene_ID_SNPID_Ahya >Ahya_common_Gene_name_Gene_ID_SNP

##download blast results of multifasta file
##Isolate gene ID, Gene_name_Gene_ID, SNPID Ahyacinthus reference

grep -A 5 SNP blast_result_Ahya.txt |grep "NA" >Blast_result_gene_name_Gene_ID_Ahya
grep -A 5 SNP blast_result_Ahya.txt |grep "NA"|rev|cut -b 1-17|rev>Blast_result_Gene_ID_Ahya
grep -A 5 SNP blast_result_Ahya.txt |grep "NA"|rev|cut -b 1-17|rev|sort|uniq>Blast_result_Gene_ID_Ahya_sort
grep SNP blast_result_Ahya.txt |sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g"|sed "s/ Query .*0//g">Blast_result_SNPID_Ahya
grep -A 5 SNP blast_result_Ahya.txt|grep -B 2 "No significant similarity found."|grep "SNP"|sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g"|sed "s/ Query .*0//g">Blast_result_gene_name_Gene_ID_SNPID_Ahya_notMatch
grep -A 5 SNP blast_result_Ahya.txt|grep -B 5 "NA"|grep "SNP"|sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g"|sed "s/ Query .*0//g">Blast_result_SNPID_Ahya_OnlyMatched
paste Blast_result_SNPID_Ahya_OnlyMatched Blast_result_gene_name_Gene_ID_Ahya>Blast_result_gene_name_Gene_ID_SNPID_Ahya

##Isolate gene ID, Gene_name_Gene_ID, SNPID Acytherea reference

grep -A 5 SNP blast_result_Acyt.txt |grep "NA" >Blast_result_gene_name_Gene_ID_Acyt
grep -A 5 SNP blast_result_Acyt.txt |grep "NA"|rev|cut -b 1-17|rev>Blast_result_Gene_ID_Acyt
grep -A 5 SNP blast_result_Acyt.txt |grep "NA"|rev|cut -b 1-17|rev|sort|uniq>Blast_result_Gene_ID_Acyt_sort
grep SNP blast_result_Acyt.txt |sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g"|sed "s/ Query .*0//g">Blast_result_SNPID_Acyt
grep -A 5 SNP blast_result_Acyt.txt|grep -B 2 "No significant similarity found."|grep "SNP"|sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g"|sed "s/ Query .*0//g">Blast_result_gene_name_Gene_ID_SNPID_Acyt_notMatch
grep -A 5 SNP blast_result_Acyt.txt|grep -B 5 "NA"|grep "SNP"|sed "s/Quer.*SNP/SNP/g"|sed "s/ Query .*401//g"|sed "s/ Query .*0//g">Blast_result_SNPID_Acyt_OnlyMatched
paste Blast_result_SNPID_Acyt_OnlyMatched Blast_result_gene_name_Gene_ID_Acyt>Blast_result_gene_name_Gene_ID_SNPID_Acyt

##Isolate common isolated genes

grep -f Blast_result_Gene_ID_Ahya_sort Blast_result_Gene_ID_Acyt_sort >Ahya_Acyt_common_GeneID
grep -f Ahya_Acyt_common_GeneID Blast_result_gene_name_Gene_ID_SNPID_Acyt >Acyt_common_Gene_name_Gene_ID_SNP
grep -f Ahya_Ahya_common_GeneID Blast_result_gene_name_Gene_ID_SNPID_Ahya >Ahya_common_Gene_name_Gene_ID_SNP

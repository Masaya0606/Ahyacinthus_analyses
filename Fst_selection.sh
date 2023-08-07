##select scafold and nucleoposition of Fst sites (>0.8)

awk '$3>0.8' sub_bif_filtered.weir.fst|grep -v "nan"|awk '{print $1,$2}'|sed "s/ /_/g"|sort|uniq|grep -v "CHROM" >sub_bif_filtered.weir.fst_08.sites
awk '$3>0.8' sub_hya_filtered.weir.fst|grep -v "nan"|awk '{print $1,$2}'|sed "s/ /_/g"|sort|uniq|grep -v "CHROM" >sub_hya_filtered.weir.fst_08.sites
awk '$3>0.8' sub_cyt_filtered.weir.fst|grep -v "nan"|awk '{print $1,$2}'|sed "s/ /_/g"|sort|uniq|grep -v "CHROM" >sub_cyt_filtered.weir.fst_08.sites

## select common Fst sites among pairwise FSTs
comm -1 -2 sub_bif_filtered.weir.fst_08.sites sub_hya_filtered.weir.fst_08.sites>sub_bif_sub_hya_filtered.weir.fst_08.sites
comm -1 -2 sub_bif_sub_hya_filtered.weir.fst_08.sites sub_cyt_filtered.weir.fst_08.sites>common.sites

## select only A.subulata and A.cytherea specific sites
diff sub_bif_filtered.weir.fst_08.sites sub_cyt_filtered.weir.fst_08.sites|grep ">"|sed "s/> //g" >sub_cyt_specific_ag_sub_bif
diff sub_hya_filtered.weir.fst_08.sites sub_cyt_specific_ag_sub_bif|grep ">"|sed "s/> //g" >sub_cyt_specific



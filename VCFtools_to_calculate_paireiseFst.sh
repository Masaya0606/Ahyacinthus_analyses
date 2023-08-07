#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=156G
#$ -l mem_req=156G
#$ -l d_rt=480:00:00
#$ -l s_rt=480:00:00

module add singularity
singularity exec /usr/local/biotools/v/vcftools\:0.1.16--pl5321hd03093a_7 vcftools --vcf Ahya_maf_hwe_geno005.vcf --weir-fst-pop sub_pop.txt  --weir-fst-pop hya_pop.txt  --out sub_hya_maf_hwe_geno005
singularity exec /usr/local/biotools/v/vcftools\:0.1.16--pl5321hd03093a_7 vcftools --vcf Ahya_maf_hwe_geno005.vcf --weir-fst-pop sub_pop.txt  --weir-fst-pop cyt_pop.txt  --out sub_cyt_maf_hwe_geno005
singularity exec /usr/local/biotools/v/vcftools\:0.1.16--pl5321hd03093a_7 vcftools --vcf Ahya_maf_hwe_geno005.vcf --weir-fst-pop sub_pop.txt  --weir-fst-pop bif_pop.txt  --out sub_bif_maf_hwe_geno005

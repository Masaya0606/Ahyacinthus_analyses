##obtain bed files from vcf file

#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=156G
#$ -l mem_req=156G
#$ -l d_rt=480:00:00
#$ -l s_rt=480:00:00

singularity exec /usr/local/biotools/p/plink\:1.90b6.21--h779adbc_1 plink --vcf Ahya.snps.vcf  --make-bed --double-id --aec --out Ahya

##filtering with bed files

#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=156G
#$ -l mem_req=156G
#$ -l d_rt=480:00:00
#$ -l s_rt=480:00:00

singularity exec /usr/local/biotools/p/plink\:1.90b6.21--h779adbc_1 plink --bfile Ahyacinthus --geno 0.05 --maf 0.05 --hwe 0.000001 --make-bed --allow-extra-chr --out Ahya_maf_hwe_geno005

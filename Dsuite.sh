##detect introgression via ABBA-BABA test with Dsuite

#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=156G
#$ -l mem_req=156G
#$ -l d_rt=100:00:00
#$ -l s_rt=100:00:00
Dsuite Dtrios populations.snps.vcf SETSinclIso.txt -t MLtree.nwk -n Hya_introgression -c 

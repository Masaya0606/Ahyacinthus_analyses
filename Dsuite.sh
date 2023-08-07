##detect introgression via ABBA-BABA test with Dsuite.nwk file was created from the ML tree built by RaxML-NG, setting Isopora as an outgroup. 

#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=156G
#$ -l mem_req=156G
#$ -l d_rt=100:00:00
#$ -l s_rt=100:00:00
Dsuite Dtrios populations.snps.vcf SETSinclIso.txt -t MLtree.nwk -n Hya_introgression -c 

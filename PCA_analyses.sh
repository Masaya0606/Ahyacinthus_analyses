#!/usr/bin/sh
#$ -S /usr/bin/bash
#$ -cwd
#$ -l s_vmem=100G
#$ -l mem_req=100G

module add singularity
singularity exec /usr/local/biotools/p/plink\:1.90b6.21--h516909a_0 plink --file populations.plink --out PCA_hya221017_ref_shionzato  --pca header  --allow-extra-chr

#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=100G
#$ -l mem_req=100G
#$ -l d_rt=960:00:00
#$ -l s_rt=960:00:00

ref_map.pl -T 3 -o /refmap_result/  --popmap popmap.txt --samples /bam/ -X "populations: --plink" -X "populations: --phylip-var" -X "populations: --vcf" -X "populations: --treemix" -X "populations: --fstats"

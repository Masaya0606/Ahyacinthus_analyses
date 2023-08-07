#!/bin/sh
#$ -S /bin/bash
#$ -cwd
#$ -l s_vmem=128G
#$ -l mem_req=128G
#$ -l d_rt=480:00:00
#$ -l s_rt=480:00:00

denovo_map.pl -M 5 -T 8 -o /home/mmorita0606/masaya/GrasDi/Stacks/Raw_fastq_2202_hya_colony --popmap popmap.txt --samples /home/mmorita0606/masaya/GrasDi/Raw_fastq_rename2 --paired -X "populations: --plink" -X "populations: --phylip-var" -X "populations: --vcf"


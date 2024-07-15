#!/bin/bash
#SBATCH -J map
#SBATCH -N1 --ntasks-per-node=20
#SBATCH --mem=150G
#SBATCH -t 24:00:00
#SBATCH -q inferno
#SBATCH -A gts-ktk3-coda20

source deactivate
source activate abundance_env

module load samtools/1.14-3alo66

coverm make -t 20 -r ${reference} -1 ../trim/PREMIX/${name}_trim.1.fastq -2 ../trim/PREMIX/${name}_trim.2.fastq -o ./out_bam/${name}


##########USAGE############
#sbatch -o map_out.${name} --export reference=${reference},name=${name} map.sbatch

#!/bin/bash
#SBATCH -J gene_abun
#SBATCH -N1 --ntasks-per-node=8
#SBATCH --mem=50G
#SBATCH -t 03:00:00
#SBATCH -q inferno
#SBATCH -A gts-ktk3-coda20

source deactivate
source activate abundance_env
module load samtools/1.14-3alo66

coverm contig -1 ${metagenome1} -2 ${metagenome2} -r ${gene_file} -m trimmed_mean --trim-min 10 --trim-max 90 -o ${out} --contig-end-exclusion 30 --min-read-percent-identity 95 --min-read-aligned-percent 70 --exclude-supplementary --output-format sparse

##########USAGE############
#sbatch -o gene_abun_out.${name} --export metagenome1=/path/to/forward,metagenome2=/path/to/reverse,gene_file=rep_genes.fnn,out=${output_name} gene_abun.sbatch

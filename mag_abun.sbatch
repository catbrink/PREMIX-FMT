#!/bin/bash
#SBATCH -J mag_abun
#SBATCH -N1 --ntasks-per-node=8
#SBATCH --mem=50G
#SBATCH -t 03:00:00
#SBATCH -q inferno
#SBATCH -A gts-ktk3-coda20

source deactivate
source activate abundance_env
module load samtools/1.14-3alo66

coverm genome -b ${bam_file} --genome-fasta-directory ${mag_dir} -m trimmed_mean --trim-min 10 --trim-max 90 -o ${out} --min-read-percent-identity 95 --min-read-aligned-percent 70 --exclude-supplementary --output-format sparse


##########USAGE############
#sbatch -o mag_abun_out.${name} --export bam_file=/path/to/bam/file,mag_dir=/path/to/MAG/directory,out=${output_name} mag_abun.sbatch

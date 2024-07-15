#!/bin/bash
#SBATCH -J microbecensus
#SBATCH -N1 --ntasks-per-node=16
#SBATCH --mem=50G
#SBATCH -t 04:00:00
#SBATCH -q inferno
#SBATCH -A gts-ktk3-coda20

source deactivate
source activate abundance_env


python ~/p-ktk3-0/apps/MicrobeCensus/scripts/run_microbe_census.py -n 100000000 -t 16 ${input}_trim.1.fastq,${input}_trim.2.fastq ${output}


##########USAGE############
#sbatch -o geq_out.1 -e geq_err.1 --export input=/path/to/reads,output=name geq.sbatch

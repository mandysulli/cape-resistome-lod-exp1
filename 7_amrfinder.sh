#!/bin/bash
#SBATCH --job-name=AMRfinder
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=2gb
#SBATCH --time=12:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu
#SBATCH --array=1-37

module load AMRFinderPlus/3.11.18

#set directory
cd /scratch/mandyh/cape-resistome-lod-exp1/spades_output

##define directory
ref_input='/scratch/mandyh/cape-resistome-lod-exp1/inputs'

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

i=$(cat $ref_input/input_${SLURM_ARRAY_TASK_ID})

##run AMRFinder
amrfinder --nucleotide ./$i\/contigs.fasta.HCov --output ./$i\/$i\_AMRfinder_results
##Compile gene list
cat ./$i\/$i\_AMRfinder_results |cut -f6,12|sed '1d' > ./$i\/$i\_gene_list.txt
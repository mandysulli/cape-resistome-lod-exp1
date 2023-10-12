#!/bin/bash
#SBATCH --job-name=genome_assembly_spades
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=15gb
#SBATCH --time=48:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu
#SBATCH --array=1-37

module load SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4

#set directory
cd /scratch/mandyh/cape-resistome-lod-exp1/spades_output

#define directory
input='/scratch/mandyh/cape-resistome-lod-exp1/paired_trim_reads'
ref_input='/scratch/mandyh/cape-resistome-lod-exp1/inputs'

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

i=$(cat $ref_input/input_${SLURM_ARRAY_TASK_ID})

python /apps/eb/SPAdes/3.14.1-GCC-8.3.0-Python-3.7.4/bin/spades.py --meta --threads 16 --memory 15 --only-assembler -1 $input/M$i\_R1_pair_trim.fastq.gz -2 $input/M$i\_R2_pair_trim.fastq.gz -o ./M$i
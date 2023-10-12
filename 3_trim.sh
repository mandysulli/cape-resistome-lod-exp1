#!/bin/bash
#SBATCH --job-name=trim_filter
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5gb
#SBATCH --time=48:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu
#SBATCH --array=1-37

module load Trimmomatic/0.39-Java-13

#Set directory
cd /scratch/mandyh/cape-resistome-lod-exp

ref_input='/scratch/mandyh/cape-resistome-lod-exp/inputs'

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

i=$(cat $ref_input/input_${SLURM_ARRAY_TASK_ID})

mkdir paired_trim_reads
mkdir unpaired_trim_reads

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE ./Raw_data/$i\.1.fq.gz ./Raw_data/$i\.2.fq.gz ./paired_trim_reads/$i\_R1_pair_trim.fastq.gz ./unpaired_trim_reads/$i\_R1_unpair_trim.fastq.gz ./paired_trim_reads/$i\_R2_pair_trim.fastq.gz ./unpaired_trim_reads/$i\_R2_unpair_trim.fastq.gz -threads 4 -phred33 ILLUMINACLIP:/apps/eb/Trimmomatic/0.39-Java-1.8.0_144/adapters/NexteraPE-PE.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:100
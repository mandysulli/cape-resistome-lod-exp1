#!/bin/bash
#SBATCH --job-name=move
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --mem=100mb
#SBATCH --time=2:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu

cd /scratch/mandyh/TCG52/demultiplex_dual_CAPE

cp *gz /scratch/mandyh/cape-resistome-lod-exp1/Raw_data
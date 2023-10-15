#!/bin/bash
#SBATCH --job-name=count_amr_genes_found
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --mem=200mb
#SBATCH --time=2:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu

#set directory
cd /scratch/mandyh/cape-resistome-lod-exp1/spades_output

## need print count two to use with reformatting program

for i in {1..37}
do
echo "CAPE_$i"
echo $(cat ./CAPE_$i\/CAPE_$i\_AMRfinder_results|wc -l)
echo $(cat ./CAPE_$i\/CAPE_$i\_AMRfinder_results|wc -l)
done
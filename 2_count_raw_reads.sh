#!/bin/bash
#SBATCH --job-name=count_raw
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --mem=500mb
#SBATCH --time=8:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu

#set directory
cd /scratch/mandyh/cape-resistome-lod-exp1/Raw_data

for i in {1..37}
do
echo "CAPE_$i"
echo $(zcat CAPE_$i\.1.fq.gz |wc -l)/4|bc
echo $(zcat CAPE_$i\.2.fq.gz |wc -l)/4|bc
done
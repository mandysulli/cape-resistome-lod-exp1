#!/bin/bash
#SBATCH --job-name=assembly_reformat
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --mem=1gb
#SBATCH --time=4:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu
#SBATCH --array=1-37

## Have to reformat the genome assemblies for AMR finder
## Use a program that was create by Tim Booth - tbooth@ceh.ac.uk, http://nebc.nerc.ac.uk

#set directory
cd /scratch/mandyh/cape-resistome-lod-exp1/spades_output

ref_input='/scratch/mandyh/cape-resistome-lod-exp1/inputs'

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

i=$(cat $ref_input/input_${SLURM_ARRAY_TASK_ID})

echo filtering $i
 for file in ./$i\/contigs.fasta
        do
	grep -F ">" $file | sed -e 's/_/ /g' |sort -nrk 6 |awk '$6>=2.0 && $4>=500 {print $0}'| sed -e 's/ /_/g'|sed -e 's/>//g'>$file.txt
        echo sequences to keep
        wc -l $file.txt
        echo running fastagrep.pl
        /scratch/mandyh/cape-resistome-lod-exp1/fastagrep.pl -f $file.txt $file > $file.HCov
        echo sequences kept
        grep -c ">" $file.HCov
        done

#!/bin/bash
#SBATCH --job-name=input
#SBATCH --partition=iob_p
#SBATCH --ntasks=1
#SBATCH --mem=100mb
#SBATCH --time=4:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mandyh@uga.edu

set -ueo pipefail
SAMPLES="CAPE_1
CAPE_2
CAPE_3
CAPE_4
CAPE_5
CAPE_6
CAPE_7
CAPE_8
CAPE_9
CAPE_10
CAPE_11
CAPE_12
CAPE_13
CAPE_14
CAPE_15
CAPE_16
CAPE_17
CAPE_18
CAPE_19
CAPE_20
CAPE_21
CAPE_22
CAPE_23
CAPE_24
CAPE_25
CAPE_26
CAPE_27
CAPE_28
CAPE_29
CAPE_30
CAPE_31
CAPE_32
CAPE_33
CAPE_34
CAPE_35
CAPE_36
CAPE_37
"
count=1
for i in $SAMPLES
do
echo $i > input_$count
count=$((count+1))
done
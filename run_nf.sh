#!/usr/bin/bash -l
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N Test 
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue
#$ -q gpu.q
# Specify where standard output and error are stored
#$ -o run.out
#$ -e run.err

echo "-------------------------------------------------------------------------"
module load guppy
which guppy_basecaller
source ~/.bashrc
which nf-test
echo "-------------------------------------------------------------------------"
bar_id=$(grep $2 | cut -d ',' -f 1)
cd ~/EDLB/
nextflow main.nf --basecalling --skip_illumina --single_sample --samplesheet $2 --fast5 ~/EDLB/test_data/demultiplexed_fast5/${bar_id} --outdir ${1}_single_isolate_output --flye_args "--asm-coverage ${3}"

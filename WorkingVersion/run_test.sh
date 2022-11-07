#!/usr/bin/bash -l
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N Nf-test 
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue
#$ -q gpu.q
# Specify where standard output and error are stored
#$ -o nftest.out
#$ -e nftest.err

echo "-------------------------------------------------------------------------"
module load guppy/6.3.7-gpu 
which guppy_basecaller
source ~/.bashrc
which nf-test
#echo "$PATH" | tr : '\n'
echo "-------------------------------------------------------------------------"

cd ~/WorkingVersion
nf-test test


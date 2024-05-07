#!/usr/bin/bash
source /etc/profile 
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N v0.5.1
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue (w/out gpu use all.q and uncomment gpu stuff)
# #GPU lines were commented out
#$ -q gpu.q
#$ -l gpu=1
# Number of CPUs to use
#$ -pe smp 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=200G
# Specify where standard output and error are stored.
#$ -o v0.5.1.out
#$ -e v0.5.1.err

ml nextflow/22.10.6
which nextflow
ml dorado
which dorado

#Specify path to your DoradoBasecalling folder
cd /scicomp/home-pure/suj7/EDLB/DoradoBasecalling

#Run the Dorado basecaller Nextflow script
nextflow doradobasecaller.nf -c doradobasecaller.config 



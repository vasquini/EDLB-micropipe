#!/usr/bin/bash
source /etc/profile 
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N nfdorado
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
#$ -o dorado.out
#$ -e dorado.err

# ml guppy
# which guppy_basecaller
# which guppy_barcoder
ml nextflow/22.10.6
which nextflow
ml dorado
which dorado
cd /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/vasquez_samplesheet
# module load guppy/6.4.6-gpu
# which guppy_barcoder

#This works!! (next 3 lines)
#dorado download --model dna_r10.4.1_e8.2_400bps_sup@v4.2.0 
#dorado basecaller -r -x cuda:0 dna_r10.4.1_e8.2_400bps_sup@v4.2.0 /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/mariana_pod5s/pod5_pass/ >dorado_test.bam
#nextflow doradobasecaller.nf -c doradobasecaller.config 

nextflow doradobasecaller.nf -c doradobasecaller.config 



#!/usr/bin/bash
source /etc/profile 
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N con 
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue (w/out gpu use all.q and uncomment gpu stuff)
# #GPU lines were commented out. I changed gpu.q to highmem.q
#$ -q gpu.q
#$ -l gpu=1
# Number of CPUs to use
#$ -pe smp 1
#$ -l h_rt=24:00:00
#I've increased mem from 200G to 300G
#$ -l h_vmem=400G
# Specify where standard output and error are stored.
#$ -o con.out
#$ -e con.err

ml nextflow/22.10.6
which nextflow
# ml dorado
# which dorado

#Specify path to your DoradoBasecalling folder
cd /scicomp/home-pure/suj7/EDLB/DoradoContainer
#cd /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/vasquez_samplesheet

#This works!! (next 3 lines)
#dorado download --model dna_r10.4.1_e8.2_400bps_sup@v4.2.0 
#dorado basecaller -r -x cuda:0 dna_r10.4.1_e8.2_400bps_sup@v4.2.0 /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/mariana_pod5s/pod5_pass/ >dorado_test.bam
#nextflow doradobasecaller.nf -c doradobasecaller.config 

nextflow doradobasecaller.nf -c doradobasecaller.config 



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
#$ -o t7.out
#$ -e t7.err

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



# -profile rosalind -c /scicomp/reference/nextflow/configs/cdc-dev.config  >dorado_test.bam
#dorado basecaller -r dna_r10.4.1_e8.2_400bps_sup@v4.2.0 --device cuda:0 /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/mariana_pod5s/pod5_pass/ -profile rosalind -c /scicomp/reference/nextflow/configs/cdc-dev.config  >dorado_test.bam
nextflow doradobasecaller.nf -c doradobasecaller.config 
# -profile rosalind
#UNCOMMENT LATER
#nextflow doradobasecaller.nf  -profile rosalind -c  /scicomp/reference/nextflow/configs/cdc-dev.config

#guppy_barcoder -i ~/DoradoRuns/fastq -s GXB014_Demux --device auto --compress_fastq  --barcode_kits "SQK-NBD114-24" --worker_threads 2

# nextflow main.nf --skip_illumina --skip_qc --samplesheet ~/gxb03287-22-014_samplesheet.csv \
#  --medaka_model "r1041_e82_400bps_sup_g615" --fastq /scicomp/home-pure/suj7/EDLB/GXB014_Demux/fastq \
#  --outdir TEST_GXB03287_22_014_Output --flye_args "--asm-coverage 50" -resume -work-dir ~/EDLB/work/cc/1d84961a222240bf6254e416c765a1/  
#  #-resume 
#  #-c /scicomp/reference/nextflow/configs/cdc-dev.config -profile rosalind,singularity



## I should break up gpu workflow from the cpu




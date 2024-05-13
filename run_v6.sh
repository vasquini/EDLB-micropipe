#!/usr/bin/bash
source /etc/profile 
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N gxb14
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue (w/out gpu use all.q and uncomment gpu stuff)
##$ -q gpu.q
##$ -l gpu=1
# Number of CPUs to use
#$ -pe smp 1
#$ -l h_rt=24:00:00
#$ -l h_vmem=200G
# Specify where standard output and error are stored
#$ -o piptest.out
#$ -e piptest.err

ml guppy
which guppy_basecaller
which guppy_barcoder
ml nextflow
which nextflow
cd ~/EDLB
module load guppy/6.4.6-gpu
which guppy_barcoder

nextflow main.nf --skip_illumina --skip_qc --samplesheet ~/gxb03287-22-014_samplesheet.csv \
 --medaka_model "r1041_e82_400bps_sup_g615" --fastq /scicomp/home-pure/suj7/EDLB/GXB014_Demux/fastq \
 --outdir microPIPE_Output_20240510 --flye_args "--asm-coverage 50" 




# nextflow main.nf --skip_illumina --basecalling --demultiplexing --skip_racon --samplesheet ~/CSVFiles/n20169_22_004_1.csv --guppy_config_gpu "dna_r10.4.1_e8.2_400bps_hac.cfg" \
# --medaka_model "r1041_e82_400bps_sup_g615" --fast5 /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/minION/data/N20169-22-004/no_sample/20220610_1611_MN20169_FAT00430_b414a7b0/fast5/ \
# --outdir N20169-22-004_V5_50X_1 --flye_args "--asm-coverage 50" --guppy_barcode_kits "SQK-NBD114-24"


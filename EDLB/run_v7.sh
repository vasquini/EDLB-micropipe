#!/usr/bin/bash
source /etc/profile 
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N v7 
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
#$ -o test.out
#$ -e test.err

module load guppy/6.4.6-gpu
which guppy_basecaller
which guppy_barcoder
ml nextflow/22.10.6
which nextflow
which samtools
which dorado
cd ~/EDLB
#guppy_barcoder -i ~/DoradoRuns/fastq -s GXB014_Demux --device auto --compress_fastq  --barcode_kits "SQK-NBD114-24" --worker_threads 2

## Attempt to run V7 of Micropipe
# Dorado test
nextflow main.nf --skip_illumina --skip_qc --samplesheet ~/gxb03287-22-014_samplesheet.csv \
 --medaka_model "r1041_e82_400bps_sup_g615" --pod5_dir /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/mariana_pod5s/pod5_pass/ \
 --outdir v7_Output --flye_args "--asm-coverage 50" 
#Past test
#nextflow main.nf --skip_illumina --skip_qc --samplesheet ~/gxb03287-22-014_samplesheet.csv \
# --medaka_model "r1041_e82_400bps_sup_g615" --fastq /scicomp/home-pure/suj7/EDLB/GXB014_Demux/fastq \
# --outdir TEST_GXB03287_22_014_Output --flye_args "--asm-coverage 50" 


#nextflow main.nf --skip_illumina --skip_qc --samplesheet ~/gxb03287-22-014_samplesheet.csv \
# --medaka_model "r1041_e82_400bps_sup_g615" --fastq /scicomp/home-pure/suj7/EDLB/GXB014_Demux/fastq \
# --outdir TEST_GXB03287_22_014_Output --flye_args "--asm-coverage 50" -resume -work-dir ~/EDLB/work/cc/1d84961a222240bf6254e416c765a1/  
 #-resume 
 #-c /scicomp/reference/nextflow/configs/cdc-dev.config -profile rosalind,singularity


# nextflow main.nf --skip_illumina --samplesheet ~/gxb03287-22-013_samplesheet.csv \
#  --medaka_model "r1041_e82_400bps_sup_g615" --fastq /scicomp/home-pure/suj7/EDLB/GXB013_Demux/fastq \
#  --outdir GXB03287_22_013_Output --flye_args "--asm-coverage 50" --guppy_barcode_kits "SQK-NBD114-24"

#guppy_barcoder -i ~/DoradoRuns/fastq -s GXB013_Demux --device auto --compress_fastq  --barcode_kits "SQK-NBD114-24" --worker_threads 2
# nextflow main.nf --skip_illumina --demultiplexing --samplesheet ~/gxb03287-22-015_samplesheet.csv --guppy_config_gpu "dna_r10.4.1_e8.2_400bps_sup@v4.2.0.cfg" \
#  --medaka_model "r1041_e82_400bps_sup_g615" --fastq /scicomp/home-pure/suj7/EDLB/GXB013_Demux/fastq \
#  --outdir GPU_Test_OUTPUT --flye_args "--asm-coverage 50" --guppy_barcode_kits "SQK-NBD114-24"

## I should break up gpu workflow from the cpu



# nextflow main.nf --skip_illumina --basecalling --demultiplexing --skip_racon --samplesheet ~/CSVFiles/n20169_22_004_1.csv --guppy_config_gpu "dna_r10.4.1_e8.2_400bps_hac.cfg" \
# --medaka_model "r1041_e82_400bps_sup_g615" --fast5 /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/minION/data/N20169-22-004/no_sample/20220610_1611_MN20169_FAT00430_b414a7b0/fast5/ \
# --outdir N20169-22-004_V5_50X_1 --flye_args "--asm-coverage 50" --guppy_barcode_kits "SQK-NBD114-24"


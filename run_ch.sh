#!/usr/bin/bash -l
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N skip
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue
#$ -q gpu.q
# Specify where standard output and error are stored
#$ -o skiptest.out
#$ -e skiptest.err

ml guppy
which guppy_basecaller
which guppy_barcoder
ml nextflow/22.10.6
which nextflow
cd EDLB


#guppy_basecaller --compress_fastq -i  ~/EDLB/test_data/data_artic/ -s ~/EDLB/data_artic/basecall_tiny/ -c dna_r9.4.1_450bps_hac.cfg -x auto --recursive -q 0 --disable_qscore_filtering



nextflow main.nf --skip_racon --basecalling --skip_qc --demultiplexing --skip_illumina --samplesheet ~/arctic_samplesheet.csv  --guppy_config_gpu "dna_r9.4.1_450bps_hac.cfg" \
 --medaka_model "r941_min_sup_g507" --fast5 ~/EDLB/test_data/data_artic/ \
 --outdir SkipRacon_Test --guppy_barcode_kits "EXP-NBD104" --flye_args "--asm-coverage 40 --min-overlap 1000"

#Without skipping Racon
# nextflow main.nf --skip_pycoqc --basecalling --demultiplexing --skip_illumina --samplesheet ~/CSVFiles/n20169_22_001.csv  --guppy_config_gpu "dna_r9.4.1_450bps_sup.cfg" \
#  --medaka_model "r941_min_sup_g507" --fast5 /scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/minION/data/N20169-22-001/N20169-22-001/20220413_2056_MN20169_FAS96196_e231ec75/fast5/ \
#  --outdir NoRacon_N20169_22_001_50X --flye_args "--asm-coverage 50" --guppy_barcode_kits "EXP-NBD114" 

# nextflow main.nf --skip_pycoqc --basecalling --skip_illumina --samplesheet ~/r10_samplesheet.csv  --guppy_config_gpu "dna_r10.4.1_e8.2_400bps_hac.cfg" \
#  --medaka_model "r1041_e82_400bps_sup_g615" --fast5 /scicomp/instruments-pure/23-7-671_Nanopore-GridION-GXB03287/GXB03287-22-016/GXB03287-22-16/20221114_1801_X1_FAV22165_e40d7efb/fast5_pass \
#  --outdir R10_Out_latest --flye_args "--asm-coverage 40" --guppy_barcode_kits "SQK-NBD114-96"

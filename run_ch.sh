#!/usr/bin/bash -l
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N YourJobNameHere
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue
#$ -q gpu.q
# Specify where standard output and error are stored
#$ -o log.out
#$ -e log.err

ml guppy
which guppy_basecaller
which guppy_barcoder
ml nextflow/22.10.6
which nextflow
cd EDLB


##FIXME: Uncomment if .cfg doesn't work
# nextflow main.nf --skip_qc --skip_pycoqc --skip_porechop --basecalling --skip_illumina --samplesheet ~/r10_samplesheet.csv  --flowcell "FLO-MIN114" --kit "SQK-NBD114-96" \
# --medaka_model "r1041_e82_400bps_sup_g615" --fast5 /scicomp/instruments-pure/23-7-671_Nanopore-GridION-GXB03287/GXB03287-22-016/GXB03287-22-16/20221114_1801_X1_FAV22165_e40d7efb/fast5_pass \
# --outdir R10_Out --flye_args "--asm-coverage 40"

nextflow main.nf --skip_pycoqc --basecalling --skip_illumina --samplesheet ~/r10_samplesheet.csv  --guppy_config_gpu "dna_r10.4.1_e8.2_400bps_hac.cfg" \
 --medaka_model "r1041_e82_400bps_sup_g615" --fast5 /scicomp/instruments-pure/23-7-671_Nanopore-GridION-GXB03287/GXB03287-22-016/GXB03287-22-16/20221114_1801_X1_FAV22165_e40d7efb/fast5_pass \
 --outdir R10_Out_HAC --flye_args "--asm-coverage 40" --guppy_barcode_kits "SQK-NBD114-96"

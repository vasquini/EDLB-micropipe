#!/usr/bin/bash -l
# Assign Job-Name instead of defauly which is the name of job-script
#$ -N bdx 
# Start the script in the current working directory
#$ -V -cwd
# Send to GPU queue
#$ -q gpu.q
# Specify where standard output and error are stored
#$ -o testch.out
#$ -e testch.err

#mkdir mylogs_multiso
#mkdir mylogs_t
ml nextflow/22.10.6
which nextflow
cd EDLB

# for i in $(cat ~/CovList.csv )
# do 
#    fn=$(echo $i | cut -d ',' -f 1)
#    cov=$(echo $i | cut -d ',' -f 2)
#    nrows=$(cat ~/multsingle_samplesheet.csv | wc -l)
#    n=$((nrows-1))
#    #echo $n
#    barcodes=$(tail -$n ~/multsingle_samplesheet.csv | cut -d , -f 1)
#    coverages=$(cat ~/CovList.csv | cut -d ',' -f 2)
#    echo $barcodes
#    head -1 ~/multsingle_samplesheet.csv > ${fn}_mini.csv
#    grep $fn ~/multsingle_samplesheet.csv >> ${fn}_mini.csv
#    qsub -N run_${fn} -o ~/mylogs_t/run_${fn}.out -e ~/mylogs_t/run_${fn}.err ~/run_nf.sh $fn ${fn}_mini.csv $cov 
# done

#pass a list as an argument, get barcode ids, concatenate these barcode ids switch line 12 to just getting the barcode id, split those up and put into a channel.
#I don't need qsub, call nextflow until getting all barcodes!

# nrows=$(cat ~/multsingle_samplesheet.csv | wc -l)
# n=$((nrows-1))
# samples=$(tail -$n ~/multsingle_samplesheet | cut -d ',' -f 1)
# barcodes=$(tail -$n ~/multsingle_samplesheet.csv | cut -d , -f 1)
# coverages=$(cat ~/CovList.csv | cut -d ',' -f 2)

nextflow main.nf --basecalling --skip_illumina --samplesheet ~/multsingle_samplesheet.csv --fast5 ~/EDLB/test_data/demultiplexed_fast5/ --outdir BDX_ChTest --flye_args "--asm-coverage 40"

#I am thinking for different coverages they should be included in the samplesheet as a column
#Check if column empty when running flye or passing to it
#"--asm-coverage ${3}"
# Add --compress_fastq to guppy_basecaller_args?

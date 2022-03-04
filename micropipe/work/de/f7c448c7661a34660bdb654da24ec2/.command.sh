#!/bin/bash -ue
set +eu
/scratch/ont-guppy/bin/guppy_barcoder -i fq -s $PWD --device auto --compress_fastq --recursive --trim_barcodes -q 0 --barcode_kits SQK-RBK004 --worker_threads 2
cp .command.log guppy_barcoder.log
for dir in barc*/ uncl*/; do
	barcode_id=${dir%*/}
	cat ${dir}/*.fastq.gz > ${barcode_id}.fastq.gz
done
/scratch/ont-guppy/bin/guppy_barcoder --version > guppy_barcoder_version.txt

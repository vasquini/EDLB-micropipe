#!/bin/bash -ue
set +eu
porechop -i barcode01.fastq.gz -t 4 -o trimmed.fastq.gz 
cp .command.log porechop.log
porechop --version > porechop_version.txt

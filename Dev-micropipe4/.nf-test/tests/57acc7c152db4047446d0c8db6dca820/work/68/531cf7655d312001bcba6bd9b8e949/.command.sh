#!/bin/bash -ue
set +eu
porechop -i GXB01322_20181217_FAK35493_GA10000.fastq.gz -t 4 -o trimmed.fastq.gz 
cp .command.log porechop.log
porechop --version > porechop_version.txt

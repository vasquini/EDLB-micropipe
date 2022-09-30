#!/bin/bash -ue
set +eu
//MV: changed nano-corr to nano-hq
flye --nano-hq filtered.fastq.gz --genome-size 1m --threads 4 --out-dir $PWD 
flye -v 2> flye_version.txt

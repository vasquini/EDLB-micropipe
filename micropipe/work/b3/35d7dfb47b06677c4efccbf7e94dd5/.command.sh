#!/bin/bash -ue
set +eu
flye --nano-raw filtered.fastq.gz --genome-size 5.5m --threads 4 --out-dir $PWD --plasmids
flye -v 2> flye_version.txt

#!/bin/bash -ue
set +eu
jsa.np.filter --input trimmed.fastq.gz --lenMin 1000 --qualMin 10 --output filtered.fastq.gz

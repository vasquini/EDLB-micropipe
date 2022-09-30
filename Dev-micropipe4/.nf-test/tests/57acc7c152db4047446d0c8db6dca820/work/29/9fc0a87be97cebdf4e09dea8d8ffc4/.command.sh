#!/bin/bash -ue
set +eu
jsa.np.filter --input trimmed.fastq.gz --lenMin 1000 --qualMin 4 --output filtered.fastq.gz

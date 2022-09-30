#!/bin/bash -ue
set +eu
medaka_consensus -i filtered.fastq.gz -d flye_racon_4.fasta -o $PWD -t 8 -m r941_min_sup_g507
rm consensus_probs.hdf calls_to_draft.bam calls_to_draft.bam.bai
cp .command.log medaka.log
medaka --version > medaka_version.txt

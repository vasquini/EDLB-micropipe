#!/bin/bash -ue
set +eu
quast.py -o $PWD -t 1 -l S24 flye_polishedLR_SR_fixstart.fasta 
quast --version > quast_version.txt

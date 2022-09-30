#!/bin/bash -ue
set +eu
quast.py -o $PWD -t 1 -l GXB01322_20181217_FAK35493_GA10000 flye_polishedLR_fixstart.fasta 
quast --version > quast_version.txt

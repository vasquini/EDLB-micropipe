#!/bin/bash -ue
set +eu
pycoQC -f sequencing_summary.txt -o $PWD/pycoQC.html
pycoQC --version > pycoqc_version.txt

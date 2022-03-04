#!/bin/bash -ue
set +eu
ln -s assembly.fasta flye_racon_0.fasta
for i in `seq 1 4`; do
	ii=$(($i-1))
	minimap2 -t 4 -ax map-ont flye_racon_$ii.fasta filtered.fastq.gz > flye.gfa$i.sam
	racon -m 8 -x -6 -g -8 -w 500 -t 4 filtered.fastq.gz flye.gfa$i.sam flye_racon_$ii.fasta --include-unpolished > flye_racon_$i.fasta
	rm flye.gfa$i.sam
	python3 /scicomp/home-pure/suj7/micropipe/bin/rotate_circular_fasta.py flye_racon_$i.fasta assembly_info.txt flye_racon_$i.tmp.fasta
	cp flye_racon_$i.tmp.fasta flye_racon_$i.fasta
done
cp .command.log racon.log
racon --version > racon_version.txt

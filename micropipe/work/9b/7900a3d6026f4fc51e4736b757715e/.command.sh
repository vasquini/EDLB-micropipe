#!/bin/bash -ue
set +eu
	ls S24EC_1P_test.fastq.gz S24EC_2P_test.fastq.gz > sgs.fofn
	echo -e "task = 1212
genome = consensus.fasta
sgs_fofn = sgs.fofn
multithread_jobs = 4" > nextpolish.cfg
	nextPolish nextpolish.cfg
	if [[ "1212" == "1212" ]] || [[ "1212" == "best" ]] ; then
		cat 01.kmer_count/*polish.ref.sh.work/polish_genome*/genome.nextpolish.part*.fasta > S24_flye_polishedLR_SR_1.fasta
		cat 03.kmer_count/*polish.ref.sh.work/polish_genome*/genome.nextpolish.part*.fasta > S24_flye_polishedLR_SR_2.fasta
		rm -r 00.score_chain 01.kmer_count 02.score_chain 03.kmer_count
	elif [[ "1212" == "12" ]]; then	
		cat 01.kmer_count/*polish.ref.sh.work/polish_genome*/genome.nextpolish.part*.fasta > S24_flye_polishedLR_SR_2.fasta
		rm -r 00.score_chain 01.kmer_count
	fi
	rm input.sgspart*.fastq.gz
	cp .command.log nextpolish.log
	nextPolish --version 2> nextpolish_version.txt

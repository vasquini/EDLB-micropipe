#!/bin/bash -ue
set +eu
if [[ "dna_r9.4.1_450bps_sup.cfg" != "false" ]] ; then
	/apps/x86_64/guppy/5.0.7/bin/guppy_basecaller -i fast5_tiny -s $PWD --device auto --config dna_r9.4.1_450bps_sup.cfg --recursive --trim_barcodes -q 0 --disable_qscore_filtering
elif [[ "false" != "false" ]] && [[ "false" != "false" ]]; then
	/apps/x86_64/guppy/5.0.7/bin/guppy_basecaller -i fast5_tiny -s $PWD --device auto --flowcell false --kit false --num_callers 8 --recursive --trim_barcodes -q 0 --disable_qscore_filtering
fi
cp .command.log guppy_basecaller.log
cat *.fastq > GXB01322_20181217_FAK35493_GA10000.fastq
gzip GXB01322_20181217_FAK35493_GA10000.fastq
/apps/x86_64/guppy/5.0.7/bin/guppy_basecaller --version > guppy_basecaller_version.txt

#!/usr/bin/env nextflow

/*
Nextflow workflow for ONT basecalling using Dorado basecaller
*/


process BASECALL_DORADO {
	tag "Dorado on ${sample_id}"
	errorStrategy = 'ignore'
	publishDir "$params.outdir/0_basecalling/",  mode: 'copy', pattern: '*.bam'
	input:
	tuple val(sample_id), path(reads)
	
	output:
	tuple val(sample_id), path("${sample_id}.bam")
	
	script:
	"""
	${params.dorado_gpu_folder}/dorado download --model ${params.dorado_model}
	${params.dorado_gpu_folder}/dorado basecaller -b ${params.dorado_batchsize} -r -x ${params.dorado_device} ${params.dorado_basecaller} ${reads}  > ${params.outdir}/0_basecalling/${sample_id}.bam
	"""
}

process READSGET {
	tag "Formatting reads for ${sample_id}"
	publishDir(
		path: "${params.outdir}/0_basecalling/${sample_id}/",
		mode: 'copy',
		saveAs: { filename ->
					if (filename.endsWith('.fastq')) "$filename"
					else null
		}
	)
	errorStrategy = 'ignore'
	
	input:
	tuple val(sample_id), path(bamfile)
	
	output:
	tuple val(sample_id), path("${sample_id}.fastq")
	
	script:
	"""
	samtools bam2fq ${bamfile} > "${sample_id}.fastq"
	"""
}

workflow {
	main_dir = params.pod5
	all_dirs = file(main_dir)
	//println all_dirs
	all_subdirs = all_dirs.listFiles()
	//println all_subdirs
	
	Channel //set channel for POD5s
		.of(all_subdirs)
		.map{ file -> tuple(file.SimpleName, file) }
		.set{pod5_ch}

	bam_ch = BASECALL_DORADO(pod5_ch)
		.map{ outTuple -> outTuple[0,1] }
	fastq_ch = READSGET(bam_ch)
}

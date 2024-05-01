// Dorado module Ethan Hetrick, Mariana Vasquez
process DORADO {
    tag "$meta.id"
    label 'process_gpu'
    errorStrategy = 'ignore'

    input:
    tuple val(meta), path(pod5)
    path model

    output:
    tuple val(meta), path("*.bam"), emit: bam
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    def batchsize = ""
    def device = ""
    """
    dorado \\
        basecaller \\
        $args \\
        -b $batchsize \\
        -r \\
        -x $device \\
        $model \\
        $pod5 > ${prefix}.bam

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        dorado: \$(dorado --version |& sed '1!d ; s/dorado //')
    END_VERSIONS
    """
}
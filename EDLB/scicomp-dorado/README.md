## Credits

**scicomp/dorado was originally written by Ethan Hetrick (CDC/NCEZID/DIDRI/OAMD - Bioinformatics Scientist) & Mariana Vasquez (CDC/NCEZID/DFWED/EDLB - ORISE Fellow).**

## Introduction

**scicomp/dorado** is a bioinformatics pipeline that ...

1. Uses the dorado/0.5.1 module on SciComp's shared compute services, utilizing the gpu.q as well!
2. Performs basecalling on pod5 files

## Testing

A test profile was configured that points to data in /scicomp/reference-pure so that you can easily test this pipeline for functionality. The recommended use is:

```bash
nextflow run scicomp-dorado/main.nf \
   --outdir <path> \
   -c /scicomp/reference-pure/nextflow/configs/cdc-dev.config \
   -profile singularity,rosalind,test
```

## Usage

> [!NOTE]
> If you are new to Nextflow and nf-core, please refer to [this page](https://nf-co.re/docs/usage/installation) on how to set-up Nextflow. Make sure to [test your setup](https://nf-co.re/docs/usage/introduction#how-to-run-a-pipeline) with `-profile test` before running the workflow on actual data.

<!-- TODO nf-core: Describe the minimum required steps to execute the pipeline, e.g. how to prepare samplesheets.
     Explain what rows and columns represent. For instance (please edit as appropriate):

First, prepare a samplesheet with your input data that looks as follows:

`samplesheet.csv`:

```csv
id,pod5
2014C-4055,/scicomp/groups/OID/NCEZID/DFWED/EDLB/projects/the-chunnel/mariana_pod5s/pod5_pass/01_2014C-4055/2014C-4055.pod5
```

Each row represents a pod5 file.

-->

Now, you can run the pipeline using:

<!-- TODO nf-core: update the following command to include all required parameters for a minimal example -->

```bash
nextflow run scicomp/dorado \
   -profile <docker/singularity/.../institute> \
   --input samplesheet.csv \
   --outdir <OUTDIR> \
   --model <path to dorado model> \
   -c /scicomp/reference-pure/nextflow/configs/cdc-dev.config \
   -profile singularity,rosalind
```

> [!WARNING]
> Please provide pipeline parameters via the CLI or Nextflow `-params-file` option. Custom config files including those provided by the `-c` Nextflow option can be used to provide any configuration _**except for parameters**_;
> see [docs](https://nf-co.re/usage/configuration#custom-configuration-files).

## Contributions and Support

If you would like to contribute to this pipeline, please see the [contributing guidelines](.github/CONTRIBUTING.md).

## Citations

<!-- TODO nf-core: Add citation for pipeline after first release. Uncomment lines below and update Zenodo doi and badge at the top of this file. -->
<!-- If you use scicomp/dorado for your analysis, please cite it using the following doi: [10.5281/zenodo.XXXXXX](https://doi.org/10.5281/zenodo.XXXXXX) -->

<!-- TODO nf-core: Add bibliography of tools and data used in your pipeline -->

An extensive list of references for the tools used by the pipeline can be found in the [`CITATIONS.md`](CITATIONS.md) file.

This pipeline uses code and infrastructure developed and maintained by the [nf-core](https://nf-co.re) community, reused here under the [MIT license](https://github.com/nf-core/tools/blob/master/LICENSE).

> **The nf-core framework for community-curated bioinformatics pipelines.**
>
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
>
> _Nat Biotechnol._ 2020 Feb 13. doi: [10.1038/s41587-020-0439-x](https://dx.doi.org/10.1038/s41587-020-0439-x).

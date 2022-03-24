#BCFTOOLS/SAMTOOLS/HTSLIB docker container

This is a repo that contains the code for a docker container with bcftools, samtools and htslib.

The original repositories can be found at https://github.com/samtools

## Installation

To install the container, run the following using docker:

```bash
docker pull befh/bcftools-htslib-samtools
```

or the following with singularity:

```bash
singularity pull --name bcftools.img docker://befh/bcftools-htslib-samtools:latest
```

To use with Snakemake, you do not need to install. Just put the following in the Snakefile:

```
container: 'docker://befh/bcftools-htslib-samtools:latest'
```

Then run with `snakemake --use-singularity` see https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html for more info.

## Usage

To run with docker, `docker run bcftools [ARGS]`.

To run with singularity, `singularity run bcftools.img [ARGS]`.

To access tools other than bcftools, open a shell.

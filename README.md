# Bioinformatics Pipeline using Docker Compose

This Docker Compose configuration sets up a bioinformatics pipeline using Fastp, Bowtie2, Samtools, and Freebayes. The pipeline processes paired-end sequencing data to generate a Variant Call Format (VCF) file.

## Services

### 1. fastp
- **Image:** biocontainers/fastp:v0.20.1_cv1
- **Description:** Quality control tool for sequencing data.
- **Command:** Processes paired-end FASTQ files and generates cleaned output.

### 2. bowtie2
- **Image:** biocontainers/bowtie2:v2.4.1_cv1
- **Description:** Tool for aligning sequencing reads to long reference sequences.
- **Command:** Builds an index and aligns processed data.

### 3. samtools
- **Image:** biocontainers/samtools:v1.9-4-deb_cv1
- **Description:** Refining alignments of short DNA sequence reads in post-processing tasks.
- **Command:** Converts SAM format to BAM format for downstream processing.

### 4. freebayes
- **Image:** biocontainers/freebayes:v1.2.0-2-deb_cv1
- **Description:** Bayesian tool specialized in detecting genetic variants.
- **Command:** Calls genetic variants from the processed data and generates a VCF file.

## Usage

1. Make sure you have Docker installed on your system.
2. Clone this repository to your local machine.
3. Navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the bioinformatics pipeline:

    ```bash
    docker-compose up
    ```

   This will pull the necessary Docker images and execute the pipeline.

## Notes
- Adjust input and output file paths as needed in the `docker-compose.yml` file.

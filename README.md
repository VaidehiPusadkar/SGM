# SGM
Segmented Genome Model (SGM) Builder
The application facilitated the generation of models from segmented and clustered genomes. This process involves a two step in the analysis: in the first step, it accepts the genomes in .fna format, performing the segmentation and clustering of each genome, producing multiple cluster files (in .fa format). In the second step, it processes a the metagenome read file (in FASTA format), converting it to markov-chain indices for efficient probability calculation against the clusters of each genome file instead of complete genome files in SMM. Markov chains are constructed directly from genomic FASTA files, and are retained in memory until all reads are classified.

## 1. Segmentation and Clustering of the genome

This step involves the segmentation and clustering of each genome based on the specied Markov model order and the threshold for genome segmentation, contiguous clustering and noncontiguous clustering. The Markov model order is used here for the calculation of divergence measure used in genome clustering.
To execute this step:
1. Place the genome file for modeling in the "db_folder," which currently contains an example FASTA genome file.
2. Run the shell script in the Linux terminal: `Step_1.sh`

The output of this steps:
1. New folder "clustered_genomes" - containing clustered FASTA (.fa) files for each genome.
2. A "Genomes.txt",listing the absolute path of all the clusterd genomes to be modeled in the next step of taxonomic classifcation.
   
## 2. Taxonomic classification of the genome

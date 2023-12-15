# SGM
Segmented Genome Model (SGM) Builder
The application for generating models from the genomes which are segmented and clustered genomes. This process involves a two step in the analysis; the first step accepts the genomes(.fna format) and performes the segmentation and clustering of each genome to provide multiple cluster files(.fa format) of each genomes. The second steps accepts the metagenome read file (in FASTA format), and converted to markov-chain indices for rapid calculation of probabilities against the clusters of each genome file instead of complete genome files in SMM. Markov chains are built directly from genomic FASTA files, and kept in memory until all reads have been classified.

# 1. Segmentation and Clustering of the genome
To perform segmentation and clustering of each genome

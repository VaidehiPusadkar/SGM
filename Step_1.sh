ulimit -s unlimited

#markov_order=$1 
#confid1=$2
#confid2=$3
#confid3=$4

######## Segmentation and clustering of each genome #######################################
echo ">>starting segmentation and clustering"

cc Seg_clus/seg_clus.c -lm -o sgm

for file in db_Genomes/*.fna; do ./sgm "$file" 2 0.90 0.95 0.99;done >out

echo ">>segmentation-clustering completed."

######## creating the fasta sequence file for each cluster ############

for file in db_Genomes/*.fna; do 

perl Seg_clus/extract.pl $file $file.clustering2.txt tempfile.txt >LL

perl Seg_clus/clustersplit.pl tempfile.txt;done

########### Moving the files to the different folder ##################

mkdir clustered_genomes
mv db_Genomes/*.fa clustered_genomes/

###### remove the unwanted files ###############
rm db_Genomes/*.seg.txt
rm db_Genomes/*clustering2.txt
rm tempfile.txt LL seq.txt seq1.txt out

######### generate a lxt file for generating a list of genome cluster files which will be used for by taxonomic classification step ################# 
ls -d $PWD/clustered_genomes/* > Genomes.txt

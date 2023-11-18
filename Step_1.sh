ulimit -s unlimited

markov_order=$1 
confid1=$2
confid2=$3
confid3=$4

######## Segmentation and clustering of each genome #######################################
echo ">>starting segmentation and clustering"
cc Seg_clus/seg_clus.c -lm
for file in Base_Genomes/*.fna; do ./a.out "$file" $markov_order $confid1 $confid2 $confid3;done >out
rm Base_Genomes/*.seg.txt

echo ">>segmentation-clustering completed."

######## creating the fasta sequence file for each cluster ############

for file in Base_Genomes/*.fna; do 
perl Seg_clus/seqextract.pl $file $file.clustering2.txt tempfile.txt >LL

perl Seg_clus/spilit.pl tempfile.txt;done

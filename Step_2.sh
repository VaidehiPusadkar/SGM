
ulimit -s unlimited

genome_file=$1
read_Fasta_file=$2
markovmodelorder=$3

### compiling and running SMM on the file ####
g++ -Ofast smm.cpp -o smm

./smm $genome_file $read_Fasta_file $markovmodelorder norm >> Metagenomic_Read_Scores.tsv

### classification and count of each read ####

#awk -F"\t" 'NR==1{split($0, header)} NR>1{if (NR==2) {for (i=2; i<=NF; i++) min[i]=$i} for (i=2; i<=NF; i++) {if ($i < min[i]) {min[i]=$i; row[i]=$1}}} END{for (i=2; i<=NF; i++) print row[i]}' Metagenomic_Read_Scores.tsv > min_rownames_2
#sed -i 's|/|\t|g' min_rownames_2
#cut -f2 min_rownames_2 > all_read_classification_raw
#sed -i 's|_|\t|g' all_read_classification_raw
#cut -f1 all_read_classification_raw > all_read_classification_removed_cluster_number
#awk  '{gsub(".fna","\t",$0); print;}' all_read_classification_removed_cluster_number > all_read_classification_raw_1
#sort all_read_classification_raw_1 | uniq --count > all_reads_classification_counts
#sed -i 's/^[ \t]*//' all_reads_classification_counts
#sed -i 's| |\t|g' all_reads_classification_counts

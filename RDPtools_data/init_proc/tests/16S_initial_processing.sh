#!/bin/bash

# Configure paths
# RDPToolsDir=/mnt/research/rdp/public/RDPTools # On MSU's HPCC
RDPToolsDir=/usr/local/RDPTools # My local installation 


# Initial processing (sorting & trimming)
java -Xmx2g -jar $RDPToolsDir/SeqFilters.jar --forward-primers AYTGGGYDTAAAGNG --max-forward 2 --reverse-primers CCGTCAATTCMTTTRAGT --max-reverse 0 --seq-file 16S_example_454Reads.fastq --min-length 300 --max-length 350 --skip-notag --tag-file 16S_tag_file.txt --outdir initial_process

# Create directory for trimmed sequences and copy them to it.
mkdir trimmed_seqs
cd initial_process
find . -name *trimmed.fastq  -type f -exec cp {} ../trimmed_seqs/ \;

# Remove the trimmed portion of the name.
cd ../trimmed_seqs
for f in $(ls *trimmed.fastq)
do
	mv $f ${f/_trimmed/}
	
done

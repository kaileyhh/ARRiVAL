#! /bin/bash
# command_line_classification_script
# Configure paths
# RDPToolsDir=/mnt/research/rdp/public/RDPTools # Path to RDPTools on MSU's HPCC
RDPToolsDir=/usr/local/RDPTools # Path to RDPTools on my local installation

# Classifiy trimmed sequences. Trimmed sequences are in sub-folder trimmed_seqs
java -Xmx2g -jar $RDPToolsDir/classifier.jar classify --gene 16srrna -c 0.5 --format fixrank --hier_outfile hier_file.txt --outputFile classified.txt trimmed_seqs/*.fastq

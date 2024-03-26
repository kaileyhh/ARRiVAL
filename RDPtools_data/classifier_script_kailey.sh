#! /bin/bash
# command_line_classification_script
# Configure paths
# RDPToolsDir=/mnt/research/rdp/public/RDPTools # Path to RDPTools on MSU's HPCC
RDPToolsDir=~/Desktop/courses-s24/microbiome-networks # Path to RDPTools on my local installation
ClassifierDir=~/rdp_classifier_2.14/dist
OutputDir=~/classified/crc/

cd "data/crc" || exit
for file in *.fastq; 
do
    output=${file%.*}"_classified"
    echo 'classifying '{$output}
    # $output +=  "_classified"
    # Classifiy trimmed sequences. Trimmed sequences are in sub-folder trimmed_seqs
    # java -Xmx2g -jar $ClassifierDir/classifier.jar classify --gene 16srrna -c 0.5 --format fixrank --hier_outfile hier_file.txt --outputFile $output.txt $file
    timeout 60 java -Xmx2g -jar $ClassifierDir/classifier.jar classify --gene 16srrna -c 0.5 --format fixrank --hier_outfile hier_file.txt --outputFile $OutputDir/$output.txt $file
    echo 'done'
done

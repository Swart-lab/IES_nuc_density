
PREFIX=EV_PGM_KD_MP
#PREFIX=PtCAF_PGM_KD_MP
#Uncomment line above and delete previous one as appropriate

hisat2 --threads 48 -q -x ptetraurelia_mac_51_with_ies --min-intronlen 24 \
--max-intronlen 20000 \
-1 ${PREFIX}_R1.fastq.gz -2 ${PREFIX}_R2.fastq.gz \
-S ${PREFIX}.sam

ln -s ${PREFIX}.sam ${PREFIX}.not_size_selected.sam
samtools view -f2 -bT ptetraurelia_mac_51_with_ies.fa ${PREFIX}.not_size_selected.sam > ${PREFIX}.not_size_selected.bam
samtools sort -o $PREFIX.not_size_selected.sorted.bam $PREFIX.not_size_selected.bam
samtools index $PREFIX.not_size_selected.sorted.bam

bedtools intersect -abam $PREFIX.not_size_selected.sorted.bam -b internal_eliminated_sequence_MAC_with_IES.bed -f 0.06 -split > $PREFIX.not_size_selected.IES.bam
htseq-count -s no --idattr ID -t internal_eliminated_sequence $PREFIX.not_size_selected.IES.bam internal_eliminated_sequence_MAC_with_IES.gff3 | grep -v "__" > $PREFIX.IES.htseq-count.txt

#rm ${PREFIX}.size_selected.sam
#rm ${PREFIX}.sam

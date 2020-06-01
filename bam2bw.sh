# irene stevens
# 06/01/2020

#bam2bw.sh 
#converts bam -> bigwig (scores=Reads per Million) using bedtools (genomeCoverageBed) and ucsc-utilities (bedGraphToBigWig).
#note: check if expected fragment size =150 !

module load bioinfo-tools
module load  BEDTools
module load ucsc-utilities


#scale=ècho “scale=5;1000000/$(samtools view TTseq_enrichment_S6_bowtie.markdup.bam | wc –l)” | bc`


bedtools genomecov -ibam TTseq_enrichment_S6_bowtie.markdup.bam -bg -scale RPM -fs 150 | sort -k 1,1 -k 2,2n > TTseq_enrichment_S6_bowtie.markdup.bedgraph
bedGraphToBigWig TTseq_enrichment_S6_bowtie.markdup.bedgraph hg38_chrom_sized.txt TTseq_enrichment_S6_bowtie.markdup.bw

bedtools genomecov -ibam TTseq_no_enrichment_S5_bowtie.markdup.bam -bg -scale RPM -fs 150 | sort -k 1,1 -k 2,2n > TTseq_no_enrichment_S5_bowtie.markdup.bedgraph
bedGraphToBigWig TTseq_no_enrichment_S5_bowtie.markdup.bedgraph hg38_chrom_sized.txt TTseq_no_enrichment_S5_bowtie.markdup.bw

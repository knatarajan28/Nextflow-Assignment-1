#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process trim {
  input:
    file reads
  output:
    file "trimmed.fq.gz" 
  script:
  """
  fastp -i ${reads} -o trimmed.fq.gz  
  """
}

process spades {
  input:
    file reads
  output:
    path "spades_output" 
  script:
  """
 spades.py --careful -s trimmed.fq.gz -o ./spades_output --phred-offset 33
  """
}

//Channel
     //reads_ch = Channel.fromPath("SRR11192680.fastq")
// reads_ch = Channel.fromPath("SRR11192680.fastq")
 // .fromPath("/home/knatarajan37/SRR11192680.fastq") 
//  .set { re

workflow {
reads_ch = file("SRR11192680.fastq")
//reads_ch = Channel.fromPath("SRR11192680.fastq")
println reads_ch
  main: 
    trimmed_reads = trim(reads_ch)
    spades(trimmed_reads)
}
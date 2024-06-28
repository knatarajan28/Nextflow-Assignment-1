# Nextflow-Assignment-1
Explanation of code:

•	nextflow.enable.dsl=2: This sets the DSL version to 2. DSL2 is the latest version of Nextflow's scripting language.

•	process trim { ... }: Defines a process named trim. It takes a single input file named reads and produces an output file named "trimmed.fq.gz." The process runs the fastp tool to perform trimming.

•	process spades { ... }: Defines a process named spades. It takes a single input file named reads and produces an output directory named "spades_output." The process runs the spades.py tool for genome assembly.

•	workflow { ... }: Defines the main workflow. It starts by creating a channel (reads_ch) from the input file "SRR11192680.fastq." The workflow then prints the content of reads_ch to the console.

•	main: ...: This is the entry point of the workflow. It initiates the trim process with reads_ch as input, producing trimmed_reads. The spades process is then initiated with trimmed_reads as input.

1.	The script starts with specifying the interpreter and enabling DSL2.
2.	Two processes (trim and spades) are defined to perform trimming and genome assembly, respectively.
3.	The workflow begins by creating a channel from the input file.
4.	The main workflow sequentially executes the trim process with input from the channel and then the spades process with the trimmed output.
5.	This script essentially trims the input FASTQ file using fastp and then performs genome assembly using spades.py. The input file is "SRR11192680.fastq," and the results are printed to the console. The trimmed output file is "trimmed.fq.gz," and the assembly output is in the "spades_output" directory.

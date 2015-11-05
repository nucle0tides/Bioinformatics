import sys 

fasta_file = open(sys.argv[1])
quality_file = open(sys.argv[2])

for line in fasta_file: 
    if line.startswith('>'): 
        print line.split("\n")
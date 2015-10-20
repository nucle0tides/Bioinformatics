import sys 
import re 
fasta_file = open(sys.argv[1])
to_parse = sys.argv[2]

gene_name = "" 
left_count = 0 
right_count = 0 
left_primer = "" 
right_primer = "" 

#really redundant code oops, sorry
if to_parse == 'left':
    for line in fasta_file:  
        if line.startswith('SEQUENCE_ID='): 
            gene_name = line.strip('SEQUENCE_ID=').strip('\n')
        if re.match('^PRIMER_LEFT_(\d+)_SEQUENCE=', line): 
            left_primer = re.sub('^PRIMER_LEFT_(\d+)_SEQUENCE=',"",line)
            num = re.sub('^PRIMER_LEFT_',"",line)[0:1]
            print(">"+gene_name+"_L"+str(num)+"\n"+left_primer).rstrip() 
elif to_parse == 'right': 
    for line in fasta_file:  
        if line.startswith('SEQUENCE_ID='): 
            gene_name = line.strip('SEQUENCE_ID=').strip('\n')
        if re.match('^PRIMER_RIGHT_(\d+)_SEQUENCE=', line): 
            right_primer = re.sub('^PRIMER_RIGHT_(\d+)_SEQUENCE=',"",line)
            num = re.sub('^PRIMER_RIGHT_',"",line)[0:1]
            print(">"+gene_name+"_R"+str(num)+"\n"+right_primer).rstrip() 
else: 
    for line in fasta_file: 
        if line.startswith('SEQUENCE_ID='): 
            gene_name = line.strip('SEQUENCE_ID=').strip('\n')
        if re.match('^PRIMER_LEFT_(\d+)_SEQUENCE=', line): 
            left_primer = re.sub('^PRIMER_LEFT_(\d+)_SEQUENCE=',"",line)
            num = re.sub('^PRIMER_LEFT_',"",line)[0:1]
            print(">"+gene_name+"_L"+str(num)+"\n"+left_primer).rstrip()
        if re.match('^PRIMER_RIGHT_(\d+)_SEQUENCE=', line): 
            right_primer = re.sub('^PRIMER_RIGHT_(\d+)_SEQUENCE=',"",line)
            num = re.sub('^PRIMER_RIGHT_',"",line)[0:1]
            print(">"+gene_name+"_R"+str(num)+"\n"+right_primer).rstrip()        
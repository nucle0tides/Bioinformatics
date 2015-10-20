import sys 

fasta_file = open(sys.argv[1])

name = "" 
sequence = "" 
left = 0 
right = 0 
parts = []
fields = [] 
length = 0

print("""
P3_FILE_FLAG=0
PRIMER_TASK=pick_pcr_primers
PRIMER_NUM_RETURN=10
PRIMER_PRODUCT_SIZE_RANGE=75-150
PRIMER_OPT_SIZE=20
PRIMER_MIN_SIZE=18
PRIMER_MAX_SIZE=25
PRIMER_MIN_TM=58.0
PRIMER_OPT_TM=60.0
PRIMER_MAX_TM=63.0
PRIMER_PAIR_MAX_DIFF_TM=3.0
PRIMER_TM_FORMULA=1
PRIMER_SALT_CORRECTIONS=1
PRIMER_THERMODYNAMIC_ALIGNMENT=1
PRIMER_THERMODYNAMIC_PARAMETERS_PATH=/data/cs444/bin/primer3_config/
PRIMER_MAX_SELF_ANY_TH=47.0
PRIMER_MAX_SELF_END_TH=47.0
PRIMER_MAX_HAIRPIN_TH=47.0
PRIMER_PAIR_MAX_COMPL_ANY_TH=47.0
PRIMER_PAIR_MAX_COMPL_END_TH=47.0
PRIMER_PAIR_MAX_HAIRPIN_TH=47.0
PRIMER_MAX_NS_ACCEPTED=0
PRIMER_MIN_THREE_PRIME_DISTANCE=3
PRIMER_EXPLAIN_FLAG=1
PRIMER_FIRST_BASE_INDEX=0""")

def output_to_primer3(): 
    name = parts[1]
    fields = parts[4].strip('coding').strip().split(" ")
    if len(fields) > 1: 
        left = str(fields[0])
        right = str(fields[1])
        length = str(int(right) - int(left) + 1)
    else: 
        left = "0"
        length = str(len(sequence) + 1)
    print("SEQUANCE_ID="+name)
    print("SEQUENCE_TEMPLATE="+sequence) 
    print("SEQUENCE_PRIMER_PAIR_OK_REGION="+left+","+length+","+left+","+length) 
    
for line in fasta_file:
    #strip whitespace
    line.strip()
    #if it's a header line
    if line.startswith('>'): 
        if(len(sequence) != 0): 
            output_to_primer3() 
        parts = line.split("|")  
        #print(parts)
    else: 
        sequence += line.strip() 

if(len(sequence) != 0): 
    output_to_primer3() 
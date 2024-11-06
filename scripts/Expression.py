import sys
import pandas as pd
import os

filtered_file = sys.argv[1]
output_file = sys.argv[2]

samples = pd.read_csv(filtered_file, sep='\t', header=None, names=['File_ID', 'File_path', 'Data_category', 'Data_type', 'Project_ID', 'Case_ID', 'Sample_ID', 'Sample_Type'])

Gene_data=[]

for index, row in samples.iterrows():
    File_ID = row['File_ID']
    File_path = row['File_path']
    Sample_Type = row['Sample_Type']
    
    base_path = os.path.expanduser("~/projecto/tcga_analysis/data/")
    file_path = os.path.join(base_path, File_ID, File_path)
    if os.path.exists(file_path):
        with open(file_path, 'r')as f:
            for line in f:
                columns = line.strip().split('\t')
                if len(columns) > 6 and columns[1] == "NKX2-1":
                    tpm_unstranded= float(columns[6])
                    Gene_data.append({
                        'Sample_type':Sample_Type,
                        'Expression(TPM+1)':tpm_unstranded + 1
                    })
                    break

Gene_df = pd.DataFrame(Gene_data) 
Gene_df.to_csv(output_file, index=False)


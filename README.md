# tcga_rnaseq_analysis
1] In project directory(main directory) another directory "data" created to store input data. I required two files downloaded from website https://figshare.com/s/fd7276e3583b457bd61d. One is Gene expression data (tcga_data.tar.gz) and another one is Sample sheet file (gdc_sample_sheet.tsv) contain tissue biopsy information. These two files stored in data directory. Gave command: tar -zxvf tcga_data.tar.gz to
unzip and get the real data file.

2] Again two files created sample.tsv and run_metadat.tsv in data directory. sample.tsv contain information of sample and their runs and in run_metadata.tsv contain runs and their respective path.
Here I used gdc_sample_sheet.tsv as a run file of sample.

3] Scripts directory created in main directory, contain scripts for to obtain TPM Values and for BOX-plot.

4] Snakemake(tcga.smk) file created in main directory, required scripts and rules are incorporated. 
First rule scripted to obtain data related to related to cancer type. You can just change the cancer type in shell as per requirement.
Second rule scripted to obtain TPM value for a gene(NKX2-1) from files related to that required cancer type. Here I obtained for gene- NKX2-1 . You can change the gene in Expression.py file(in scripts) at line number 23(columns[1] == "required gene name") as per requirement.
Third rule is to obtain Box plot.
Snakemake environment activated, run command " snakemake --snakefile tcga.smk generated_demo/NKX2-1_boxplot_demo.png -j1". Here demo is sample name you can change it as per requirement.

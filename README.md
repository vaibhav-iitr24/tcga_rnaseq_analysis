# tcga_rnaseq_analysis
1] In project directory(main directory) another directory "data" created to store input data. I required two files downloaded from website https://figshare.com/s/fd7276e3583b457bd61d. One is Gene expression data (tcga_data.tar.gz) and another one is Sample sheet file (gdc_sample_sheet.tsv) contain tissue biopsy information. These two files stored in data directory. Gave command: tar -zxvf tcga_data.tar.gz to
unzip and get the real data file.

2] Again two files created sample.tsv and run_metadat.tsv in data directory. sample.tsv contain information of sample and their runs and in run_metadata.tsv contain runs and their respective path.
Here I used gdc_sample_sheet.tsv as a run file of sample.


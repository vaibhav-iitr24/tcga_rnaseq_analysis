import sys
import pandas as pd

run_df = pd.read_csv("data/run_metadata.tsv", sep="\t", header="infer")
sample_df = pd.read_csv("data/sample.tsv", sep="\t", header="infer")

run_df.index = run_df["run"]
sample_df.index = sample_df["sample"]

def get_all_runs_for_sample(wildcards):
    all_runs = sample_df.loc[wildcards.sample,"runs"].split(",")
    sample_path_list = []
    for r in all_runs:
        p = run_df.loc[r,"file_path"]
        sample_path_list.append(p)
    return sample_path_list

rule filter_required:
    input:
        all_runs = lambda wildcards: get_all_runs_for_sample(wildcards)
    output:
        filtered_file = "generated_{sample}/filterd_{sample}.tsv"
    shell:
        """
        grep -E 'Primary Tumor|Solid Tissue Normal' {input} > {output}
        """

rule extraction_of_values:
    input:
        filtered_file = "generated_{sample}/filterd_{sample}.tsv"
    output:
        extracted_file = "generated_{sample}/extracted_{sample}.tsv"
    shell:
        "python scripts/Expression.py \"{input.filtered_file}\" {output.extracted_file}"

rule plot_graph:
    input:
        extracted_file = "generated_{sample}/extracted_{sample}.tsv"
    output:
        graph_file = "generated_{sample}/NKX2-1_boxplot_{sample}.png"
    shell:
         "Rscript scripts/bplot.R \"{input.extracted_file}\" {output.graph_file}"
   


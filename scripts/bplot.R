library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)
extracted_file <- args[1]
output_file <- args[2]

Gene_df <- read.csv(extracted_file)



ggplot(Gene_df, aes(x = Sample_type, y = log(Expression.TPM.1. + 1, base = 2))) +
  geom_boxplot(fill = "skyblue", color = "black") +  
  labs(title = "Boxplot of NKX2-1 Expression (Log2(TPM + 1))",
       x = "Sample Type",
       y = "Log2(Expression (TPM + 1))") +
  theme_minimal(base_size = 15) +  
  theme(panel.background = element_rect(fill = "white"),  
        plot.background = element_rect(fill = "white"),
        panel.grid.major = element_line(color = "gray"),  
        panel.grid.minor = element_blank())

	
ggsave(output_file)


# ============================================
# 01_download_data.R
# Download GSE3053 - Rice Salt Stress Dataset
# ============================================

# Install packages if needed (run once)
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("GEOquery", "Biobase"), update = FALSE)

# Load libraries
library(GEOquery)
library(Biobase)

# Download the dataset
gse <- getGEO("GSE3053", GSEMatrix = TRUE, getGPL = FALSE)

# Extract the ExpressionSet
eset <- gse[[1]]

# Check dimensions and phenotype
print(dim(eset))
print(pData(eset)[, c("title", "source_name_ch1", "characteristics_ch1")])

# Create data folder if not exists
if (!dir.exists("data")) dir.create("data")

# Save the ExpressionSet
saveRDS(eset, file = "data/GSE3053_eset.rds")

# Save phenotype data as CSV
write.csv(pData(eset), file = "data/GSE3053_phenotype.csv", row.names = TRUE)

cat("Download and save completed successfully!\n")
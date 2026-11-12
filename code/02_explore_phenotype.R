
library(Biobase)

# 1. Data load 
eset <- readRDS("data/GSE3053_eset.rds")

# 2. pdata 
pdata <- pData(eset)

# 3. 
View(pdata)

# 4.  columns
pdata[, c("title", "source_name_ch1", "characteristics_ch1")]

# Create proper groups from title


# Genotype extract
pdata$Genotype <- ifelse(grepl("FL478", pdata$title), "FL478", "IR29")

# Condition extract 
pdata$Condition <- ifelse(grepl("control", pdata$title), "Control", "Salt")

# Group for analysis
pdata$Group <- paste(pdata$Genotype, pdata$Condition, sep = "_")

# Check 
table(pdata$Genotype, pdata$Condition)
table(pdata$Group)

# Updated phenotype save 
write.csv(pdata, "data/GSE3053_phenotype_clean.csv", row.names = TRUE)

cat("Groups created successfully!\n")

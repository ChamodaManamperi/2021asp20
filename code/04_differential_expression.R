# ============================================
# 04_differential_expression.R
# Differential Expression Analysis using limma
# ============================================

# Install packages if needed
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("limma", update = FALSE)

library(Biobase)
library(limma)

# Load data
eset <- readRDS("data/GSE3053_eset.rds")
pdata <- read.csv("data/GSE3053_phenotype_clean.csv", row.names = 1)

# Make sure order matches
pdata <- pdata[colnames(exprs(eset)), ]

# Expression matrix
expr <- exprs(eset)

# Design matrix
Group <- factor(pdata$Group)
design <- model.matrix(~ 0 + Group)
colnames(design) <- levels(Group)

# Fit linear model
fit <- lmFit(expr, design)

# Contrasts
contrast.matrix <- makeContrasts(
  Salt_vs_Control_FL478 = FL478_Salt - FL478_Control,
  Salt_vs_Control_IR29  = IR29_Salt - IR29_Control,
  Tolerant_vs_Sensitive_Salt = FL478_Salt - IR29_Salt,
  levels = design
)

fit2 <- contrasts.fit(fit, contrast.matrix)
fit2 <- eBayes(fit2)

# Results - Salt vs Control in FL478 (Tolerant)
res_FL478 <- topTable(fit2, coef = "Salt_vs_Control_FL478", number = Inf)
res_FL478$Probe <- rownames(res_FL478)

# Results - Salt vs Control in IR29 (Sensitive)
res_IR29 <- topTable(fit2, coef = "Salt_vs_Control_IR29", number = Inf)
res_IR29$Probe <- rownames(res_IR29)

# Save results
if (!dir.exists("output")) dir.create("output")
write.csv(res_FL478, "output/DE_FL478_Salt_vs_Control.csv", row.names = FALSE)
write.csv(res_IR29, "output/DE_IR29_Salt_vs_Control.csv", row.names = FALSE)

# Significant genes (adj.P.Val < 0.05 & |logFC| > 1)
sig_FL478 <- subset(res_FL478, adj.P.Val < 0.05 & abs(logFC) > 1)
sig_IR29  <- subset(res_IR29,  adj.P.Val < 0.05 & abs(logFC) > 1)

cat("Significant DEGs in FL478 (Tolerant):", nrow(sig_FL478), "\n")
cat("Significant DEGs in IR29 (Sensitive):", nrow(sig_IR29), "\n")

# Save significant genes
write.csv(sig_FL478, "output/Significant_DEGs_FL478.csv", row.names = FALSE)
write.csv(sig_IR29, "output/Significant_DEGs_IR29.csv", row.names = FALSE)

cat("Differential expression completed!\n")
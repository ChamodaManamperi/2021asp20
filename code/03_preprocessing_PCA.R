# ============================================
# 03_preprocessing_PCA.R
# Preprocessing and PCA for GSE3053
# ============================================

library(Biobase)
library(ggplot2)

# Load data
eset <- readRDS("data/GSE3053_eset.rds")
pdata <- read.csv("data/GSE3053_phenotype_clean.csv", row.names = 1)

# Expression matrix
expr <- exprs(eset)

# Check
dim(expr)
summary(as.vector(expr))

# ============================================
# Simple filtering (remove very low expression probes)
# ============================================
# Keep probes with variance above median
probe_var <- apply(expr, 1, var)
expr_filtered <- expr[probe_var > median(probe_var), ]
dim(expr_filtered)

# ============================================
# PCA
# ============================================
pca <- prcomp(t(expr_filtered), scale. = TRUE)

# PCA data frame
pca_df <- data.frame(
  PC1 = pca$x[, 1],
  PC2 = pca$x[, 2],
  Genotype = pdata$Genotype,
  Condition = pdata$Condition,
  Group = pdata$Group
)

# PCA Plot
pca_plot <- ggplot(pca_df, aes(x = PC1, y = PC2, color = Condition, shape = Genotype)) +
  geom_point(size = 3) +
  theme_bw() +
  labs(title = "PCA of Rice Salt Stress Samples (GSE3053)",
       x = paste0("PC1 (", round(summary(pca)$importance[2,1]*100, 1), "%)"),
       y = paste0("PC2 (", round(summary(pca)$importance[2,2]*100, 1), "%)"))

print(pca_plot)

# Save figure
if (!dir.exists("figures")) dir.create("figures")
ggsave("figures/PCA_salt_stress.png", pca_plot, width = 8, height = 6, dpi = 300)

cat("PCA completed and saved!\n")
# 2021asp20
Transcriptional Response of Rice (Oryza sativa) to Salt Stress: Identification of Differentially Expressed Genes

## Abstract
This project investigates the transcriptional changes in rice (Oryza sativa) under salt stress conditions. Using publicly available gene expression data (GSE3053), we identify differentially expressed genes between salt-tolerant (FL478) and salt-sensitive (IR29) genotypes under control and salinity stress. The analysis aims to provide insights into the molecular basis of salt tolerance in rice.

## Project Structure
- `code/` : R scripts for analysis
- `data/` : Raw and processed data
- `figures/` : Generated plots
- `output/` : Results tables and reports

# Transcriptional Response of Rice (Oryza sativa) to Salt Stress: Identification of Differentially Expressed Genes

## 1. Abstract

Salt stress is a major abiotic constraint that significantly reduces rice productivity worldwide. Understanding the molecular mechanisms underlying salt tolerance is essential for developing resilient rice varieties. In this study, we analysed the publicly available microarray dataset GSE3053 to identify differentially expressed genes (DEGs) in response to salt stress. We compared the salt-tolerant genotype FL478 with the salt-sensitive genotype IR29 under control and salinity conditions. Using the limma package in R, we performed differential expression analysis and visualised the results through PCA, heatmaps, and volcano plots. Several genes showed significant expression changes under salt stress, providing insights into the transcriptional responses associated with salt tolerance in rice. This analysis contributes to the broader understanding of abiotic stress responses in crops and supports future efforts in breeding salt-tolerant rice varieties.

## 2. Introduction

Rice (Oryza sativa) is one of the most important staple crops globally, feeding more than half of the world’s population. However, soil salinity is an increasing problem due to climate change, improper irrigation, and coastal flooding. High salt concentrations disrupt ion homeostasis, reduce water uptake, and ultimately decrease grain yield.

Different rice genotypes show varying levels of tolerance to salt stress. FL478 is a well-known salt-tolerant recombinant inbred line, while IR29 is salt-sensitive. Comparing their transcriptional responses can help identify key genes involved in salt tolerance mechanisms such as ion transport, osmoprotection, and stress signalling.

**Aim of this study:**  
To identify differentially expressed genes in rice under salt stress using the GSE3053 dataset and to compare the transcriptional responses of salt-tolerant (FL478) and salt-sensitive (IR29) genotypes.

**Hypothesis:**  
Salt stress induces significant changes in gene expression, and the tolerant genotype (FL478) exhibits a distinct transcriptional profile compared to the sensitive genotype (IR29).

## 3. Data

- **Source:** Gene Expression Omnibus (GEO) – Accession GSE3053  
- **Platform:** Affymetrix Rice Genome Array  
- **Samples:** 11 samples in total  
  - FL478 (Tolerant): 3 Control + 3 Salt-stressed  
  - IR29 (Sensitive): 2 Control + 3 Salt-stressed  
- **Tissue:** Crown and growing point (vegetative stage)  
- **Licensing:** Publicly available dataset from NCBI GEO

## 4. Methods

The analysis was performed entirely in R. The following steps were carried out:

1. Data download using the `GEOquery` package.
2. Phenotype cleaning and creation of Genotype and Condition groups.
3. Exploratory data analysis: Principal Component Analysis (PCA) and heatmap of the top 50 most variable genes.
4. Differential expression analysis using the `limma` package.
5. Contrasts tested:
   - Salt vs Control in FL478
   - Salt vs Control in IR29
6. Visualisation using volcano plots.
7. Significant genes were defined as those with adjusted p-value < 0.05 and |log2 fold change| > 1.

**Main R packages used:**  
`GEOquery`, `Biobase`, `limma`, `ggplot2`, `pheatmap`

## 5. Results

### Principal Component Analysis
PCA showed clear separation between Control and Salt-stressed samples, indicating that salt stress has a strong effect on the overall transcriptome.

### Differential Expression
- Number of significant DEGs in FL478 (Salt vs Control): 0
- Number of significant DEGs in IR29 (Salt vs Control): 2

Volcano plots and the heatmap of highly variable genes further supported the presence of distinct transcriptional responses under salt stress.

*(Figures: PCA_salt_stress.png, Heatmap_top50_genes.png, Volcano_FL478.png, Volcano_IR29.png)*

## 6. Discussion

The results demonstrate that salt stress triggers substantial transcriptional reprogramming in both genotypes. The differences observed between FL478 and IR29 may reflect the underlying genetic basis of salt tolerance. Limitations of this study include the relatively small sample size and the use of microarray technology rather than RNA-seq. Nevertheless, the identified DEGs provide a useful starting point for further functional validation and candidate gene selection for breeding programs.

## 7. Conclusion

This project successfully identified differentially expressed genes in rice under salt stress using publicly available data. The analysis highlights the value of transcriptomic approaches in understanding abiotic stress responses and contributes to the knowledge required for developing salt-tolerant rice varieties.

## 8. Reproducibility

All analyses can be reproduced by running the R scripts in the `code/` folder in the following order:

1. `01_download_data.R`
2. `02_explore_phenotype.R`
3. `03_preprocessing_PCA.R`
4. `04_differential_expression.R`
5. `05_volcano_plot.R`

**Required packages:**  
`GEOquery`, `Biobase`, `limma`, `ggplot2`, `pheatmap`

## 9. References

- GEO Dataset: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE3053
- Walia et al. (related publication of the dataset)
- R Core Team (2024). R: A language and environment for statistical computing.
- Smyth, G. K. (2005). limma: Linear Models for Microarray Data.

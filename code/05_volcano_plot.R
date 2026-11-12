library(ggplot2)

res_FL478 <- read.csv("output/DE_FL478_Salt_vs_Control.csv")
res_IR29  <- read.csv("output/DE_IR29_Salt_vs_Control.csv")

# FL478 Volcano
res_FL478$Significant <- ifelse(res_FL478$adj.P.Val < 0.05 & abs(res_FL478$logFC) > 1, "Yes", "No")

volcano_FL478 <- ggplot(res_FL478, aes(x = logFC, y = -log10(adj.P.Val), color = Significant)) +
  geom_point(alpha = 0.6, size = 1.5) +
  scale_color_manual(values = c("No" = "grey", "Yes" = "red")) +
  theme_bw() +
  labs(title = "Volcano Plot - FL478 (Salt vs Control)",
       x = "log2 Fold Change", y = "-log10(adj.P.Val)") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed")

ggsave("figures/Volcano_FL478.png", volcano_FL478, width = 8, height = 6, dpi = 300)

# IR29 Volcano
res_IR29$Significant <- ifelse(res_IR29$adj.P.Val < 0.05 & abs(res_IR29$logFC) > 1, "Yes", "No")

volcano_IR29 <- ggplot(res_IR29, aes(x = logFC, y = -log10(adj.P.Val), color = Significant)) +
  geom_point(alpha = 0.6, size = 1.5) +
  scale_color_manual(values = c("No" = "grey", "Yes" = "red")) +
  theme_bw() +
  labs(title = "Volcano Plot - IR29 (Salt vs Control)",
       x = "log2 Fold Change", y = "-log10(adj.P.Val)") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed")

ggsave("figures/Volcano_IR29.png", volcano_IR29, width = 8, height = 6, dpi = 300)

cat("Volcano plots saved!\n")
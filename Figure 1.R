



# Load the "scales" package
require(scales)

# Create vector with levels of object@ident
identities <- levels(LSneuron@active.ident)

# Create vector of default ggplot2 colors
my_color_palette <- hue_pal()(length(identities))

# Plot the tSNE plot with the default ggplot2 colors
TSNEPlot(LSneuron) + 
  scale_color_manual(values = my_color_palette)


my_color_palette[1] <- '#e8e6e6'
my_color_palette[2] <- '#e8e6e6'
my_color_palette[3] <- '#e8e6e6'
my_color_palette[4] <- '#e8e6e6'
my_color_palette[5] <- '#e8e6e6'
my_color_palette[15] <- '#e8e6e6'
my_color_palette[16] <- '#e8e6e6'
my_color_palette[17] <- '#e8e6e6'

p <- TSNEPlot(LSneuron) + 
  scale_color_manual(values = my_color_palette) + NoLegend()
p
pdf("allLSneurons_tsne.pdf", width=2.7, height=2.55)
plot(p)
dev.off()



p3 <- DotPlot(object = LSneuron,features = c('Slc32a1','Sst','Calb1',
                                             'Pax6','Necab1','Crhr2','Dach2','Ddr2','Stac2','Pde1c',"Slit2","Rnf207","Htr2c","Dlk1","Prlr",
                                             "Rmst","Zim1","Matn2","Slc18a2","Nts","Glp1r"
),dot.scale = 5,idents = c('6','7','8','9','10','11','12','13','14')) + 
  RotatedAxis() +SeuratAxes() 
pdf("allLSneuron_Dotplot.pdf", width=6, height=3)
p3
dev.off()

#---------------------------------------- Difference analysis of Sst and Calb1 clusters2------------------------------------------------
library(ggplot2)
library(ggrepel)
library(ggthemes)
library(ggpubr)
library(clusterProfiler)
library(topGO)
library(Rgraphviz)
library(pathview)
library(org.Hs.eg.db)
library(RColorBrewer)
library("viridis")  

Sst_Calb1 <- subset(LSneuron, idents = c('14',"9",'11','7'))
Sst_Calb1 <-RenameIdents(object = Sst_Calb1,  '14' = 'Sst','9' = 'Calb1','11' = 'Calb1','7' = 'Calb1')

Sst_Calb1.markers <- FindMarkers(Sst_Calb1,ident.1 = "Sst", ident.2 = "Calb1",test.use = 'MAST',logfc.threshold = 0)
Sst_Calb1.markers$Gene <- rownames(Sst_Calb1.markers)
head(Sst_Calb1.markers)
Sst_Calb1.markers_store <- Sst_Calb1.markers
write.csv(Sst_Calb1.markers,'Sst_Calb1_DEs.csv')

Sst_Calb1.markers <- Sst_Calb1.markers_store
Sst_Calb1.markers$logP <- -log10(Sst_Calb1.markers$p_val_adj)
Sst_Calb1.markers$gene <- row.names(Sst_Calb1.markers)
Sst_Calb1.markers$Group <- 'not-significant'
Sst_Calb1.markers$Group[which(Sst_Calb1.markers$p_val_adj < 0.005) & (Sst_Calb1.markers$avg_log2FC > 1)] = "Sst_enriched"
Sst_Calb1.markers$Group[which(Sst_Calb1.markers$p_val_adj < 0.005) & (Sst_Calb1.markers$avg_log2FC < -1)] = "Calb1_enriched"
Sst_Calb1.markers$label <- ''
Sst_Calb1.markers <- Sst_Calb1.markers[order(Sst_Calb1.markers$p_val_adj) ,]
Sst.enriched <- head(Sst_Calb1.markers$gene[which(Sst_Calb1.markers$Group == 'Sst_enriched')],50)
Calb1.enriched <- head(Sst_Calb1.markers$gene[which(Sst_Calb1.markers$Group == 'Calb1_enriched')],50)
Sst_Calb1.markers.top10 <- c(as.character(Sst.enriched),as.character(Calb1.enriched))
Sst_Calb1.markers$label[match(Sst_Calb1.markers.top10,Sst_Calb1.markers$gene)] <- Sst_Calb1.markers.top10
head(Sst_Calb1.markers)

p3 <- ggscatter(Sst_Calb1.markers,x ='avg_log2FC',y='logP',color = 'Group', palette = c('#2f5688','#BBBbBB','#cc0000'),
                label = Sst_Calb1.markers$label,
                repel = T, 
                font.label = 8) + 
  theme_base() +
  scale_x_continuous(limits = c(-2.5, 2.5)) +  scale_y_continuous(limits = c(0, 220)) +
  geom_hline(yintercept =  20,linetype = 'dashed') +
  geom_vline(xintercept =  c(-1,1),linetype = 'dashed')

pdf("Volcanicplot.pdf", width=7, height=5)
p3
dev.off()



























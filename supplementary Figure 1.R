library(Seurat)
library("viridis")  
library(dplyr)
library(reticulate)
library(umap)
library(wesanderson)
library(RColorBrewer)
library(ggplot2)
library(ggdendro)
library(RColorBrewer)

write.csv(LS@meta.data,'LS_metada.csv')

p3 <- DotPlot(object = LS,features = c("Snap25","Slc32a1","Tac1","Foxp2","Scg2","Cpne7","Nrg3","Cdh18","Stac2","Trpc3",
                                              "Calb2","Slc17a6","Pdgfra","Olig1","Gpr17","Sox11","Mki67","Slc1a3","Gja1",
                                              "Mal","Mag","C1qa","Cx3cr1","Foxj1","Tmem212",'Cldn5','Flt1'),dot.scale = 5) + 
  RotatedAxis() +SeuratAxes() 
pdf("Dotplot.pdf", width=8, height=4)
p3
dev.off()
p3

p3 <- DimPlot(object=LS, reduction="tsne", pt.size=0.1, label=T, label.size = 5)  + coord_fixed(ratio = 1)
pdf("Dimplot.pdf", width=3.5, height=3.5)
p3
dev.off()

p3 <- FeaturePlot(object=LS, reduction="tsne",features = c("Slc32a1"),order = F,pt.size = 0.1)
pdf("Slc32a1.pdf", width=3, height=2.55)
p3
dev.off()

p3 <- FeaturePlot(object=LS, reduction="tsne",features = c("Slc17a6"),order = F,pt.size = 0.1)
pdf("Slc17a6.pdf", width=3, height=2.55)
p3
dev.off()

p3 <- FeaturePlot(object=LS, reduction="tsne",features = c("Pdgfra"),order = F,pt.size = 0.1)
pdf("Pdgfra.pdf", width=3, height=2.55)
p3
dev.off()

p3 <- FeaturePlot(object=LS, reduction="tsne",features = c("Olig1"),order = F,pt.size = 0.1)
pdf("Olig1.pdf", width=3, height=2.55)
p3
dev.off()

p3 <- FeaturePlot(object=LS, reduction="tsne",features = c("Mki67"),order = F,pt.size = 0.1)
pdf("Mki67.pdf", width=3, height=2.55)
p3
dev.off()






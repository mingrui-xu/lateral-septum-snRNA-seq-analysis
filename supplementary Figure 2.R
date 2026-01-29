

p <- DimPlot(object=LSneuron, reduction="tsne", pt.size=0.02, label=F, label.size = 5)  + coord_fixed(ratio = 0.8)+ NoLegend()
p
pdf("LSneurons_tsne.pdf", width=7, height=3)
plot(p)
dev.off()

p3 <- DotPlot(object = LSneuron,features = c("Neurod2","Crym",'Slc17a6',"Calb2",
                                             "Ngfr","Slc5a7","Chat","Coro6","Lhx6",'Adarb2',
                                             "Nrn1","Bmp7","Tac1","Syt6","Tshz1",
                                             "Col6a1","Pdyn","Rarb"
),dot.scale = 5,idents =c('1','2','3','4','5','15','16','17')) + 
  RotatedAxis() +SeuratAxes() + NoLegend()
pdf("nonLSneuron_Dotplot.pdf", width=6, height=2.7)
p3
dev.off()


# Load the "scales" package
require(scales)

# Create vector with levels of object@ident
identities <- levels(LSneuron@active.ident)

# Create vector of default ggplot2 colors
my_color_palette <- hue_pal()(length(identities))

# Plot the tSNE plot with the default ggplot2 colors
TSNEPlot(LSneuron) + 
  scale_color_manual(values = my_color_palette)


my_color_palette[6] <- '#e8e6e6'
my_color_palette[7] <- '#e8e6e6'
my_color_palette[8] <- '#e8e6e6'
my_color_palette[9] <- '#e8e6e6'
my_color_palette[10] <- '#e8e6e6'
my_color_palette[11] <- '#e8e6e6'
my_color_palette[12] <- '#e8e6e6'
my_color_palette[13] <- '#e8e6e6'
my_color_palette[14] <- '#e8e6e6'


TSNEPlot(LSneuron) + 
  scale_color_manual(values = my_color_palette)

p <- TSNEPlot(LSneuron) + 
  scale_color_manual(values = my_color_palette) + NoLegend()

p
pdf("nonLSneurons_tsne.pdf", width=2.7, height=2.55)
plot(p)
dev.off()


p3 <- FeaturePlot(object=LSneuron, reduction="tsne",features = c("Col6a1"),order = F,pt.size = 0.1) +NoLegend()+theme(plot.title = element_text(angle = 0))+ 
  theme(axis.title=element_blank(),axis.text.x = element_blank())
pdf("LSneuron_Col6a1.pdf", width=2.1, height=2.1)
p3
dev.off()














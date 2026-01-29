p3 <- DotPlot(object = LSneuron,features = c('Sst','Calb1','Nts','Glp1r','Tac1','Mchr1','Prlr','Grm5',
                                             'Drd1','Drd2','Drd3','Drd4','Drd5',
                                             'Htr1a','Htr1b','Htr1d','Htr1e','Htr1f','Htr2a','Htr2b','Htr2c',
                                             'Htr3','Htr24','Htr5a','Htr5b','Htr6','Htr7',
                                             'Hcn1','Hcn2','Hcn3','Hcn4',
                                             'Cacan1g','Cacan1h','Cacan1i',
                                             'Gja1','Gja4','Gjb2','Gjb6','Gjc2','Gjd2'),
              dot.scale = 5,idents = c('6','7','8','9','10','11','12','13','14')) + 
  RotatedAxis() +SeuratAxes() 
pdf("allLSneuron_Dotplot_intereatinggene_0512.pdf", width=7.5, height=3)
p3
dev.off()
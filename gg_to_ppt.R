# Libraries
library(ggplot2)
library(officer)
library(rvg)

# create plot
myPlot1 <- ggplot(mtcars, aes(factor(cyl), mpg)) +
        geom_violin(aes(fill = factor(cyl)))
        
myPlot_2 <- ggplot(mtcars, aes(factor(cyl), mpg), fill = factor(cyl)) +
        geom_boxplot()

# export editable figures to a ppt file
read_pptx() %>% 
        add_slide(layout = "Title and Content", master = "Office Theme") %>% 
        ph_with_vg(code = print(myPlot_1), type = "body") %>% 
        add_slide(layout = "Title and Content", master = "Office Theme") %>% 
        ph_with_vg(code = print(myPlot_2), type = "body") %>% 
        print(target = "../ggplot_figures.pptx")

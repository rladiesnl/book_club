########################################################################
## Title: Example for R-ladies NL Bookclub, Chapter 22: Debugging     ##
## Author: Alejandra Hernandez Segura                                 ##
## Date: 08/December/2020                                             ##
########################################################################


#### Requirements ####
library(dplyr)
library(ggplot2)
library(purrr)


#### Load data ####
jobs_gender <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-05/jobs_gender.csv")

#### Function to plot one category at a time ####
plot_one_category <- function(category = character() ){
  
  stopifnot(is.character(category))
  
  # Subset dataset
  category_ds <- jobs_gender %>% 
    filter(major_category = category)
  
  # Calculate mean category
  mean_category <- category_ds %>%
    `[`("wage_percent_of_male") %>% 
    `/`(100) %>%
    mean()
  
  # Plot
  category_plot <- ggplot(category_ds, aes(x = minor_category, y = wage_percent_of_male/100, color = minor_category)) + 
    geom_boxplot(alpha = 0.3, show.legend = FALSE, outlier.shape = NA) +
    geom_point(position = position_jitter(width = 0.3)) +
    geom_hline(yintercept = mean_category, linetype = 2, color = "darkgray") +
    scale_color_brewer(type = "qual", palette = "Dark2") +
    scale_y_continuous(labels = scales::percent_format()) +
    labs(title = "Wage of women in proportion to men", 
         subtitle = category, y = "")+
    theme_light() +
    theme(legend.title = element_blank(),
          legend.text = element_text(size = 9),
          axis.text = element_text(size = 9),
          axis.text.x = element_blank(),
          axis.title.x = element_blank(),
          strip.text = element_text(size = 10))
  
  return(category_plot)
  
}

plot_one_category("Computer, Engineering, and Science")

categories <- jobs_gender$major_category %>% levels()

map(categories, plot_one_category)

plot_one_category(categories[[1]])

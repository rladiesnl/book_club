ggplot(data = cars) +  
  aes(x = speed) +  
  aes(y = dist) +  
  geom_point(shape = 21,  
             alpha = .8,  
             size = 5,  
             color = "white") +  
  aes(fill = dist) +  
  scale_fill_viridis_c(option = "magma", end = .7) +  
  labs(title = "That cars data again!") +  
  theme_minimal() +  
  theme(plot.background = element_rect(fill = "snow3"))  #<<

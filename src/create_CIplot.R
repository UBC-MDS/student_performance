# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

library(tidyverse)
library(infer)

# define main function
main <- function(){
  
  # read in data
  data <- read.csv(input_file)
  
  # students in relationship
  yes <- data %>% 
    filter(romantic == "yes")
  
  mean_yes <- mean(yes$G3)
  
  yes_ci <- yes %>% 
    specify(response = G3) %>% 
    generate(reps = 1000)  %>% 
    calculate(stat = "mean")  %>% 
    get_ci() %>% 
    rename(lower = `2.5%`, upper = `97.5%`) %>% 
    mutate(mean = mean_yes,
           romantic = "yes")
  
  # students single 
  no <- data %>% 
    filter(romantic == "no")
  
  mean_no <- mean(no$G3)
  
  no_ci <- no %>% 
    specify(response = G3) %>% 
    generate(reps = 1000)  %>% 
    calculate(stat = "mean")  %>% 
    get_ci() %>% 
    rename(lower = `2.5%`, upper = `97.5%`) %>% 
    mutate(mean = mean_no,
           romantic = "no")
  
  # combine summarized data
  (summarized <- bind_rows(yes_ci, no_ci))
  
  
  plot=ggplot(data, aes(x = romantic, y = G3)) +
    #geom_jitter(alpha = 0.3, width = 0.1, size = 1) +
    geom_violin()+
    geom_jitter(alpha = 0.5) +
    stat_summary(fun.y = mean, geom = "point", shape = 18, size = 3, color = "red") +
    geom_errorbar(data = summarized, 
                  mapping = aes(x = romantic, y = mean, ymin = lower, ymax = upper), 
                  size = 0.5, color = "red", width=.2) + 
    theme_bw() 
 
  # save image
  png(output_file)
  plot(plot)
  dev.off()
  
}


# call main function
main()
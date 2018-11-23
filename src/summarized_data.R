#! /usr/bin/env Rscript
#
# summarized_data.R
#
# This script reads in cleaned data register_student.csv and produces an statistical summary table 
# with visualization.
#
# This script takes input and output filepaths as parameters.
#
# Input filepath specifies location of the cleaned dataset and output filepath specifies
# where to save the summary table(.csv file) and the visualized plot (.png file).

# Usage: 
# Rscript src/summarized_data.R data/registered_student.csv data/summary.csv img/CI_plot.png

# Import libraries
library(tidyverse)
library(infer)
library(dplyr)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file1 <- args[2]
output_file2 <- args[3]

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
  
  # combine summarized data and return a summary table
  (summarized <- bind_rows(yes_ci, no_ci))
  write.csv(summarized, file = output_file1)
  
  
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
  png(output_file2)
  plot(plot)
  dev.off()
  
}

# call main function
main()
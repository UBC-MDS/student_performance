

#! /usr/bin/env Rscript
# load_data.R
# # data downloaded from 
# https://archive.ics.uci.edu/ml/datasets/Student+Performance?fbclid=IwAR2wU2nVAwPfCUkCBoE2_4ePwEwGEOmET4V_93u8ioieo7_3XMeqgGt2vzQ
# This script takes no arguments.
#
# Usage: Rscript load_data.R


## part 1
# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

library(tidyverse)

# define main function
main <- function(){
  
  # read in data
  data <- read.csv("data/student-mat.csv", sep = ";")
  
  # filter out the students who dropped the class
  data <- data %>% 
    filter(G1 != 0, G2!=0, G3 != 0)
  
  # write cleaned csv
  write.csv(data, file = output_file)
}


# call main function
main()
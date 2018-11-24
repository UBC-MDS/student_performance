#! /usr/bin/env Rscript
# Yenan Zhang, Nov 22, 2018
# load_data.R
#
# Source from:  
# https://archive.ics.uci.edu/ml/datasets/Student+Performance?fbclid=IwAR2wU2nVAwPfCUkCBoE2_4ePwEwGEOmET4V_93u8ioieo7_3XMeqgGt2vzQ
#
# This script takes input and output filepaths as parameters.
# Input filepath specifies location of the raw data set and output filepath specifies location of the cleaned dataset.
#
# Usage: 
# Rscript src/load_data.R data/student-mat.csv data/registered_student.csv

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

library(tidyverse)

# define main function
main <- function(){
  
  # read in data "data/student-mat.csv"
  data <- read.csv(input_file, sep = ";")
  
  # filter out the students who dropped the class
  data <- data %>% 
    filter(G1 != 0, G2!=0, G3 != 0)
  
  # write cleaned csv
  write.csv(data, file = output_file)
}

# call main function
main()
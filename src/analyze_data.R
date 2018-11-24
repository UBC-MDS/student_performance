#! /usr/bin/env Rscript
# Zixin Zhang, Nov 22, 2018
# analyze_data.R
#
# This script reads in cleaned data register_student.csv and conduct a two-side t-test.
#
# This script takes input and output filepaths as parameters.
#
# Input filepath specifies location of the cleaned dataset and output filepath specifies
# where to save the t-test result summary table(.csv file).

# Usage: 
# Rscript src/analyze_data.R data/registered_student.csv results/t_test.csv

# Import libraries
library(broom)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# define main function
main <- function(){
  
  # read in data
  data <- read.csv(input_file)
  
  result <- tidy(t.test(G3 ~ romantic, data = data, var.equal = FALSE))
  
  write.csv(result, file = output_file)
  
}

# call main function
main()
#! /usr/bin/env Rscript
#
# vic_data.R
#
# This script reads in cleaned data register_student.csv and produces an exploratory visualization 
# on our interested variable.
#
# This script takes input and output filepaths as parameters.
#
# Input filepath specifies location of the cleaned dataset and output filepath specifies
# where to save .png files.
#
# Usage: 
# Rscript src/vic_data.R data/registered_student.csv results/boxplot.png

# Import libraries
library(ggplot2)

# Read in input parameters from command line
args = commandArgs(trailingOnly=TRUE)
input_file <- args[1]
output_file <- args[2]

main <- function() {
  
  # Read in data
  data <- read.csv(input_file)
  
  fill <- "gold1"
  line <- "goldenrod2"
  boxplot <- ggplot(data, aes(romantic, G3)) +
      geom_boxplot(fill = fill, colour = line, alpha = 0.5) +
      xlab("Romantic Relationship") +
      ylab("Students' Final Grade (G3)") +
      ggtitle("Boxplot of Student's Final Grade - In Relationship VS. Not In Relationship ")
      theme_bw() 
  
  # Save plot to file at specified output path
  png(output_file)
  plot(boxplot)
  dev.off()
}

# call main function
main()



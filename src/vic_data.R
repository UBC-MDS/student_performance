#! /usr/bin/env Rscript
#
# visualize_data.R
#
# This script reads in cleaned data register_student.R and produces an exploratory visualization 
# on our interested variable.
#
# This script takes input and output filepaths as parameters.
#
# Input filepath specifies location of the cleaned dataset and output filepath specifies
# where to save .png files.

# Usage: 
# bash Rscript src/load.R data/registered_student.csv img/boxplot.png



# Import libraries
suppressPackageStartupMessages(library(ggplot2))

# Read in input parameters from command line
args = commandArgs(trailingOnly=TRUE)
input <- args[1]
output <- args[2]

main <- function() {
  
  # Read in data
  data <- read.csv(input)
  
  # Visualize mean rating by bean's country of origin. 
  # Note: We removed 45 countries which only had 1 rating from the visualization (i.e., 
  # only countries with >1 rating are shown). We did this because many of these cases
  # represented beans which come from a combination of multiple countries
  # and which made the visualization difficut to interpret with so many (i.e. 100+) countries.
  
  fill <- "gold1"
  line <- "goldenrod2"
  boxplot <- ggplot(data, aes(romantic, G3)) +
      geom_boxplot(fill = fill, colour = line, alpha = 0.5) +
      xlab("Students' Final Grade") +
      ylab("Romantic Relationship") 
      theme_bw() 
  
  # Save plot to file at specified output path
  png(filename="img/boxplot.png")
  plot(boxplot)
  dev.off()
}

# call main function
main()



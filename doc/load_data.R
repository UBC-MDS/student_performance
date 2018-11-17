

#! /usr/bin/env Rscript
# load_data.R
# # data downloaded from 
# https://archive.ics.uci.edu/ml/datasets/Student+Performance?fbclid=IwAR2wU2nVAwPfCUkCBoE2_4ePwEwGEOmET4V_93u8ioieo7_3XMeqgGt2vzQ
# This script takes no arguments.
#
# Usage: Rscript load_data.R


data <- read.csv("data/student-mat.csv", sep=";")
head(data)

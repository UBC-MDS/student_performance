# Docker file for student_performance
# Zixin Zhang, Dec 6, 2018
#
# Usage:
#   To build the docker image:  docker build --tag student_performance:0.1 .
#
#		To create the report:
#   docker run --rm -v /Users/zixinzhang/Documents/522\ -\ Workflows//student_performance:/home/rstudio/student_performance student_performance:0.1 make -C '/home/rstudio/student_performance' all
#
#		To get a clean start:
#   docker run --rm -v /Users/zixinzhang/Documents/522\ -\ Workflows//student_performance:/home/rstudio/student_performance student_performance:0.1 make -C '/home/rstudio/student_performance' clean
#
# Use rocker/tidyverse as the base image
FROM rocker/tidyverse

# Install R packages
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('broom')"
RUN Rscript -e "install.packages('infer')"

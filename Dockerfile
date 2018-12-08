# Docker file for student_performance
# Zixin Zhang, Dec 6, 2018
#
# Usage:
#   To build the docker image:  docker pull zixinz/student_performance
#
#		To create the report:
#   docker run --rm -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/student_performance zixinz/student_performance make -C '/home/student_performance' all
#		To get a clean start:
#   docker run --rm -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/student_performance zixinz/student_performance make -C '/home/student_performance' clean
#
# Use rocker/tidyverse as the base image
FROM rocker/tidyverse

# Install R packages
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('broom')"
RUN Rscript -e "install.packages('infer')"

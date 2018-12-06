# run_all.sh
# Zixin Zhang, Nov 24 2018

# This script runs all the scripts in src folder and render all results from the codes then render the final report in the doc folder

# Usage:
# bash run_all.sh

Rscript src/load_data.R data/student-mat.csv data/registered_student.csv
Rscript src/vic_data.R data/registered_student.csv results/boxplot.png
Rscript src/analyze_data.R data/registered_student.csv data/t_test.csv
Rscript src/summarized_data.R data/registered_student.csv results/summary.csv results/CI_plot.png

# knit RMD report
Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = 'github_document')"
Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = 'html_document')"

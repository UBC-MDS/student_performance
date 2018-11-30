# Makefile
# Zixin Zhang, Nov 30, 2018

# This Makefile script run scripts separately
# can render tables and plots from the codes of each script in the src folder
# and render the final report (Report.Rmd) in the doc folder
# use `make clean` to clean every output

# example usage:
# make all

# render the report
all : doc/Report.md doc/Report.pdf doc/Report.html

# run load_data.R to load the original dataset and output a clean dataset
data/registered_student.csv : src/load_data.R data/student-mat.csv
	Rscript src/load_data.R data/student-mat.csv data/registered_student.csv

# run viz_data.R and output one figure
results/boxplot.png: src/viz_data.R data/registered_student.csv
	Rscript src/vic_data.R data/registered_student.csv results/boxplot.png

# run summarize_data.R and output one table and one plot
results/summary.csv results/CI_plot.png: src/summarize_data.R data/registered_student.csv
  Rscript src/summarized_data.R data/registered_student.csv results/summary.csv results/CI_plot.png

# run analyze_data.R and output t-test results
results/t_test.csv: src/analyze_data.R data/registered_student.csv
	Rscript src/analyze_data.R data/registered_student.csv results/t_test.csv

# render md type of the final report
doc/Report.md : doc/Report.Rmd src/load_data.R data/student-mat.csv data/registered_student.csv data/registered_student.csv results/boxplot.png results/summary.csv results/CI_plot.png results/t_test.csv
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'github_document')"

# render pdf type of the final report
doc/Report.pdf : doc/Report.Rmd src/load_data.R data/student-mat.csv data/registered_student.csv data/registered_student.csv results/boxplot.png results/summary.csv results/CI_plot.png results/t_test.csv
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'pdf_document')"

# render html type of the final report
doc/Report.html : doc/Report.Rmd src/load_data.R data/student-mat.csv data/registered_student.csv data/registered_student.csv results/boxplot.png results/summary.csv results/CI_plot.png results/t_test.csv
	Rscript -e "rmarkdown::render('doc/Report.Rmd', output_format = 'html_document')"

# clean all the outputs
clean :
	rm -f data/registered_student.csv
	rm -f results/boxplot.png
	rm -f results/summary.csv results/CI_plot.png
	rm -f results/t_test.csv
	rm -f doc/Report.md doc/Report.pdf doc/Report.html doc/Report.tex


# Student Performance
Data Analysis Project for Student Academic Performance

## Members Name and MDS github ID: 

[Yenan Zhang](https://github.ubc.ca/joshua04)

[Zixin Zhang](https://github.ubc.ca/zixinz)

## Project Motivation
It's common to see that many high school students now are in romantic relationships. However, some parents think that having romantic relationship will influence teenagers' academic performances. In this project, we are interested in conducting research on an exploratory question - **Does romantic relationship influence student's academic performance**?. 

## Explore Dataset
- **Source:** [Student Performance Data Set](https://archive.ics.uci.edu/ml/datasets/Student+Performance)

- **Description:** The dataset have 30 attribute information and three academic grades of students in math course and Portuguese language course. In this analysis, we will use the dataset of students in math course. Based on our question, We are only focusing on these two variables for our analysis: `G3` - final grade (numeric: from 0 to 20, output target) and `romantic` - with a romantic relationship (binary: yes or no).

## Plan 
- **First step**: We imported our dataset and made some data wrangling on our dataset.
- **Second step**: We visualized our dataset using boxplot.
- **Third step**: We created a table which have statistical summary for two groups of students, one group are the students in relationship and the other group is not. We will report the mean of final grade, sample size, and 95% confidence interval of each group.
- **Forth step**: We performed a two sample t-test on our dataset and reject the null hypothesis if the p-value is greater than alpha = 0.05. - **Fifth step**: We stated some limitation and expectation on our dataset.
      
## How to Run
The scripts should be run in the following order:

1. `src/load_data.R` 

input: `data/student-mat.csv`  output: `data/registered_student.csv`

2. `src/vic_data.R`     

input: `data/registered_student.csv`  output: `results/boxplot.png`

3. `src/analyze_data.R`   

input: `data/registered_student.csv` output: `data/t_test.csv`

4. `src/summarized_data.R`    

input: `data/registered_student.csv` output: `results/summary.csv`         output:`results/CI_plot.png`

5. `doc/Report.Rmd`

In command line, these codes will create the entire project. 
```
Rscript src/load_data.R data/student-mat.csv data/registered_student.csv
Rscript src/vic_data.R data/registered_student.csv results/boxplot.png
Rscript src/analyze_data.R data/registered_student.csv data/t_test.csv
Rscript src/summarized_data.R data/registered_student.csv results/summary.csv results/CI_plot.png
# knit RMD report
Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = 'github_document')"
Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = 'pdf_document')"
Rscript -e "rmarkdown::render('doc/report.Rmd', output_format = 'html_document')"
```
## Dependencies
- `rmarkdown`
- `knitr`
- `tidyverse`
- `broom`
- `infer`

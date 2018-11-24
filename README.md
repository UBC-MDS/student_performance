
# Student_Performance
Data Analysis Project for Student Performance

## Members Name and MDS github ID: 

[Yenan Zhang](https://github.ubc.ca/joshua04)

[Zixin Zhang](https://github.ubc.ca/zixinz)

## Dataset
- **Source:** https://archive.ics.uci.edu/ml/datasets/Student+Performance

- **Description:** The dataset have 30 attribute information and the academic grades of students in math course and Portuguese language course. In this analysis, we will use the dataset of students in math course. The data set involved different kinds of data such as numeric variables, like G3, and categorical vairbales, like romantic. We are focusing on these two variables for our analysis: `G3` - final grade (numeric: from 0 to 20, output target) and `romantic` - with a romantic relationship (binary: yes or no) 

## Preliminary Question
- Question: Does romantic relationship influence student's academic performance?
- Type: Exploratory 

## Plan
First, perform EDA by making a violin and jitter plot of grades facetted on relationship status.

Second, perform a two group hypothesis tests of mean grade between students in relationships and student who are not.
- Null hypothesis: romantic relationship has no effect on final grade
- Alternative hypothesis: romantic relationshp will change student's final grade
- Significance level: choose alpha=0.05
      
## Summarize the data
We will make some data wrangling on our dataset. Then, we will create a table which have statistical summary for two groups of students, one group are the students in relationship and the other group is not. We will report the mean of final grade, sample size, standard deviation and 95% confidence interval of each group. We will also visualize our data by violin plot and jitter plot for the final grade and facetted on relationship status.   

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

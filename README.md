
## Student Performance
Data Analysis Project for Student Academic Performance

### Members Name and MDS github ID:

[Yenan Zhang](https://github.ubc.ca/joshua04)   (joshua04)

[Zixin Zhang](https://github.ubc.ca/zixinz)       (zixinz)

### Repo structure
[`data/`](https://github.com/UBC-MDS/student_performance/tree/master/data) contains raw and cleaned data

[`doc/`](https://github.com/UBC-MDS/student_performance/tree/master/doc) contains the final Report

[`results/`](https://github.com/UBC-MDS/student_performance/tree/master/results) contains various plots and summary table(csv)

[`src/`](https://github.com/UBC-MDS/student_performance/tree/master/src) contains all the Rscripts

[`Makefile`](https://github.com/UBC-MDS/student_performance/blob/master/Makefile) shell script are in the root directory

### Project Motivation
It's common to see that many high school students now are in romantic relationships. However, some parents think that having romantic relationship will influence teenagers' academic performances. In this project, we are interested in conducting research on an exploratory question - **Does romantic relationship influence student's academic performance**?.

### Explore Dataset
We use the data set [Student Performance Data Set](https://archive.ics.uci.edu/ml/datasets/Student+Performance) for our analysis. The dataset have 30 attribute information and three academic grades of students in math course and Portuguese language course. In this analysis, we will use the dataset of students in math course. Based on our question, We are only focusing on these two variables for our analysis: `G3` - final grade (numeric: from 0 to 20, output target) and `romantic` - with a romantic relationship (binary: yes or no).

### Plan
1. We imported our dataset and made some data wrangling on our dataset.

2. We visualized our dataset using boxplot.

3. We created a table which have statistical summary for two groups of students, one group are the students in relationship and the other group is not. We will report the mean of final grade, sample size, and 95% confidence interval of each group.

4. We performed a two sample t-test on our dataset and reject the null hypothesis if the p-value is greater than alpha = 0.05.

5. We stated some limitation and expectation on our dataset.

### Usage
There are two recommended methods of running this analysis:

**First Method: Make (without Docker)**

1. Clone this repository [student_performance](https://github.com/UBC-MDS/student_performance)

2. Run the following commands in terminal to run the analysis:

```
# To remove all unnecessary files
make clean

# To run all necessary scripts for the report
make all
```

The `Makefile` would run the following scripts:

```
# run load_data.R, input one raw dataset and output a clean data
# dependency: tidyverse
make data/registered_student.csv

# run viz_data.R, input clean data and output one figure
# dependency: tidyverse
make results/boxplot.png

# run summarized_data.R, input clean data and output one figure and one table
# dependency: tidyverse
make results/summary.csv results/CI_plot.png

# run analyze_data.R, input clean data and output one table
# dependency: tidyverse, broom
make results/t_test.csv

# input all above results and render md and html version of the report
# dependency: rmarkdownm, knitr, tidyverse and infer
make doc/Report.md doc/Report.html
```

**Second Method: Docker (needed Docker installed)**

1. Clone this repository [student_performance](https://github.com/UBC-MDS/student_performance)

2. In terminal, run the following code to download the Docker image
```
docker pull zixinz/student_performance
```
3. Use the command line to navigate to the root of this project directory

4. Type the following to run the analysis:
```
docker run --rm -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/student_performance zixinz/student_performance make -C '/home/student_performance' all 
```
5. Type the following to clean up the analysis:
```
docker run --rm -e PASSWORD=test -v <ABSOLUTE PATH OF REPO>:/home/student_performance zixinz/student_performance make -C '/home/student_performance' clean
```
You are able to find the [final report](https://github.com/UBC-MDS/student_performance/blob/master/doc/Report.md) in the doc folder after running the script.


### Dependency Diagram of the Makefile
![](Makefile.png)

### Dependencies
- `rmarkdown` v1.1
- `knitr` v1.2
- `tidyverse`v1.2.1
- `broom` v0.5.0
- `infer` v0.3.1

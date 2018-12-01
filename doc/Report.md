Student Performance Analysis
================
Zixin Zhang, Yenan Zhang

Introduction
------------

It's common to see that many high school students now are in romantic relationships. However, some parents think that having romantic relationship will influence teenagers' academic performances. In this project, we are interested in conducting research on an exploratory question - **Does romantic relationship influence student's academic performance?**.

We choose the dataset [Student Performance Data Set](https://archive.ics.uci.edu/ml/datasets/Student+Performance) from UCL Machine Learning Repository. The dataset have 30 attribute information and three academic grades of students in math course and Portuguese language course. In this analysis, we will use the dataset of students in math course. Based on our question, We are only focusing on these two variables for our analysis: `G3` - final grade (numeric: from 0 to 20, output target) and `romantic` - with a romantic relationship (binary: yes or no).

*Table 1. Student Performance Dataset*

|    X| school | sex |  age| address | famsize | Pstatus |  Medu|  Fedu| Mjob     | Fjob     | reason     | guardian |  traveltime|  studytime|  failures| schoolsup | famsup | paid | activities | nursery | higher | internet | romantic |  famrel|  freetime|  goout|  Dalc|  Walc|  health|  absences|   G1|   G2|   G3|
|----:|:-------|:----|----:|:--------|:--------|:--------|-----:|-----:|:---------|:---------|:-----------|:---------|-----------:|----------:|---------:|:----------|:-------|:-----|:-----------|:--------|:-------|:---------|:---------|-------:|---------:|------:|-----:|-----:|-------:|---------:|----:|----:|----:|
|    1| GP     | F   |   18| U       | GT3     | A       |     4|     4| at\_home | teacher  | course     | mother   |           2|          2|         0| yes       | no     | no   | no         | yes     | yes    | no       | no       |       4|         3|      4|     1|     1|       3|         6|    5|    6|    6|
|    2| GP     | F   |   17| U       | GT3     | T       |     1|     1| at\_home | other    | course     | father   |           1|          2|         0| no        | yes    | no   | no         | no      | yes    | yes      | no       |       5|         3|      3|     1|     1|       3|         4|    5|    5|    6|
|    3| GP     | F   |   15| U       | LE3     | T       |     1|     1| at\_home | other    | other      | mother   |           1|          2|         3| yes       | no     | yes  | no         | yes     | yes    | yes      | no       |       4|         3|      2|     2|     3|       3|        10|    7|    8|   10|
|    4| GP     | F   |   15| U       | GT3     | T       |     4|     2| health   | services | home       | mother   |           1|          3|         0| no        | yes    | yes  | yes        | yes     | yes    | yes      | yes      |       3|         2|      2|     1|     1|       5|         2|   15|   14|   15|
|    5| GP     | F   |   16| U       | GT3     | T       |     3|     3| other    | other    | home       | father   |           1|          2|         0| no        | yes    | yes  | no         | yes     | yes    | no       | no       |       4|         3|      2|     1|     2|       5|         4|    6|   10|   10|
|    6| GP     | M   |   16| U       | LE3     | T       |     4|     3| services | other    | reputation | mother   |           1|          2|         0| no        | yes    | yes  | yes        | yes     | yes    | yes      | no       |       5|         4|      2|     1|     2|       5|        10|   15|   15|   15|

Visualization
-------------

In order to better visualize our dataset, we choose the boxplot because boxplot can provide us information on how our data spread and the how the means of two groups differ from each other.

*Figure 1. five numbers summary of the variable G3 facetted by romantic*

<img src="../results/boxplot.png" width="480" />

The boxplot tells us five number summary of `G3` among the two groups of students, with relationship and without relationship. The two groups of student have similar mean of the final grade, but we found that both the 25th percentile and 75th percentile of the group **no** are higher than that of the group **yes**. The maximum grade is in the group **no**, and the minimum grade is in the group **yes**.

Data summary
------------

In this part, we create a table which have statistical summary for in relationship and single groups of students. We will report the mean of final grade, sample size, 95% confidence interval of each group. We also visualize our data by a violin plot and jitter plot for the G3(final grade) and facetted on relationship status. The reason we choose a violin plot and jitter plot is that we want to see in which section there are higher probability to have more students getting the similar grades. Adding the error bar is to represent the variability of data in each group.

*Table 2. Statistical Summary of the Data*

|    X|     lower|     upper| romantic |      mean|    n|
|----:|---------:|---------:|:---------|---------:|----:|
|    1|  11.19582|  12.03265| no       |  11.63265|  245|
|    2|  10.75871|  11.82143| yes      |  11.28571|  112|

*Figure 2. Mean G3 for in-relationship and single groups of students. Error bars represent 95% confidence intervals generated by boostrapping.*

<img src="../results/CI_plot.png" width="480" />

In the single group, the estimate of the population parameter, the mean of G3(final grade) is 11.63265. Here, we used boostrapping to come up with a 95% confidence interval for the estimate, \[11.19582, 12.03265\]. The emean of G3(final grade) falls within this 95% confidence interval.

In the in-relationship group, the estimate of the population parameter, the mean of G3(final grade) is 11.28571. Here, we used boostrapping to come up with a 95% confidence interval for the estimate, \[10.75871, 11.82143\]. The mean of G3(final grade) falls within this 95% confidence interval.

Hypothesis Testing and Results
------------------------------

To better explore the effect of having an romantic relationship, we conduct a two sample Welch's t-test ( [t-test reference](https://en.wikipedia.org/wiki/Welch%27s_t-test)): two samples have unequal variances and unequal sample sizes).

**Null hypothesis**: romantic relationship has no effect on final grade

**Alternative hypothesis**: romantic relationshp will effect student's final grade

**Significance level**: choose alpha = 0.05

*Table 3. Results of the t-test*

|    X|   estimate|  estimate1|  estimate2|  statistic|   p.value|  parameter|    conf.low|  conf.high| method                  | alternative |
|----:|----------:|----------:|----------:|----------:|---------:|----------:|-----------:|----------:|:------------------------|:------------|
|    1|  0.3469388|   11.63265|   11.28571|  0.9971016|  0.319687|   248.0219|  -0.3383694|   1.032247| Welch Two Sample t-test | two.sided   |

From the t-test, we have t-statistics = 0.9971016 and p-value = 0.319687. Since p-value &gt; alpha = 0.05, we fail to reject the null hypothesis that romantic relationship has no effect on final grade.

Limitations
-----------

1.  Limited sample: Although we have a total of 357 observations, the number of samples in the two groups are unevenly. Specifically, we have 245 in non-relationship group and only 112 in romantic relationship group. The relative small number (112) in one test group probably reduce the power of our test

2.  Limited comparison scale: The final grade has a range of 0 to 20, while this is enough for a test on group means, the difference is certainly less pronounced than a grade scale of 0 to 100.

3.  No control on other variables: Maybe those engaged in relationships all have significantly higher freetime than single students. So the added freetime canceled the negative effect of relationship. We don't know.

Future Directions
-----------------

1.  Increase sample size, especially for students in relationship groups
2.  control on more variables, such as age, free-time, gender, etc.

External Sources
----------------

1.  [Dataset](https://archive.ics.uci.edu/ml/datasets/Student+Performance)
2.  [t-test reference](https://en.wikipedia.org/wiki/Welch%27s_t-test)

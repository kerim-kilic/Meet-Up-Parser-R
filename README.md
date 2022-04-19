# Meet Up Parser in R

The **meetup_data.json** file in this repository contains the initial JSON datastructure as described in the assignment statement. The file **meet-up-parser.R** reads in this JSON file and transforms the data into the desired datastructure described in the assignment as shown below:

```JSON
{
  "meetUps": [
    "4th JBCN Conference · 2018-06-11 / 2018-06-13 · Barcelona, Spain",
    "3rd DevTernity · 2018-11-30 / 2018-12-01 · Riga, Latvia",
    "1st I T.A.K.E Unconference · 2016-05-19 / 2016-05-20 · Bucharest | Maramures, Romania",
    "2nd Product Owner Rule Book · 2016-04-11 / 2016-04-13 · Paris, France | Madrid, Spain",
    "Upfront Summit · 2018-02-01 · Los Angeles, California. United States",
    "IBM Think · 2018-03-19 · Nevada, United States"
  ]
}
```

## Requirements

In order to succesfully run the R script, the following packages are required:

```r
library("tidyverse")
library("jsonlite")
```

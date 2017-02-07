setwd("/Users/Pepper/Documents/Github/FES-com521-assignments")

REAL <- read.csv("week3_dataset-maggie.csv")

summary(safe.data.week3) #       x                 j              i              k              y         
Min.   :-59.677   Min.   :0.00   Min.   :0.00   Min.   :0.00   Min.   :-279.8  
1st Qu.:  8.605   1st Qu.:0.00   1st Qu.:0.00   1st Qu.:1.00   1st Qu.: 133.2  
Median : 42.670   Median :0.00   Median :1.00   Median :2.00   Median : 279.4  
Mean   : 38.457   Mean   :0.49   Mean   :0.54   Mean   :1.59   Mean   : 257.8  
3rd Qu.: 69.871   3rd Qu.:1.00   3rd Qu.:1.00   3rd Qu.:2.00   3rd Qu.: 396.5  
Max.   :136.346   Max.   :1.00   Max.   :1.00   Max.   :3.00   Max.   : 691.0  

summary(week2.dataset) # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-59.680   8.605  42.670  38.460  69.870 136.300 

length(safe.data.week3)

str(safe.data.week3)
'data.frame':	100 obs. of  5 variables:
  $ x: num  12.6 13.7 94 70.4 73.5 ...
$ j: int  1 0 1 0 1 1 0 1 0 0 ...
$ i: int  0 1 1 1 1 1 1 0 0 0 ...
$ k: int  2 3 2 2 0 2 0 2 0 1 ...
$ y: num  -10.5 104.4 536.9 429.1 375.5 ...




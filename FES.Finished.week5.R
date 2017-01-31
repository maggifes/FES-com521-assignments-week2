#PC0 

rm(list=ls())

#this removed all the enviornment... like trump

library(readr)
com521_population <- read_delim("~/Documents/Github/FESuwcom521-assignments/week_05/com521_population.tsv", 
                                "\t", escape_double = FALSE, trim_ws = TRUE)
View(com521_population)

#Take the mean of x variable 

mean(newpopulation$x)
#41.87806

#PC1 

#mean from week 2 = 38.45

#a compute by hand 
byhandnewpop<-sd(newpopulation$x)/sqrt(nrow(newpopulation))
byhandnewpop+mean(newpopulation$x)
mean(newpopulation$x)-byhandnewpop

1.96* sd(newpopulation$x)/ sqrt(length(newpopulation$x))
(1.96 * sd(newpopulation$x)/ sqrt(length(newpopulation$x))) * c(-1, 1)

mean(week3_dataset_maggie$x)+ (1.96 * sd(week3_dataset_maggie$x)/ sqrt(length(week3_dataset_maggie$x))) * c(-1, 1)
#95% 30.94078 45.97246


t.test(newpopulation$x)
#95% 41.05430-42.70183

t.test(week3_dataset_maggie$x)
#30.847, 46.96532

#PC2 ompare the distribution from your sample of x to the true population. Draw histograms and compute other descriptive and summary statistics. What do you notice? Be ready to talk for a minute or two about the differences.
hist(week3_dataset_maggie$x)
hist(newpopulation$x)

#divide by n = 

#PC3 Compute the mean of y from the true population and then create the mean and confidence interval from the y in your sample. Is it in or out?

mean(newpopulation$y)
#241.5074

mean(week3_dataset_maggie$y)
#257.8043

t.test(week3_dataset_maggie$y)
#217.2317 298.3768

#PC4  I want you to run a simple simulation that demonstrates one of the most fundamental insights of statistics:

maggiesrandom<- sample(1:9, 100000, replace = TRUE)
mean(maggiesrandom)

twototallyrandom<- replicate(100, sample(maggiesrandom, 2))
mean(twototallyrandom)
hist(twototallyrandom)
#higher on the ends

tentotallyrandom <- replicate(100, sample(maggiesrandom, 10))
mean(tentotallyrandom)
hist(tentotallyrandom)

#myattempatfunction

mean.of.two<-function(i){
  my.sample<-sample(maggiesrandom, 2)
  mean(maggiesrandom)}

sapply(rep(1,100), maggiesrandom)
hist(sapply(rep(1,100), maggiesrandom))

#PC5 Do PC4 again but with random data drawn from a normal distribution ( {\displaystyle N(\mu =42,\sigma =42)} {\displaystyle N(\mu =42,\sigma =42)}) instead of a uniform distribution. How are you results different than in PC4?

amyadams<- rnorm(10000, mean = 42, sd = 42)
mean(amyadams)
hist(amyadams)

amyadams102 <- replicate(100, sample(amyadams, 2))
meanamy102 <- colMeans(Randomnormal100)

amyadams110 <- replicate(100, sample(amyadams, 10))
meanamy110 <- colMeans(amyadams)
hist(meanamy110)

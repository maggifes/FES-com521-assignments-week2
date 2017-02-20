#PC0 

#Load the CSV file into R. Also make sure that you loaded the week 2 dataset file


#PC1. If you recall from Week PC6, x and y seemed like they linearly related. We now have the tools and terminology to describe this relationship and to estimate just how related they are. Run a t.test between x and y in the dataset and be ready to interpret the results for the class.

t.test(com521_population$x, com521_population$y)

#Welch Two Sample t-test

#data:  com521_population$x and com521_population$y
#t = -92.849, df = 10792, p-value < 2.2e-16
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  -203.8438 -195.4149
#sample estimates:
#  mean of x mean of y 
#41.87806 241.50743 

#PC2. Estimate how correlated x and y are with each other.
cor(com521_population$x, y = com521_population$y)
#[1] 0.8530374

plot(com521_population$x, com521_population$y)

#PC3. Recode your data in the way that I laid out in Week 3 PC7.

#PC7A very common step when you import and prepare for data analysis is going to be cleaning and coding data. Some of that is needed here. As is very common, i, j are really dichotomous "true/false" variables but they are coded as 0 and 1 in this dataset. Recode these columns as logical. The variable k is really a categorical variable. Recode this as a factor and change the numbers into textual "meaning" to make it easier. Here's the relevant piece of the codebook (i.e., mapping): 0=none, 1=some, 2=lots, 3=all. The goals is to end up with a factor where those text strings are the levels of the factor. I haven't shown you how to do exactly this but you can solve this with things I have shown you. Or you can try to find a recipe online.
safe.data.week3<- com521_population

tiger<- safe.data.week3$j
love <- safe.data.week3$k
lion<- safe.data.week3$i
spiderman <- safe.data.week3$y
eskimo<- safe.data.week3$x

safe.data.week3$j <- factor(safe.data.week3$j)
logicallion<-lion<1 #lion<-as.logical(safe.data.week3$i)
logicaltiger<-tiger<1 #tiger<- as.logical(safe.data.week3$j)
modernlove<-love
modernlove<-factor(modernlove, labels = c("None", "Some", "Lots", "All"))
is.factor(modernlove)
levels(modernlove)

#PC4. Generate a set of three linear models and be ready to intrepret the coefficients, standard errors, t-statistics, p-values, and 
tiger<- safe.data.week3$j
love <- safe.data.week3$k
lion<- safe.data.week3$i
spiderman <- safe.data.week3$y
eskimo<- safe.data.week3$x

logicallion<-lion<1 #lion<-as.logical(safe.data.week3$i)
logicaltiger<-tiger<1 #tiger<- as.logical(safe.data.week$j)
modernlove<-love
modernlove<-factor(modernlove, labels = c("None", "Some", "Lots", "All"))
is.factor(modernlove)
levels(modernlove)

#PC4

#a just x
lm(spiderman ~ eskimo, data = safe.data.week3)

#Call:
#lm(formula = eskimo ~ spiderman, data = safe.data.week3)

#Coefficients:
#  (Intercept)    spiderman  
#0.8186       0.1700 

#Positive linear relationship, crossing just over .8

summary(lm(spiderman ~ eskimo, data = safe.data.week3))

#Call:
#  lm(formula = eskimo ~ spiderman, data = safe.data.week3)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-81.328 -14.512  -0.136  14.602  97.268 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  0.81859    0.33348   2.455   0.0141 *  
#  spiderman    0.17001    0.00104 163.448   <2e-16 ***
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 21.93 on 9998 degrees of freedom
#Multiple R-squared:  0.7277,	Adjusted R-squared:  0.7276 
#F-statistic: 2.672e+04 on 1 and 9998 DF,  p-value: < 2.2e-16

#Explain 72% of variance 

#b 
eskimoliontiger <- summary(lm(spiderman ~ eskimo + lion + tiger, data = safe.data.week3))
eskimoliontiger

#Call:
#  lm(formula = eskimo ~ spiderman + lion + tiger, data = safe.data.week3)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-75.525 -13.706   0.024  13.808  89.327 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)   9.056692   0.402241   22.52   <2e-16 ***
#  spiderman     0.177797   0.001004  177.16   <2e-16 ***
#  lion         -6.466335   0.415165  -15.57   <2e-16 ***
#  tiger       -13.713029   0.421265  -32.55   <2e-16 ***

#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 20.65 on 9996 degrees of freedom
#Multiple R-squared:  0.7585,	Adjusted R-squared:  0.7584 
#F-statistic: 1.047e+04 on 3 and 9996 DF,  p-value: < 2.2e-16

#c
#tried updated didn't work... loveeskimo<- update.formula(eskimoliontiger, . ~ . + love)
> loveeskimo<- summary(lm(spiderman ~ eskimo + lion + tiger + love, data = safe.data.week3))
> loveeskimo

Call:
  lm(formula = eskimo ~ spiderman + lion + tiger + love, data = safe.data.week3)

Residuals:
  Min      1Q  Median      3Q     Max 
-75.551 -13.729   0.012  13.806  89.301 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)   9.139605   0.542044  16.861   <2e-16 ***
  spiderman     0.177794   0.001004 177.131   <2e-16 ***
  lion         -6.465474   0.415201 -15.572   <2e-16 ***
  tiger       -13.713643   0.421293 -32.551   <2e-16 ***
  love         -0.054772   0.240005  -0.228    0.819    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 20.66 on 9995 degrees of freedom
Multiple R-squared:  0.7585,	Adjusted R-squared:  0.7584 
F-statistic:  7848 on 4 and 9995 DF,  p-value: < 2.2e-16
#PC 5

#a histogram of residuals 
linearkisses<- lm(eskimo ~ spiderman, data = safe.data.week3)
hist(residuals(linearkisses))
hist(residuals(eskimoliontiger))
hist(residuals(loveeskimo))

#b 

#c QQ plot
qqnorm(residuals(linearkisses))
kissgraph <- data.frame(eskimo, residuals(linearkisses))
library(ggplot2)
ggplot(data = kissgraph) + aes(x = eskimo, y = residuals(linearkisses)) +geom_point()

#PC6
install.packages("stargazer")
library(stargazer)

stargazer(aneasyeskimo, type = "text")
stargazer(totalpackage, type = "text")

#PC 7
#done

#a
fruit<- lm(Halloween2012_2014_2015_PLOS_tab$fruit ~ Halloween2012_2014_2015_PLOS_tab$obama, data = Halloween2012_2014_2015_PLOS_tab)

#b 
controledfruit <- lm(Halloween2012_2014_2015_PLOS_tab$fruit ~ Halloween2012_2014_2015_PLOS_tab$obama + Halloween2012_2014_2015_PLOS_tab$age, data = Halloween2012_2014_2015_PLOS_tab)
summary(controledfruit)

facyear<- as.factor(Halloween2012_2014_2015_PLOS_tab$year)
allcontrolfruit<- lm(Halloween2012_2014_2015_PLOS_tab$fruit ~ Halloween2012_2014_2015_PLOS_tab$obama + Halloween2012_2014_2015_PLOS_tab$age + facyear, data = Halloween2012_2014_2015_PLOS_tab)
summary(allcontrolfruit)

#PC8
summary(residuals(fruit))
hist(residuals(fruit))
summary(residuals(controledfruit))
hist(residuals(controledfruit))

#PC9
Year2012<- subset(Halloween2012_2014_2015_PLOS_tab, Halloween2012_2014_2015_PLOS_tab$year == 2012)
Year2014<- subset(Halloween2012_2014_2015_PLOS_tab, Halloween2012_2014_2015_PLOS_tab$year == 2014)
Year2015<- subset(Halloween2012_2014_2015_PLOS_tab, Halloween2012_2014_2015_PLOS_tab$year == 2015)

linear2012<- lm(Year2012$fruit ~ Year2012$obama, data = Year2012)
linear2014<- lm(Year2014$fruit ~ Year2014$obama, data = Year2014)
linear2015<- lm(Year2015$fruit ~ Year2015$obama, data = Year2015)


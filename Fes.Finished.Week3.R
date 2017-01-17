setwd("/Users/Pepper/Documents/Github/FES-com521-assignments")

REAL <- read.csv("week3_dataset-maggie.csv")
load("~/Documents/Github/FES-com521-assignments/week2_dataset-maggie.RData")

#Get to know your data!

summary(safe.data.week3)
summary(week2.dataset)
str(safe.data.week3) #'data.frame': 100obs of 5 variables
hist(safe.data.week3$x)
hist(safe.data.week3$y)
hist(safe.data.week3$i)
hist(safe.data.week3$k)
 
# Compare the week2.dataset vector with the first column (x) of the data frame. I mentioned in the video lecture that they are similar? Do you agree? How similar? Write R code to demonstrate or support this answer convincingly.

safe.data.week3$x
xvar <- c(safe.data.week3$x)
xvar == week2.dataset #they're never the same actual value
summary(xvar)
summary(week2.dataset) #they have the same values! 

#Visualize the data using ggplot2 and the geom_point() function. Graphing the x on the x-axis and y on the y-axis seem pretty reasonable! If only it were always so easy! Graph i, j, and k on other dimensions (e.g., color, shape, and size seems reasonable). Did you run into any trouble? How would you work around this?
library(ggplot2)
ggplot(safe.data.week3, aes(x = safe.data.week3$x, y = safe.data.week3$y)) + geom_point(size = 2, shape = 23)
ggplot(safe.data.week3, aes(x = eskimo, y = spiderman)) + geom_point(size = 2, shape = 23)+geom_smooth(method=lm)
tiger<- safe.data.week3$j
love <- safe.data.week3$k
lion<- safe.data.week3$i
spiderman <- safe.data.week3$y
eskimo<- safe.data.week3$x

safe.data.week3$j <- factor(safe.data.week3$j)
ggplot(safe.data.week3) + geom_point() + aes(x=x, y=y, color=i, shape=j, size=k)
#PC7A very common step when you import and prepare for data analysis is going to be cleaning and coding data. Some of that is needed here. As is very common, i, j are really dichotomous "true/false" variables but they are coded as 0 and 1 in this dataset. Recode these columns as logical. The variable k is really a categorical variable. Recode this as a factor and change the numbers into textual "meaning" to make it easier. Here's the relevant piece of the codebook (i.e., mapping): 0=none, 1=some, 2=lots, 3=all. The goals is to end up with a factor where those text strings are the levels of the factor. I haven't shown you how to do exactly this but you can solve this with things I have shown you. Or you can try to find a recipe online.

logicallion<-lion<1 #lion<-as.logical(safe.data.week3$i)
logicaltiger<-tiger<1 #tiger<- as.logical(safe.data.week$j)
modernlove<-love
modernlove<-factor(modernlove, labels = c("None", "Some", "Lots", "All"))
is.factor(modernlove)
levels(modernlove)

#PC8 Take column i and set it equal to NA when if it is FALSE (i.e., 0). Then set all the values that are NA back to 1. Sorry for the busy work! ;)
newlion<-lion
newlion[newlion==0]<- NA
newlion[is.na(newlion)]<-0

# Now that you have recoded your data in PC7, generate new summaries for those three variables. Also, go back and regenerate the visualizations. How have these changed? How are these different from the summary detail you presented above?
summary(safe.data.week3$x)
summary(safe.data.week3$i)
summary(safe.data.week3$j)
ggplot(data=safe.data.week3) + geom_point() + aes(x=x, y=y, color=i, shape=j,size=k)
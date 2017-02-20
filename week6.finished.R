library(readxl)
Maggiecheats <- read_excel("~/Documents/Github/FES-com521-assignments/Maggiecheats.xlsx")
View(Maggiecheats)

#PC1 Load the data into R. Now get to work on reshaping the dataset. I think a good format would be a data frame with two columns: group, time of death (i.e., lifespan).
#I used excel...

control <- owan03_2$X1
control.factor <- rep("control",length(owan03_2$X1))
control.df <- data.frame(DeathAge = control, Group = control.factor)

low <- owan03_2$X2
low.factor <- rep("low",length(owan03_2$X2))
low.df <- data.frame(DeathAge = low, Group = low.factor)

medium <- owan03_2$X3
medium.factor <- rep("medium",length(owan03_2$X3))
medium.df <- data.frame(DeathAge = medium, Group = medium.factor)
medium.df

high <- owan03_2$X4
high.factor <- rep("High",length(owan03_2$X4))
high.df <- data.frame(DeathAge = high, Group = high.factor)
high.df

TOTALdata <- rbind(control.df, low.df, medium.df, high.df)
TOTALdata
#PC2 Create summary statistics and visualizations for each group. Write code that allows you to generate a useful way to both (a) get a visual sense both for the shape of the data and its relationships and (b) the degree to which the assumptions for t-tests and ANOVA hold. What is the global mean of your dependent variable?
summary(TOTALdata)
summary(TOTALdata$DeathAge)

#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#30.00   63.50   78.50   75.55   92.75  103.00       6 

tapply(TOTALdata$DeathAge, TOTALdata$Group, summary)
#$control
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#70.00   85.00   93.00   91.36  101.00  103.00 

#$low
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#49.00   63.00   70.00   69.89   77.00   89.00       2 

#$medium
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#30.00   58.25   79.50   71.50   89.25   97.00       1 

#$High
   #Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   #34.00   45.00   56.50   65.25   92.75  102.00       3 

#hist isn't normally distributed 
#DV = Age
mean(TOTALdata$DeathAge, na.rm = TRUE)
#75.55263

#PC3 Do a t-test between mice with any RD40 and mice with at least a small amount. Run a t-test between the group with a high dosage and control group. How would you go about doing it using formula notation? Be ready to report, interpret, and discuss the results in substantive terms.
t.test(TOTALdata$DeathAge[TOTALdata$Group=="control"], TOTALdata$DeathAge[TOTALdata$Group!="control"])

#p-value = .0001806 we reject the null/accept alternative 

#PC4

anotheranova<- aov(TOTALdata$DeathAge ~ TOTALdata$Group, data = df)
summary(anotheranova)
#P = .0245 

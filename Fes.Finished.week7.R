#PC1 

library(haven)
lilypad_anonymized <- read_dta("~/Downloads/lilypad_anonymized.dta")
View(lilypad_anonymized)

safelily<- lilypad_anonymized

#(a) Reproduce both Table 1 and Table 2 (just US users) using the dataset (as closely as possible).
lilygendertable<- table(safelily$gender, safelily$order_type)
colnames(lilygendertable)<- c("Arduino", "Both", "Lilypad")
row.names(lilygendertable)<- c("Female", "Male", "Unknown")
lilygendertable

#       Arduino Both Lilypad
#Female      890   79     367
#Male       7687  250     598
#Unknown    1332   41      91

USdata<- subset(safelily, country == 81)
lilycountrytable<- table(USdata$gender, USdata$order_type)
colnames(lilycountrytable)<- c("Arduino", "Both", "Lilypad")
row.names(lilycountrytable)<- c("Female", "Male", "Unknown")
lilycountrytable

#(b) Run a {\displaystyle \chi ^{2}} {\displaystyle \chi ^{2}}-test on both tables. Compare to the paper (for Table 1, there doesn't seem to be a {\displaystyle \chi ^{2}} {\displaystyle \chi ^{2}} test for Table 2). Did you reproduce it?

chisq.test(lilycountrytable)
chisq.test(lilygendertable)

#(c) Install the package "gmodels" and try to display the table using the function CrossTable(). This will give you output very similar to SPSS.

install.packages(c("gmodels"))
CrossTable(lilygendertable)
CrossTable(lilycountrytable)

#(d) It's important to be able to import tables directly into your word processor without cutting and pasting individual cells. Can you export the output of your table? There are a bunch of functions you can use to do this. I used the "xtable" package but I think that write.table() and Excel would do the job just as well.

write.table(lilycountrytable)
write.table(lilycountrytable, file = "lilypadtester")

#PC2. At the Community Data Science Workshops we had two parallel afternoon sessions on Day 1. In my session, there were 42 participants. In Tommy Guy's session, there were only 19. The next week (Day 2), we asked folks to raise their hands if they had been in Tommy's session (14 did ) and how many had been in mine (31 did). There was clearly attrition in both groups! Was there more attrition in one group than another? Try answering this both with a test of proportions (prop.test()) and with a {\displaystyle \chi ^{2}} {\displaystyle \chi ^{2}}. Compare your answers. Is there convincing evidence that there is a dependence between instructor and attrition?
tommytable<- rbind(c(42, 31), c(19, 14))
tommytable

colnames(tommytable)<- c("Day 1", "Day 2")
rownames(tommytable)<- c("Mako", "Tommy")

prop.test(tommytable)
#Day 1     Day 2
#Mako  0.3962264 0.2924528
#Tommy 0.1792453 0.1320755

#prop.test(tommytable)
#data:  tommytable
#X-squared = 1.4092e-30, df = 1, p-value = 1
#alternative hypothesis: two.sided
#95 percent confidence interval:
#  -0.2040317  0.2032015
#sample estimates:
#  prop 1    prop 2 
#0.5753425 0.5757576 

chisq.test(tommytable)
#asking if tommy/mako's attrition rates are independent 

#data:  tommytable
#X-squared = 3.0045e-31, df = 1, p-value = 1

#p-value is 1 greater than .05, we do not reject the null hypothesis that they are independent 
# Download this dataset that was just published on "The Effect of Images of Michelle Obama’s Face on Trick-or-Treaters’ Dietary Choices: A Randomized Control Trial." The paper doesn't seem to have even been published yet so I think the abstract is all we have. We'll come back to it again next week.

#(a) Download and import the data into R. I needed to install the "readstata13" package to do so.
library(readr)
Halloween2012_2014_2015_PLOS <- read_delim("~/Downloads/Halloween2012-2014-2015_PLOS.tab", 
                                           "\t", escape_double = FALSE, trim_ws = TRUE)
View(Halloween2012_2014_2015_PLOS)

#(b) Take a look at the codebook if necessary. Recode the data on being presented with Michelle Obama's face and the data on whether or not kids picked up fruit. we'll leave it at that for now.

faceoff<-table(Halloween2012_2014_2015_PLOS$obama, Halloween2012_2014_2015_PLOS$fruit)
colnames(faceoff)<- c("No", "yes")
rownames(faceoff)<- c("No", "Yes")

prop.test(faceoff)

#(c) Do a simple test on whether or not the two groups are dependent. Be ready to report those tests. The results in the paper will use linear regression. Do you have a sense, from your reading, why your results using the coding material we've learned might be different?
#PC2: Load both datasets into R as separate data frames. Explore the data to get a sense of the structure of the data. What are the columns, rows, missing data, etc? Write code to take (and then check/look at) several random subsamples of the data.

summary(top500)
summary(mobile)
head(top500)
head(mobile)

ncol(COS_Statistics_Mobile_Sessions)
nrow(COS_Statistics_Mobile_Sessions)

is.na(COS_Statistics_Mobile_Sessions)
is.na(COS_Statistics_Top5000_Pages)

MobileSessionsSample1 <- COS_Statistics_Mobile_Sessions[sample(1:nrow(COS_Statistics_Mobile_Sessions), 50, replace=FALSE),]
list(MobileSessionsSample1)
MobileSessionsSample2 <- COS_Statistics_Mobile_Sessions[sample(1:nrow(COS_Statistics_Mobile_Sessions), 50, replace=FALSE),]
list(MobileSessionsSample2)
Top5000sample1 <- COS_Statistics_Top5000_Pages[sample(1:nrow(COS_Statistics_Top5000_Pages), 50, replace=FALSE),]
list(Top5000sample1)
Top5000sample2 <- COS_Statistics_Top5000_Pages[sample(1:nrow(COS_Statistics_Top5000_Pages), 50, replace=FALSE),]
list(Top5000sample2)


#PC3: Using the top 5000 dataset, create a new data frame where one column is each month (as described in the data) and a second column is the total number of views made to all pages in the dataset over that month.

Newdataframe<- top500
Newdataframe["monthlyviews"]<-NA
montlyviews<-tapply(top500$Pageviews, top500$Month, sum)
montlyviews<- data.frame(months=names(montlyviews), total=montlyviews)
row.names(montlyviews)<- NULL

#PC4  Using the mobile dataset, create a new data frame where one column is each month described in the data and the second is a measure (estimate?) of the total number of views made by mobiles (all platforms) over each month. This will involve at least two steps since total views are included. You'll need to first use the data there to create a measure of the total views for each line in the dataset.
#first apply sessions x pageviews
mobile$totalpages<- mobile$Sessions*mobile$PagesPerSession
mobile.totalmonthlyviews<-tapply(mobile$totalpages, mobile$Month, sum)
total.views<-data.frame(months=names(mobile.totalmonthlyviews), total=mobile.totalmonthlyviews)
row.names(total.views)<- NULL

#PC5 Merge your two datasets together into a new dataset with columns for each month, total views (across the top 5000 pages) and total mobile views. Are there are missing data? Can you tell why?
maggietrystomerge<-merge(total.views, montlyviews)
#then maggie is a failure... 
#name of new data frame = merge(name of column, name of column, by = name of column)

maggiemerges.df<-merge(montlyviews, total.views, by.x = "months", by.y = "months")

#PC6 Create a new column in your merged dataset that describes your best estimate of the proportion (or percentage, if you really must!) of views that comes from mobile. Be able to talk about the assumptions you've made here. Make sure that date, in this final column, is a date or datetime object in R.

maggiemerges.df$percentage<-(maggiemerges.df$total.y/maggiemerges.df$total.x)*100
list(maggiemerges.df)

maggiemerges.df$months<- gsub(x=maggiemerges.df$months, pattern = "12:00:00 AM", replacement = "", fixed = T)
maggiemerges.df$months<- as.Date(maggiemerges.df$months, "%m/%d/%Y")
list(maggiemerges.df$months)

library(ggplot2)
> ggplot(data=maggiemerges.df)+geom_point()+aes(x = maggiemerges.df$months, y = maggiemerges.df$percentage)
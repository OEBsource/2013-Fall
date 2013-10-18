####SOURCE####
#Week 6 - Basic Statistics#
#By Chi-yun Kuo

#Remove things in our workspace, set working directory and read in data.
rm(list=ls())

setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week6_BasicStats")

Anole<-read.csv("anolisData.csv", header=T, na.string="?")

head(Anole)

#Perform simple measures of central tendency.
#Remember, if there is missing data you need to add na.rm to let R know.
mean(Anole$Awesomeness, na.rm=T)
median(Anole$Awesomeness, na.rm=T)

#Variance
var(Anole$Awesomeness, na.rm=T)

#Four quantiles
quantile(Anole$Awesomeness, na.rm=T)

#See all basic summary statistics
summary(Anole$Awesomeness)

#Let's look at the mean awesomeness of each island.
aggregate(Anole$Awesomeness, by=list(Anole$Island), FUN=mean, data=Anole, na.rm=T)

#There's an easier way to do this using the 'formula' notation.
#This involves using '~' and then telling R the data you are using.
aggregate(Awesomeness~Island, FUN=mean, data=Anole, na.rm=T)

#You can also just look at every variable.
#NAs will appear if the data is not numeric (e.g. in Island and ecomorph)
sapply(Anole,mean,na.rm=T)

#We can also look at means of each ecomorph on all islands.
aggregate(Awesomeness~Island*ecomorph,FUN=mean,na.rm=T,data=Anole)
#And plot that information in a boxplot. 
boxplot(Awesomeness~Island,data=Anole)


#Let's test for normality - remember, this test is pretty conservative.
shapiro.test(Anole$attitude)
#We get "p-value = 0.4283".
#This means the data does not significantly differ from a normal distribution.

#Let's see that visually.
#If the data is normal it should be a fairly straight line.
qqnorm(Anole$attitude)

#I want to square-root transform my snout-vent-length column.
#I added it to the last column in the Anole dataset.
Anole$sqrt.SVL<-sqrt(Anole$SVL)
#Let's see that - the last column is sqrt.SVL, great!
head(Anole)

#T-tests
#I want to see if there is a difference in means between SVL in Cuba and Hispaniola. 
#I'm going to extract that data first.
Anole.sub<-subset(Anole,subset=Island=="Cuba"|Island=="Hispaniola")
#The '==' is a logical statement.
#It means 'I want all the rows where this condition is true'.
#In our example it means ' I want all the species from the islands of Cuba and Hispaniola'.

#Let's run our t-test using the formula notation.
t.test(sqrt.SVL~Island,data=Anole.sub, paired=F, alternative="two.sided")
#We normally use a two tailed test - in some circumstances you may be interested in one side of the distribution.
#Also, this is not a paired t-test.
#Seems like there isn't a difference "p-value = 0.6854".

#We can also run the non-parametric version if our data is not normal.
wilcox.test(sqrt.SVL~Island,data=Anole.sub)
#This was not significant either "p-value = 0.56".
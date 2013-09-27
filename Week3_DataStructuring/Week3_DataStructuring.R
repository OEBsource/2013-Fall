####SOURCE####
#Week 3 - Data Structuring#
#By Yi-nan Hu
rm(list=ls())
setwd("D:/R/SOURCE/working data")

anolis<-read.csv("anolisData.csv",header=T,na.string="?")
head(anolis)
anolis


####subsetting on columns
betteranolis<-anolis[,7:11]
head(betteranolis)

?cbind()

#cbind sticks a set of columns together
evenbetteranolis<-cbind(anolis[,1],betteranolis)
head(evenbetteranolis)

#Add the column names 'Species' to the top of column 1.
colnames(evenbetteranolis)[1]<-"Species"
head(evenbetteranolis)

betteranolis2<-anolis[,c(1,7:11)]
head(betteranolis2)

#What is the 'c' function doing?
c(1,7:11)
c("Specis",1,2)
#It joins things together.

#We can also use c to join together columns by their names.
awesomespecieswithattitude<-anolis[,c("Species","Awesomeness","attitude")]
head(awesomespecieswithattitude)

awesomespecieswithattitude2->anolis[,c("Species","7","attitude")]


betteranolis2

#Let's get some summary statistics for each row.
summary(betteranolis2)
summary(betteranolis2[,"attitude"])


#aggregate function, learn from the warning messages.
#aggregate(betteranolis2,by="Island")
#aggregate(betteranolis2,by="Island",FUN=mean)
aggregate(betteranolis2,by=list(betteranolis2$Island),FUN=mean)

#There appears to be missing data in one of our columns that the function 'mean' does not like.
mean(betteranolis2$Awesomeness)
mean(betteranolis2$Awesomeness,na.rm=T)

aggregate(betteranolis2$attitude,by=list(betteranolis2$Island),FUN=mean,na.rm=T)

#Let's look at some continuous variables for two different grouping variables.
aggregate(betteranolis2$attitude,by=list(betteranolis2$Island,betteranolis2$ecomorph),FUN=mean,na.rm=T)

#We can visualize this data as part of a boxplot.
boxplot(betteranolis2$attitude~betteranolis2$Island)

#We can go one better here by adding a '*' symobol so we can make boxplots by two different grouping variables.
boxplot(betteranolis2$attitude~betteranolis2$Island*betteranolis2$ecomorph,las=3)

#There'sa lot of stuff on the bottom here, let's turn them vertical.
#We do this with the 'las=' argument. 3 means vertical. Try other numbers for the y-axis.
boxplot(betteranolis2$attitude~betteranolis2$Island*betteranolis2$ecomorph,las=3)


#We can use the subset function to subset by a certain factor or value.
HighHostility<-subset(betteranolis2,subset=hostility>0)
HighHostility

LowHostility<-subset(betteranolis2,subset=hostility<0)
LowHostility

LowHostility2<-subset(betteranolis2,subset=!hostility>0)
LowHostility2


#what is "!" doing?
List<-c(1,2,3,0,-1,-2)
List
List>0
!List>0
#The '!' will return the opposite of what you expect.
#You'll see below how that can be really useful.
#When you see TRUE or FALSE being displayed these are called loical statements.

LowHostility2<-subset(betteranolis2,subset=hostility>=0)

####subsetting on rows
#How does subset work?
?subset
#Here we want to get a new dataset that only has species from the Cuan islands.
JustCuba<-subset(betteranolis2,subset=Island="Cuba")
JustCuba
#Is that right? All the other islands are in there.

#We need to use '==' here to make it work.
JustCuba2<-subset(betteranolis2,subset = Island == "Cuba")
JustCuba2

#What does '==' mean?
#It's calling a logical statement like we saw above.
1==2
1==1
1=2

#We can also use '!' which select everything EXCEPT Cuba
NoCuba<-subset(betteranolis2,subset = !Island == "Cuba")
NoCuba


#Exersise
#make a subset of the data with 4 columns: Specis, Awesomeness, hostility and ecomorph
NoAttitude<-anolis[,c("Species","Awesomeness","hostility","ecomorph")]

#aggregate hostility by ecomorph, boxplot to visiualize
aggregate(NoAttitude$hostility,by=list(NoAttitude$ecomorph),FUN=mean)
boxplot(NoAttitude$hostility~NoAttitude$ecomorph,col=rainbow(8))

aggregate(NoAttitude$hostility~NoAttitude$ecomorph,FUN=mean)


#subset the awesome species (Awesomeness>1)
AwesomeSpecies<-subset(NoAttitude, Awesomeness > 1)
AwesomeSpecies

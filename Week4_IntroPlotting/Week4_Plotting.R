##Plotting##
#By Moira Concannon#

#remove any unnecessary items from workspace
rm(list=ls())

#set working directory

#read in data
anole <- read.csv("anolisData.csv",header=T,na.strings="?")

#check data
head(anole)
tail(anole)
str(anole)
summary(anole)

#make a histogram
anoleHist <- hist(anole$attitude)
anoleHist

#break the data into more bins
anoleHist20 <- hist(anole$attitude,breaks=20)
anoleHist20

#break the data into less bins
anoleHist5 <- hist(anole$attitude, breaks=5)
anoleHist5

#change the axis names, title, and color
hist(anole$attitude,main= "Histogram of Anole Attitude", xlab= "Anole Attitude", col="darkseagreen2",xlim=c(-3,3))

#or if you'd rather keep it funky
hist(anole$attitude,main= "Histogram of Anole Attitude", xlab= "Anole Attitude", col=rainbow(10),xlim=c(-3,3))

#look at histograms for multiple variables simultaneously
par(mfrow=c(2,2))
hist(anole$attitude)
hist(anole$hostility)
hist(anole$Awesomeness)
hist(anole$SVL)

#reset the plotting window
par(mfrow=c(1,1))

#make a boxplot
boxplot(anole$attitude)
boxplot(anole$attitude ~ anole$Island)

#add axis names, a title, and color
boxplot(anole$attitude ~ anole$Island,xlab="Island",ylab="Attitude",main="Anole Attitude by Island",col=c("red","blue","purple","green"))

#make a barplot
bars <- table(anole$ecomorph)
bars
barplot(bars)

#add axis names, titlem and color
barplot(bars, main="Number of Individuals per Ecomorph", ylab="Number of Individuals",xlab="Ecomorph",col=rainbow(7))

#make a scatterplot
plot(anole$attitude, anole$hostility)

#change axis names and title
plot(anole$attitude,anole$hostility,xlab= "Attitude",ylab="Hostility",main="Relationship between Attitude and Hostility",xlim=c(-3,3),ylim=c(-3,3))

#color points by Island
unique(anole$Island)
color=c("goldenrod1","cornflowerblue","darkorchid1","firebrick1")

#let's check what unclass is actually doing
color[unclass(anole$Island)]
head(anole$Island)
anole$Island

#make the plot
plot(anole$attitude,anole$hostility,col=color[unclass(anole$Island)],
     pch=19,xlab= "Attitude",ylab="Hostility",main="Relationship 
     between Attitude and Hostility",xlim=c(-3,3),ylim=c(-3,3))
legend(legend=levels(anole$Island),col=color,pch=19,"topright",title="Island",text.width=0.5,y.intersp=0.5)

#Exercises
# 1. make a histogram of PCI_limbs. Add a title, axes labels, 
#and color

# 2. plot boxplots of all three PC variables in the same window 

# 3. make a scatterplot of attitude and hostility, colored 
#by ecomorph



#Answers
hist(anole$PCI_limbs)

par(mfrow=c(1,3))
boxplot(anole$PCI_limbs,main="PCI")
boxplot(anole$PCII_head,main="PCII")
boxplot(anole$PCIII_padwidth_vs_tail,main="PCIII")

par(mfrow=c(1,1))
unique(anole$ecomorph)
color=c("red","black","blue","green","gold","purple","orange")
plot(anole$attitude ~ anole$hostility,col=color[unclass(anole$ecomorph)],pch=19,xlab= "Attitude",ylab="Hostility",main="Relationship between Attitude and Hostility",xlim=c(-3,3),ylim=c(-3,3))
legend(legend=levels(anole$ecomorph),col=color,pch=19,"topright",title="Ecomorph",text.width=0.5,y.intersp=0.5)

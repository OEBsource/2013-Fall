####SOURCE####
#Week 8 - Regression lines and PCA#

rm(list=ls())
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week8_Regression")

Anolis<-read.csv("anolisData.csv", header=T, na.strings="?")

plot(Anolis$attitude, Anolis$hostility)
Fit<-lm(Anolis$hostility~Anolis$attitude)
abline(Fit)

str(Fit)
#Find the residuals and view them.
Fit$residuals

plot(Anolis$attitude, Anolis$residuals, col=unclass(Anolis$Island), pch=20)
#Plots a horizontal line at 0.
abline(h=0)
#Could also plot a vertical line at 0 using...
#abline(v=0)

#If you want to specify the colour of the plot use...
#Colour<-c("red", "blue", "dark green", "black")
#Then add col=Colour[unclass(Anolis$Island)] into the plot function.


##Principle Component Analysis (PCA) using bird wing data.
Birds<-read.csv("BirdWings.csv", header=T, row.names=1)
head(Birds)
str(Birds)

#In some cases you may want to order your data by a factor.
 #That's not required here but it would look like this.
 #Birds.order <- Birds[order(Birds$ecotype),]

#There are two different ways to run PCA.
 #princomp and prcomp - apparently prcomp is preferred.
 #I have seen very little difference between the two however.

WingPCA <- prcomp(Birds, cor=TRUE)
#Need to run without the factors.

ncol(Birds)
WingPCA <- prcomp(Birds[ ,1:8], cor=T)
#Cor=T means base on a correlation matrix
#Cor=F means base on a covariation matrix
 #Which one you choose depends on the scale of your data.
  #If you have orders of magnitude differences between data - use correlation.
#covariance matrix when the variable scales are similar and the correlation matrix when variables are on different scales.
#Using the correlation matrix standardises the data.

#Print variance accounted for.
summary(WingPCA)

#PC loadings
loadings(WingPCA) 
#First PC normally has a size component (unless from a landmark analysis)

#View the principal components
WingPCA$scores

#Plot them as part of a morphospace
plot(WingPCA$scores)


#I want to see how the different birds are arranged in morphospace.
 #To do this I will plot them and group them by their flying style, or ecotype.

WScores<-as.data.frame(WingPCA$scores)
#We need to do this as a matrix will not allow additional entries to be added.
WScores$ecotype<-Birds$ecotype
class(WScores)
#Good, it's now a data frame.

#Let's plot the scores out.
plot(WScores[,1], WScores[,2], pch=19, col=unclass(WScores$ecotype))

#Subset our data into the two groups
Glide <- subset(WScores, ecotype=="Glide")
Raptor<- subset(WScores, ecotype=="Raptor")

#I want to see a convex hull surround the two groups.
 #This will allow me to better visualize how much morphospace they occupy.

#The convex hull plotting works by finding the points on the outside of the morphospace
#It works using part of the polygon function.
#You then use the lines function to plot it.
glide.hull <- chull(Glide)
#glide.hull now contains all the individuals on the outer edges of the morphospace.
glide.hull <- c(glide.hull, glide.hull[1])
#I add the first number back on using "c" so it forms a complete polygon.
lines(Glide[glide.hull, ], lty=1, col="black")
#I plot the lines by indexing the Glide rows by my boundary individuals.


raptor.hull <- chull(Raptor)
raptor.hull <- c(raptor.hull, raptor.hull[1])
lines(Raptor[raptor.hull, ], lty=2, col="red")

#Use this to plot the individual names onto your plots.
text(WScores[,1], WScores[,2], row.names(WScores), cex=0.6, pos=4, col="red")
#Change "pos=" to different numbers and the text will be placed in different positions on the plot.



#Tasks
#Read in BatData.csv - calcuate a PCA and plot the scores onto a morphospace.
#Check the data - should it be a correlation or covaraition matrix?

Bats<-read.csv("BatData.csv", header=T, row.names=1)
head(Bats)

ncol(Bats)
BatPCA <- princomp(Bats[ ,1:4], cor=F)

summary(BatPCA)

loadings(BatPCA)

BatPCA$scores
plot(BatPCA$scores)
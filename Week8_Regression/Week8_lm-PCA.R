rm(list=ls())
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week8_Regression")

Anolis<-read.csv("anolisData.csv", header=T, na.strings="?")

plot(Anolis$attitude, Anolis$hostility)
Fit<-lm(Anolis$hostility~Anolis$attitude)
abline(Fit)

str(Fit)
Fit$residuals

plot(Anolis$attitude, Anolis$residuals, col=unclass(Anolis$Island), pch=20)
abline(h=0)


#PCA using bird wing data
Birds<-read.csv("BirdWings.csv", header=T, row.names=1)
head(Birds)
str(Birds)

#Birds.order <- Birds[order(Birds$ecotype),]

WingPCA <- princomp(Birds, cor=TRUE)
#Need to run without the factors

ncol(Birds)
WingPCA <- princomp(Birds[ ,1:8], cor=T)
#Cor=T means base on a correlation matrix
#Cor=F means base on a covariation matrix
 #Which one you choose depends on the scale of your data.
  #If you have orders of magnitude differences between data - use correlation.
#covariance matrix when the variable scales are similar and the correlation matrix when variables are on different scales.
#Using the correlation matrix standardises the data.

summary(WingPCA) # print variance accounted for 

loadings(WingPCA) # pc loadings 
#First PC normally has a size component (unless from a landmark analysis)

WingPCA$scores #View the principal components
plot(WingPCA$scores)

#biplot(WingPCA)



WScores<-as.data.frame(WingPCA$scores)
WScores$ecotype<-Birds$ecotype
class()

plot(WScores[,1], WScores[,2], pch=19, col=unclass(WScores$ecotype))

#Subset our data into the two groups
Glide <- subset(WScores, ecotype=="Glide")
Raptor<- subset(WScores, ecotype=="Raptor")

glide.hull <- chull(Glide)
glide.hull <- c(glide.hull, glide.hull[1])
lines(Glide[glide.hull, ], lty=1, col="black")

#The convex hull plotting works by finding the points on the outside of the morphospace
#It works using part of the polygon function.
#You then use the lines function to plot it.

raptor.hull <- chull(Raptor)
raptor.hull <- c(raptor.hull, raptor.hull[1])
lines(Raptor[raptor.hull, ], lty=2, col="red")

text(WScores[,1], WScores[,2], row.names(WScores), cex=0.6, pos=4, col="red")



#Tasks
#Read in BatData.csv - calcuate a PCA and plot the scores onto a morphospace.
#Check the data - should it be a correlation or covaraition matrix?




Bats<-read.csv("BatData.csv", header=T, row.names=1)
head(Bats)

ncol(Bats)
BatPCA <- princomp(Bats[ ,1:4], cor=F)

summary(BatPCA) # print variance accounted for 

loadings(BatPCA) # pc loadings 
#First PC normally has a size component (unless from a landmark analysis)

BatPCA$scores #View the principal components
plot(BatPCA$scores)


rm(list=ls())
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week8_Regression")

Test<-read.table("Force_Displacement_2.txt", header=T, sep="\t")

plot(Test$Displacement.um, Test$Force.Plastic.A.mn)
fit<-lm(Force.Plastic.A.mn~Displacement.um, data=Test)
abline(fit)
summary(fit)

str(fit)
fit$residuals

Test<-read.csv("anolisData.csv", header=T, na.strings="?")

plot(Test$attitude, Test$hostility)
Fit<-lm(Test$hostility~Test$attitude)
abline(Fit)

str(Fit)
Fit$residuals

plot(Test$attitude, Fit$residuals, col=unclass(Test$Island), pch=20)
abline(h=0)


#PCA
Birds<-read.csv("BirdWings.csv", header=T, row.names=1)
head(Birds)
str(Birds)

Birds.order <- Birds[order(Birds$ecotype),]

WingPCA <- princomp(Birds.order, cor=TRUE)
#Need to run without the factors

ncol(Birds)
WingPCA <- princomp(Birds.order[ ,1:8], cor=TRUE)
#Cor=T means base on a correlation matrix
#Cor=F means base on a covariation matrix
 #Which one you choose depends on the scale of your data.
  #If you have orders of magnitude differences between data - use

summary(WingPCA) # print variance accounted for 

loadings(WingPCA) # pc loadings 
#First PC normally has a size component (unless from a landmark analysis)
plot(WingPCA,type="lines") # scree plot 

WingPCA$scores #View the principal components
plot(WingPCA$scores)

#biplot(WingPCA)



WScores<-as.data.frame(WingPCA$scores)
WScores$ecotype<-Birds.order$ecotype
class()

plot(WScores[,1], WScores[,2], pch=19, col=unclass(WScores$ecotype))

glide.hull <- chull(WScores[1:8,])
glide.hull <- c(glide.hull, glide.hull[1])
lines(WScores[1:8,][glide.hull, ], lty=1, col="black")
#The convex hull plotting works by finding the points on the outside of the morphospace
#It works using part of the polygon function.
#You then use the lines function to plot it.

raptor.hull <- chull(WScores[9:19,])
raptor.hull <- c(raptor.hull, raptor.hull[1])
lines(WScores[9:19,][raptor.hull,], lty=2, col="red")


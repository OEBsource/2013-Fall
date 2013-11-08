####SOURCE####
#Week 9 - Distance matrix, mantel test, and others#
rm(list=ls())
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week9_PCoA")

MammalData <- read.csv("MammalsExtant.csv", na.strings="NA", header=T)

head(MammalData)

#We need to get it in the correct format to calculate distance.
#Transpose
MDataT <- t(MammalData)

##Distance Matrix##
MammalDist <- dist(MDataT, method="euclidean", diag=T, upper=F)

#As were are using discrete data here.
#Therefore, we should really use a manhattan distance matrix.
MammalDist <- dist(MDataT, method="manhattan", diag=F, upper=T)

##Cluster Analysis##
fit <- hclust(MammalDist, method="ward") 

#Display dendogram
plot(fit)
#Cut tree into 2 clusters
groups <- cutree(fit, k=2)
#Draw dendogram with red borders around the 2 clusters 
rect.hclust(fit, k=2, border="red")

##Principle Coordinate Analysis##
MammalPCO <- cmdscale(MammalDist, k=10)

plot(MammalPCO)
text(MammalPCO, row.names(MDataT), cex=0.6, pos=3, col="red")

#Mantel test for correlation between the distance matrices
ozone <- read.csv("Ozone.csv", header=T, row.names=1)

station.dists <- dist(cbind(ozone$Lon, ozone$Lat), method="euclidean")
ozone.dists <- dist(ozone$Av8top, method="euclidean")

#Permuting the correlation between matrices and calculating the same test
#statistic under each permutation and comparing the original test statistic to the
#distribution of test statistics from the permutations to generate a p-value

mantel(station.dists, ozone.dists)

#Test is significant, yay!
#So smaller differences in ozone are generally seen among pairs of stations that are
#close to each other than far from each other.
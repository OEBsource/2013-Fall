#Remove everything from your workspace.
rm(list=ls())

setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week5_AdvancedPlotting")

Force<-read.table("Force_Displacement_2.txt", header=T, sep="\t")

head(Force)

par(mfrow=c(2,2))
plot(Force$Displacement.um, Force$Force.Plastic.A.mn, type='l', lwd=2)
plot(Force$Displacement.um, Force$Force.Plastic.A.mn, type='p', cex=1.5, pch=19)
plot(Force$Displacement.um, Force$Force.Plastic.A.mn, type='b', lty=2)
plot(Force$Displacement.um, Force$Force.Plastic.B.mn, type='n')
lines(Force$Displacement.um, Force$Force.Plastic.B.mn, col="red")
lines(Force$Displacement.um, Force$Force.Plastic.A.mn, col="black")

#Reset the plotting window
par(mfrow=c(1,1))

#Plotting an image
#Install a package to read pictures
install.packages("png")
#Load that library into our workspace.
library(png)

#Replace the directory and file information with your info
ima1 <- readPNG("ResponseSurface1.png")

Anoles<-read.csv("anolisData.csv", header=T, na.strings="?", row.names=1)

str(Anoles)

quartz()
plot(Anoles$SVL, Anoles$PCII_head, yaxs='i', xaxs='i', type='n', xlim=c(3,5.5), ylim=c(-7,5), main="Anole Morphospace", xlab="SVL", ylab="Head PC2")

#Get the plot information so the image will fill the plot box, and draw it
#Set the limits of your plot
lim <- par()
#Tell R what those limits are - Each margin has it's own limits - There are four margins.
rasterImage(ima1, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])

#As Moira did last week with the colours, we are going to define the symobols we want.
OurSymbols<-c(0, 2, 15, 17, 18, 19, 3)

points(Anoles$SVL, Anoles$PCII_head, pch=OurSymbols[unclass(Anoles$ecomorph)], cex=1.5)
legend("bottomright", legend=levels(Anoles$ecomorph), bty="n", pch=OurSymbols)


#Set up the plotting area to save a figure
pdf("ReponseFigure.pdf", width=10, height=10)
#s for 'square plot'
par(pty="s") 

#Meat of the plot - do not include quartz()
dev.off()



#Exercises
#Exercises
#1
#Plot the A, B, and C force dispalcement curves on the same chart, each with a different colour and different line type. Label the plot and axes.
#2
#Plot Anole PC3 and PC4 over the ResponseSurface2.png image. Label the plot and axes, add a legend.


#Answers
#1
#Plot the A, B, and C force dispalcement curves on the same chart, each with a different colour and different line type. Label the plot and axes.
plot(Force$Displacement.um, Force$Force.Plastic.C.mn, type='n', ylim=c(0,55), xlab="Displacement (um)", ylab="Force (mn)", main="Force-Displacement Curves of three Plastics")
lines(Force$Displacement.um, Force$Force.Plastic.B.mn, col="red")
lines(Force$Displacement.um, Force$Force.Plastic.A.mn, col="black")
lines(Force$Displacement.um, Force$Force.Plastic.C.mn, col="blue")

#2
#Plot Anole PC3 and PC4 over the ResponseSurface2.png image. Label the plot and axes, add a legend. If you feel like you're ready - save it directly to PDF.
ima2 <- readPNG("ResponseSurface2.png")

quartz()
plot(Anoles$PCIII_padwidth_vs_tail, Anoles$PCIV_lamella_num, yaxs='i', xaxs='i', type='n', xlim=c(-5,4), ylim=c(-4,4), main="Anole Morphospace", xlab="Tail PC3", ylab="Lamella PC4")

#Get the plot information so the image will fill the plot box, and draw it
#Set the limits of your plot
lim <- par()
#Tell R what those limits are - Each margin has it's own limits - There are four margins.
rasterImage(ima2, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])

#As Moira did last week with the colours, we are going to define the symobols we want.
OurSymbols<-c(0, 2, 15, 17, 18, 19, 3)

points(Anoles$PCIII_padwidth_vs_tail, Anoles$PCIV_lamella_num, pch=OurSymbols[unclass(Anoles$ecomorph)], cex=1.5)
legend("bottomright", legend=levels(Anoles$ecomorph), bty="n", pch=OurSymbols)

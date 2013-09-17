####SOURCE####
#Week 2#
#Data handling#
#Remove everything from your workspace.
rm(list=ls())

#Set your working directory.
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week2_DataHandling")

#Read in your data file.
Force<-read.table("Force_Displacement.txt", header=T)
#Remember how we had those problems because we had a space in our title?

#We'll we can get R to sort them out (once we know what the problem is).
#We need to tell R how each of our data entries is separated using 'sep'.

Force<-read.table("Force_Displacement.txt", header=T, sep="\t")
#Note the direction of the slash - this file is tab delimited.
#R will put a "." where the space was in our headers
Force

#Check the structure
str(Force)
#Good - everything looks correct.


####Accessing certain parts of your data frame####
#With this dataset we're only interested in the force measurement.
#We can extract that using a techniwue called indexing.
#the syntax for indexing is DATANAME[rownumbers,columnnumbers]

#Let's see what's in the third column
Force[,3]

#If you know the name of the variable you're interested in you can access it using the '$' sign.
Force$Force.mn

#If you want to look at two variables it's easier to use indexing.
Force[,2:3]
#The colon here means 'show me data entries from column 2 to column 3.

#You can also delete columns. Place into a different data name so you don't overwrite anything.
ForceEdit1<-Force[,-1]
ForceEdit1

#Or
ForceEdit2<-Force[,-2:-3]
ForceEdit2

#Let's access some rows.
Force[1,]
#Multiple rows
Force[1:5,]
#Delete the last 5
ForceRowEdit<-Force[-6:-10,]
ForceRowEdit

#See a subset of the rows and column
Force[4:8,2:3]




####Data transformation####
#I'd like to log some of my data.
log(Force$Displacement.um)
#This will log every data point in your varaible.

#Let's duplicate our original data frame so we don't modify he original
Force.Test<-Force

#Let's add that onto the end of our data frame.
Force.Test$LOGdisplacement.um<-log(Force.Test$Displacement.um)
#Here we wanted our new varaible to be called 'LOGdisplacement.um' and we wanted the log of displacement to go into it.

#You can also overwrite your original data.
Force.Test$Displacement.um <-log(Force.Test$Displacement.um)
#You are now placing it back into the 'Displacement.um' variable column.
#there's an extra step though... You need to rename the variable so you know the data has been logged.
names(Force.Test)[2]<-"LOGdisplacement.um"
#Here we see indexing being used again - the 2 here means the second column name in our data frame.

#Let's see it all - and remove the last column
Force.Final<-Force.Test[,-4]
Force.Final

#Let's save our transformation
write.table(x=Force.Final, file="Force.LOGtransform.txt", row.names=FALSE, col.names=TRUE)



####In class tasks####
#Read in the anolisData.csv file, remember the NA values are listed as '?' (na.strings).
	#Delete the 'Awesomeness' column using indexing.
	#Log snount-vent length (SVL), and add it to the end of your data file


Lizards<-read.csv("anolisData.csv", header=T, na.strings="?")

LizardsEdit<-Lizards

#If using the name of the varaible then you have to do this - it's pretty difficult to understand...
Drops<-"Awesomeness"
LizardDrops<-LizardsEdit[,!(names(LizardsEdit) %in% Drops)]

#...I'd make them use indexing.
LizardDrop<-LizardsEdit[,-7]
#If they assigned row names then the index would be LizardsEdit[,-6]

#Log SVL and add to the end.
LizardsEdit$LogSVL<-log(LizardsEdit$SVL)
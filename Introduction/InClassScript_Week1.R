#What do I have in my workspace?
ls()
#Remove workspace files.
rm(list=ls())

#Setting my working directory so I can read in files.
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Introduction")
#Where's my directory?
getwd()

#What's in my working directory?
list.files()

#Reading a csv
Lizards<-read.csv("anolisData.csv")
#Use capitals to avoid overwriting R functions.

#Let's see our data
Lizards

#Looks at the top part of the data.
head(Lizards)

#Looks at the help file.
?head

#Looks at the first two rows.
#There are two arguments, x (your file), and n (how many rows you want to display).
head(x=Lizards, n=2)

#But... There's missing data :(
LizardsMiss<-read.csv("anolisData.csv", na.strings="?")



#Read.table for txt files
Force<-read.table("Force_Displacement.txt")
#There's an error.because of the space between each varaible and its unit.
#For the moment we can open the file in excel and edit it there.
#It is possible to do it in R, but we'll try that next week.

ForceEdit<-read.table("Force_Displacement1.txt")
ForceEdit

#But now R thinks my headers are data.
ForceEditHeaders<-read.table("Force_Displacement1.txt", header=TRUE)
#Now we're all set.
ForceEditHeaders

#The structure of the data.
str(ForceEditHeaders)
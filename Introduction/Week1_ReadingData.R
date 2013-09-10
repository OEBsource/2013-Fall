####SOURCE####
#Welcome to week 1#

#Today we'll be learning how to set a working directory and read in some data#

#This little function clears the working memory
rm(list=ls())

#You first need to tell R the location of the files you wish to run.
#You do this with 'setwd' this means set working directory.

#The general format is setwd("YourFileLocation")
#In Mac right click and getinfo, or do cmd+i. To run it do cmd+enter (Mac), or crtl+r (Windows)
setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Introduction")
#In R-Studio check that the console has switched to your directory.

#Let's check we're in the right place
list.files()
#You'll notice that I didn't put anything in the parentheses that time.
#That's because many of the functions in R have defaults pre-assigned to them.
#We'll discus defaults a little later on.

#Let's read in our data.
#There's two ways to do this depending on the file format; read.csv and read.table.
#Our file is a csv of lizard morpholoical data from the Harmon group.
#Let's name this file 'Lizards'

Lizards<-read.csv("anolisData.csv")

#or
#read.csv("anolisData.csv")->Lizards
#Both ways work, stick to one so you don't get confused.
#This '<-' is the assign symbol

#So what is read.csv doing? Let's use R's help directory to see what the defaults are.
?read.csv
#The defaults are listed here as well. The main one to notice is the treatment of the header row.

#Let's look at the top few lines of the data.
head(Lizards)
#We can edit this to see more or less of the data
head(Lizards, n=4)
#Ah, R doesn't know what '?' means. To us it means missing data.
#We need to tell R that.

Lizards<-read.csv("anolisData.csv", na.strings= "?")
#It puts an 'NA' in its place.

#You can also just completely skip the first line
Lizards<-read.csv("anolisData.csv", na.strings= "?", skip=1)
#What's happened here?
#The default for read.csv is header=T, we need to change that.
Lizards<-read.csv("anolisData.csv", na.strings= "?", header=F, skip=1)
#You can type in in FALSE or F, and TRUE or T. These are called logical statements.

#We can look at the whole dataset by typing...
Lizards

#Let's see how read.table works
Finch<-read.table("geospiza.txt")
Finch

#See how important the header argument is now.
#The read.table function needs to be told that there is a header row, whereas read.csv does not.
Finch<-read.table("geospiza.txt", header=T)
Finch
#Fixed!

#Let's go back to the Lizard data. How is R seeing the data?
str(Lizards)
#We have factors and numbers here. The other common data assignments are character and integer.

#The class function allows you to see how R is storing the dataset.
class(Lizards)
#Other classes include matrix, list, and phylo.

#Tasks
#Read in the carnivore dataset. Correct for missing data, check the top 7 rows, and look at the data structure.
Carn<-read.table("carni.txt", header=T)
head(Carn)
str(Carn)
#What's strange about this dataset? We'll talk about re-assigning variables next week.

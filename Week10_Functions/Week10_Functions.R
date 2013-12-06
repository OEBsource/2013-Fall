####SOURCE####
#Week 10 - Understanding how to use basic functions#
rm(list=ls())

Add10 <- function(x) {
  
  Xadd10 <- x + 10
  
  Xadd10
}

Add10(x=20)

Products <- function(x, y) {
  
  ProductOutput <- x * y
  
  ProductOutput
}

#Hit TAB while writing to complete the function's name.
#Also, you can hit TAB while in the parentheses to see
#what arguments are required.
Products(x=2, y=5)

#You can often give these functions a single value, or a vector.
ProdX <- c(1,2,3)
ProdY <- c(2,3,4)

Products(x=ProdX, y=ProdY)
#The function will the find the product of each value in turn.
#1*2, 2*3, and 3*4

#Or you can have a mixture of single values and products.
Products(x=2, y=ProdY)
#This will now multiply 2, by everything in ProdY.

AddDivide <- function(x, Add, Div) {
  A.D <- ((x + Add)/Div)
  A.D
}

AddDivide(5,6,2)


#No built in function for standard error.
#The standard error is just the standard deviation divided by the square root of the sample size.
stdErr <- function(x) {
  se <- sd(x)/sqrt(length(x))
  se
}

Example <- c(1, 2, 3, 4)

stdErr(Example)

#You can also use functions you wrote inside new functions.
ProdErr <- function(x, y) {
  ProdSE <- stdErr(Products(x, y))
  ProdSE
}

x.P <- c(2, 5, 7, 10)
y.P <- c(4, 6, 8, 9)

ProdErr(x.P, y.P)

#Task
#Make a function that takes in a value (x),
#finds the standard deviation of a vector, and adds some number
#that the user can specify to each.

sdOne <- function(x, Add) {
  sdOutput <- sd(x) + Add
  sdOutput
}

Vec <- c(1,5,7,10)
sdOne(x=Vec, Add=10)

#Extras
#Once function is over, the x's die, but not when you use "<<-"
#Good debugging trick to see what the function is outputting at any given stage.
InsideFunction <- function() {
  x<<-10
  x<-15
  return(x)
}
#This is just an example - there are no arguments in this function.

InsideFunction()
#Gives us 15
x
#Gives us 10 because of the <<- sign

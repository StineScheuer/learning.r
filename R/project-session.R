source(here::here("R/package-loading.R"))


1
1
#brug denne når du kommenterer
#object assignemt
weight_kilos <- 100
weight_kilos

#vector
c("a", "b")
c(1,2)
1:10

#dataframe
head(iris)

colnames(iris)
str(weight_kilos)
str(iris)
summary(iris)

lm

# data wrangling ----------------------------------------------------------


# Exercise 1 --------------------------------------------------------------




# Object names
day_one
T <- FALSE
c <- 9
mean <- function(x) sum(x)

# Spacing. alrid space efter komma og før ogf efter matematik
x[, 1]
x[ ,1]
x[ , 1]
mean (x, na.rm = TRUE)
mean( x, na.rm = TRUE )
function (x) {}
function(x){}
height<-feet*12+inches
mean(x, na.rm=10)
sqrt(x ^ 2 + y ^ 2)
df $ z
x <- 1 : 10

# Indenting skal stå i samme linje
if (y < 0 && debug)
  message("Y is negative")

sd

`+`

summing <- function(a, b) {
  add_numbers <- a + b
  return(add_numbers)
}
summing(2, 2)

# create packages

library(tidyverse)

write.csv(iris, here::here("data/iris.csv"))

iris_data <- read_csv(here::here("data/iris.csv"))

iris_data

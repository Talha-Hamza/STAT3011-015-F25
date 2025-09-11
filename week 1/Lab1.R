# STAT 3011 Lab 1 (Date: September 2 or 4, 2025) Fall 2025
# Introduction to R

# Exercise 1: Create an R vector
# a. Define a variable called vec0 as a vector of three numbers: 1, 121, 100
vec0 <- c(1, 121, 100)
vec0

# b. Define a variable called vec1 as a vector of numbers 3, 4, ..., 99, 100
vec1 = 3:100
vec1

# c. Obtain the length (size), sample mean, and the sample variance of vec1
length(vec1)
mean(vec1)
var(vec1)

# Exercise 2: Vectorized operations in R
# a. Double every number in vec0. Save the new vector as vec2
vec2 <- vec0*2
vec2

# b. Add 10 to every number in vec0. Save the new vector as vec3
vec3 <- vec0 + 10  # Fill in the blank with +
vec3

# c. Square every number in vec0. Save the new vector as vec4
vec4 <- vec0^2
vec4

# d. Multiply vec2 and vec3 element-wise. Save as vec23
vec23 <- vec2*vec3
vec23

# Exercise 3: Import hurricanes.csv dataset and save as hur0
# Download file from Canvas > Modules > Week 1 first
# hur0 <- read.csv("~/your_pathname_goes_here/hurricanes.csv")
# OR
hur0 <- read.csv(file.choose(), header = TRUE)

# What is the size (number of rows and number of columns) of hur0?
dim(hur0)
nrow(hur0)
ncol(hur0)

# Exercise 4: Explore the hur0 dataset
# What variables are included? List first six, first three, and last six observations
names(hur0)
head(hur0)
head(hur0, 3)
tail(hur0)

# Exercise 5: Save only the 3rd-5th columns of hur0 as hur3
hur3 <- hur0[,3:5]
head(hur3)

# Exercise 6: Remove the 193th-235th rows from hur3 (missing data), save as hur
hur <- hur3[-c(193:235),]
head(hur)

# Exercise 7: Calculate sample mean and variance of MaxWind variable in hur
mean(hur$MaxWind)
var(hur$MaxWind)

# Exercise 8: Draw a histogram of MaxWind variable
hist(hur$MaxWind)

# Exercise 9: Get help for hist() function
# help(hist)  # or ?hist
?hist

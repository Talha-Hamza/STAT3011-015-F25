# STAT 3011 Lab 2 (Date: Week 2: September 11, 2025) Fall 2025 

# Exercise 2:
# Read in the data (update the path as needed)
cereal <- read.csv(file.choose(), header = TRUE)

# a. Use either names() or head( ) to identify the names of all four variables 
#    Determine if variables are quantitative or qualitative. 
names(cereal)
head(cereal)
str(cereal$Sugar) # QUANTITATIVE
str(cereal$Sodium)# QUANTITATIVE

str(cereal$Cereal) # QUALITATIVE
str(cereal$Type) # QUALITATIVE

# b. Use nrow() or tail() to determine the number of observations in the cereal dataset.
nrow(cereal) # 20 observations

# c. Use table() to create a summary table of Type (C for children / A for Adult's cereal). 
#    Identify the number of children cereals and adult's cereals in the data set.
table(cereal$Type) # 10  cereals for each A and C

# d. Use boxplot(cereal$Sugar) to construct a boxplot of sugar. Use the 
#    main="add your title here" option to add a meaningful title and ylab=" " 
#    to add a vertical axis label. Describe the overall shape of the distribution. 
#    How many modes are there? Are the data skewed? Are there any outliers?
boxplot(cereal$Sugar, ylab = "Amount of Sugar (g)", 
        main = "Boxplot of Cereal Sugar")
# Are the data skewed? = NO, symmetrical
# Are there any outliers? = No outliers
hist(cereal$Sugar, ylab = "Amount of Sugar (g)", 
        main = "Histogram of Cereal Sugar")
# How many modes are there? = 2 modes

# e. Use boxplot(cereal$Sugar ~ Type) to construct a side-by-side boxplot of Sugar 
#    with respect to the Type of cereal. Compare the shape of the distributions 
#    for adult cereal (Type 'A')and children (Type 'C') cereal. What can you 
#    conclude from observing your graphic about the amount of sugar in cereal 
#    for each type? Who has more sugar?

boxplot(cereal$Sugar ~ cereal$Type)
# Children cereals contain more sugar content as compared to adult cereals, 
# as seen through the median

# f. Use summary() command to find the five number summary of sugar amount. 
#    Does the results agree with the boxplot from part d? Compute the IQR. 
#    Again, does this agree with the boxplot from part d?

# g. Find the mean and standard deviation of sugar content. Are the mean and median close?

# h. Use the following R command to construct a histogram for the sugar amount 
#    with appropriate titles. How many cereals have a sugar content more than 15g?
#    hist(cereal$Sugar, main="add your title", xlab="add your horizontal axis label")

# i. Now construct a histogram of sugar content with 10 breaks. See class notes p.14. 
#    Describe the overall shape of the distribution.


# STAT 3011 Lab 8 
# Problem 1: What value of z*_a/2 is used to construct

# a. A 95% confidence interval to estimate p if the number of successes is 50 
#    and the number of failures is 25 in a random sample.
qnorm(0.975) #or
qnorm(1-0.05/2)

# b. A 92% confidence interval to estimate p if the number of successes is 50 
#    and the number of failures is 25 in a random sample.
qnorm(0.96)
qnorm(1-0.08/2)

# c. A 98% confidence interval to estimate p if the number of successes is 50 
#    and the number of failures is 25 in a random sample.
qnorm(0.99)
qnorm(1-0.02/2)

# d. A 99% confidence interval to estimate p if the number of successes is 50 
#    and the number of failures is 25 in a random sample.
qnorm(0.995)
qnorm(1-0.01/2)

# e. What pattern do you notice about the value of z*_a/2 increases as the degree of confidence increases?
# ANSWER: The z*_a/2 increases as the degree of confidence increases

###############################################################################

# Problem 2: Proportion of Students from MN
# In this problem, we will construct a confidence interval to estimate the population 
# proportion of UMN students who are from Minnesota from the Getting to Know You dataset. 
# Assume this data represents a random sample of students from the University of Minnesota.
Getting2NoU <- read.csv("https://raw.githubusercontent.com/Talha-Hamza/STAT3011-015-F25/refs/heads/main/Getting2NoU.csv", header = TRUE)
# a. Use table() command to make a frequency table of the variable MN
table(Getting2NoU$MN)

# b. We will use the subset() command to create a dataset that retains students who are 
#    from Minnesota (Yes) or not from Minnesota (No). Use the following R code and create 
#    your own name for the new dataset.
new.dataset <- subset(Getting2NoU, Getting2NoU$MN=="No" | Getting2NoU$MN=="Yes")

# c. Use table() command to make a frequency table of variable MN in the new dataset. 
#    Calculate the sample proportion p_hat of students from Minnesota. Round your answer 
#    to the nearest three decimal number.
table(new.dataset$MN)
phat <- 227/334
round(phat, 3)

# d. What is the standard error of the sample proportion?
se <- sqrt(phat*(1-phat)/334)
se

# e. Use prop.test command to construct a 95% confidence interval. Insert correct values/options 
#    in the blanks below. Interpret.
prop.test(x=227, n=334, conf.level=0.95, alternative="two.sided", correct=FALSE)

# Interpretation: We are 95% confident that p, the true proportion of students who are from
# Minnesota, resides between 0.63 and 0.74.

# Or if we repeatedly select a random sample of 334 students and construct a 95% confidence
# interval, then in the long run, 95% of those intervals would contain the true population
# proportion of U students that are from MN.

# f. Calculate the width of the confidence interval.
# width = 0.727 - 0.628 = 0.099
0.7273965 - 0.6277997

# g. How large does the sample size need to be, if we would like to estimate p, population 
#    proportion of U students that are from MN, within plus or minus 0.02 with 95% confidence level? 
#    Use the sample proportion from c. as an educated guess for p.

n <- phat*(1-phat)*(1.96/0.02)^2
n
ceiling(n)  # Round up to nearest integer
# Round n = 2089.83 up to 2090
###############################################################################

# Problem 3: Proportion of Students from US
# In this problem, we will construct a confidence interval to estimate the population 
# proportion of UMN students who are from US from the Getting to Know You dataset. 
# Assume this data represents a random sample of students from the University of Minnesota.

# a. Subset the US.Int variable using the subset() command to create a dataset that 
#    retains students who are from US (US) or not (International).
new.dataset2 <- subset(Getting2NoU, Getting2NoU$US.Int=="International" | Getting2NoU$US.Int=="U.S.")

# b. Use table() command to make a frequency table of variable US.Int in the new dataset. 
#    Calculate the sample proportion p_hat of students from US. Round your answer to the 
#    nearest three decimal number.
table(new.dataset2$US.Int)
phat2 <- 309/334
round(phat2, 3)

# c. What is the standard error of sample proportion? Why is this smaller than in part d 
#    in Problem 2 when the sample size is the same, n = 334?
se2 <- sqrt(phat2*(1-phat2)/334)
se2

# Why smaller? For fixed n, the standard error is smaller because there is less variability 
# when phat is closer to 0 or 1 than and max variability when phat is 0.5.

# d. Use prop.test command to construct a 95% confidence interval. Interpret the results.
prop.test(x=309, n=334, conf.level=0.95, alternative="two.sided", correct=FALSE)

# Interpretation: We are 95% confident that p, the true proportion of UMN students who
# are from US, resides between 0.89 and 0.95.

# e. Calculate the width of the confidence interval and compare to the width of the 
#    confidence interval from Problem 2. Why is the width smaller than in Problem 2?
# width = 0.9487 - 0.8918 = 0.0569
0.9487893 - 0.8918417

# Why smaller? Once again for fixed n, phat is close to 1 so less variability hence smaller moe

# f. How large does the sample size need to be, if we would like to estimate p, population 
#    proportion of U students that are from US, within plus or minus 0.2 with 95% confidence level? 
#    Use the sample proportion from b. as an educated guess for p.

n2 <- phat2*(1-phat2)*(1.96/0.02)^2
n2
ceiling(n2)

# g. Repeat the sample size computation without any prior information of p, i.e., 
#    assume the worst case scenario.

# no prior info of phat.

n_worst <- 0.5*(1-0.5)*(1.96/0.02)^2
n_worst
ceiling(n_worst)

###############################################################################

# Problem 4: HW5 Problem 1
# Population SD vs Sample SD vs SD of Estimator vs Standard Error
# A researcher studies adult heights (in feet). Historical records suggest that the 
# population standard deviation is sigma = 0.33 ft. From a new simple random sample of 
# size n = 64, the sample mean is x_bar = 5.62 ft and the sample standard deviation is s = 0.37 ft.

# 1. For each quantity below, circle one: True (population) or Sample-based / Estimated.
# a. Population standard deviation, sigma: True or Sample-based
# b. Sample standard deviation, s: True or Sample-based  
# c. Standard deviation of the sample mean: True or Sample-based
# d. Standard error of the sample mean: True or Sample-based

# ANSWERS:
# a. True (population)
# b. Sample-based / Estimated
# c. True (population) 
# d. Sample-based / Estimated.

# 2. Compute the standard deviation of the sample mean and the standard error of the 
#    sample mean (in feet).
# (a) SD(X) = sigma/sqrt(n).
sd_mean <- 0.33/sqrt(64)
sd_mean

# (b) SE(x) = s/sqrt(n).
se_mean <- 0.37/sqrt(64)
se_mean

# 3. Which of the two quantities in the previous problem would you actually use in practice, and why?
# ANSWER: Use the standard error because sigma is typically unknown; s estimates sigma from the data.
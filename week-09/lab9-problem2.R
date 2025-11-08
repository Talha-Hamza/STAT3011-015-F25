# STAT 3011 - Lab 9: Problem 2


# Load the dataset
Getting2NoU <- read.csv("https://raw.githubusercontent.com/Talha-Hamza/STAT3011-015-F25/refs/heads/main/Getting2NoU.csv",
                        header = TRUE)

# Extract the 'exercise' variable
exercise <- Getting2NoU$exercise


###########################################################
# (a) Construct a histogram and Q-Q plot of daily exercise
#     Describe the shape of the distribution.
###########################################################

# Histogram of exercise
hist(exercise,
     main = "Histogram of Daily Exercise (hr/day)",
     xlab = "Exercise (hours per day)")

# Q-Q Plot of exercise
qqnorm(exercise, main = "Q-Q Plot of Exercise Data")
qqline(exercise, col = "red", lwd = 2)

# The distribution is right-skewed as shown by both plots.


###########################################################
# (b) Point estimate of the population mean μ
###########################################################

sample_mean <- mean(exercise)
# [1] 1.728557


###########################################################
# (c) Standard error of the sample mean for exercise
###########################################################

sample_sd <- sd(exercise)          # Sample standard deviation
n <- length(exercise)      # Sample size

# Compute standard error manually
se <- sample_sd / sqrt(n)
se
# [1] 0.0826


###########################################################
# (d) Construct a 95% confidence interval "by hand"
###########################################################

sample_mean + c(-1, 1) * qt(1-0.05/2, n - 1) * se
# [1] 1.566124 1.890990


###########################################################
# (e) Compute the 95% confidence interval using t.test()
###########################################################

t.test(exercise, conf.level = 0.95, alternative = "two.sided")

# 95 percent confidence interval:
# 1.566124 1.890990
# We are 95% confident that the mean number of hours a student spends exercising
# is between 1.57 and 1.89 hours/day.


###########################################################
# (f) Assumptions / Conditions
###########################################################

# To construct a confidence interval for μ using the t-distribution, we assume:
# 1. The sample is random.
# 2. The population is approximately normal.
# 3. There are no extreme outliers.

# Since n = 335 (which is > 30), by the Central Limit Theorem,
# the sampling distribution of the mean is approximately normal
# even though the data is right-skewed.

# However, five outliers are present, which might make results slightly less reliable.

# Check for outliers visually
boxplot(exercise, main = "Boxplot of Daily Exercise", ylab = "Hours per Day")

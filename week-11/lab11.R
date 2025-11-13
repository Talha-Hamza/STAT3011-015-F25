############################################################
# STAT 3011 - Lab 11
# Week 11: November 11 or November 13, 2025

############################################################
# Problem I: Getting2NoU Sleep Question
############################################################

# Research Question:
# Do college students sleep less, on average, on a week night compared to the weekend night?

# a. What type of two-sample problem is Problem I? Are the two groups independent or matched pairs?

# Answer:
# This is a matched pairs problem since each student recorded both weekday and weekend sleep.

# b. Compute the difference between the sleep and sleep.weekend variables.
#    Create a boxplot of the difference. What concern do you have?

Getting2NoU <- read.csv("https://raw.githubusercontent.com/Talha-Hamza/STAT3011-015-F25/refs/heads/main/Getting2NoU.csv", header = TRUE)

difference <- Getting2NoU$sleep - Getting2NoU$sleep.weekend

boxplot(difference, main = "Difference in Sleep (Week - Weekend)", ylab = "Hours of Sleep")

which(difference == -7)

# Answer:
# One observation (-7 hours) is an outlier. The t-distribution is not robust to outliers.
# We will drop subject 62.

# c. Drop subject 62 and repeat part (b).

no.outliers <- Getting2NoU[-62, ]
new.difference <- no.outliers$sleep - no.outliers$sleep.weekend
boxplot(new.difference, main = "Difference in Sleep (Outlier Removed)", ylab = "Hours of Sleep")

# d. State null and alternative hypotheses for testing the Research Question:
# H0: μD = 0
# Ha: μD < 0

# e. Compute summary statistics and the test statistic.
xbar_D <- mean(new.difference)
s_D <- sd(new.difference)
n_D <- length(new.difference)
t_stat <- (xbar_D) / (s_D / sqrt(n_D))
t_stat


# f. What is the p-value for this problem?
p_value <- pt(t_stat, df = n_D - 1)
p_value

# output: 1.58845e-46

# g. Interpret your conclusion at α = 0.01.
# Answer:
# Since p-value << 0.01, we reject H0.
# Conclusion: Students get less sleep on a week night compared to a weekend night.

# h. Would a 99% confidence interval include the value of the hypothesized parameter?
t.test(new.difference, alternative = "two.sided", conf.level = 0.99)

# Example Output:
# t = -16.779, df = 333, p-value < 2.2e-16
# 99% CI: (-1.426754, -1.045102)
# mean = -1.235928
# Since 0 is not in the CI, we reject H0.


############################################################
# Problem II: Getting2NoU GPA Question
############################################################

# Research Question:
# Is the average GPA of in-state college students different from out-of-state students?

# Subset college.GPA data into in-state and out-of-state students:
table(Getting2NoU$MN)
MN.yes <- Getting2NoU$college.GPA[which(Getting2NoU$MN == "Yes")]
MN.no <- Getting2NoU$college.GPA[which(Getting2NoU$MN == "No")]

# a. Are the two groups independent or matched pairs?
# Answer:
# The groups are independent (students are either from MN or not).

# b. Graphically present college GPA by group.
boxplot(MN.yes, MN.no,
        ylab = "College GPA",
        xlab = "From Minnesota?",
        names = c("Yes", "No"),
        main = "College GPA: In-State vs Out-of-State")

# Answer:
# Three outliers for MN students are visible, but all are likely values.

# c. Based on the boxplot, do you think there is a statistical difference?

# Answer:
# No, the boxes overlap heavily, suggesting little difference.

# d. Perform a two-sample t-test (α = 0.05)
t.test(MN.yes, MN.no, conf.level = 0.99, alternative = "two.sided", var.equal=FALSE)
# Since p = 0.1046 > 0.01, we fail to reject H0.

# e. Find the standard error of the difference.
sd_yes <- sd(MN.yes, na.rm = TRUE)
sd_no <- sd(MN.no, na.rm = TRUE)
n_yes <- length(MN.yes) - sum(is.na(MN.yes))
n_no <- length(MN.no) - sum(is.na(MN.no))

SE_diff <- sqrt((sd_yes^2 / n_yes) + (sd_no^2 / n_no))
SE_diff
# SE = 0.05065

# Interpretation:
# This is how much the mean difference would vary across repeated samples.

# f. Construct a 99% confidence interval manually.
mean_diff <- mean(MN.yes, na.rm = TRUE) - mean(MN.no, na.rm = TRUE)
t_multiplier <- qt(0.995, df = min(n_yes - 1, n_no - 1))
lower <- mean_diff - t_multiplier * SE_diff
upper <- mean_diff + t_multiplier * SE_diff
c(lower, upper)

# CI: (-0.2156, 0.0504)
# Since 0 is inside the CI, we fail to reject H0 — consistent with part (d).


############################################################
# Problem III: Homework 8, Problem 10.18
############################################################

# a. Point estimate for difference in means:
xbar_F <- 63.8
xbar_S <- 70.4
diff_means <- 63.8 - 70.4
diff_means
# Answer:
# Point estimate = -6.6 minutes.
# On average, freshmen spend 6.6 minutes less on Facebook than sophomores.

# b. Interpret the confidence interval in context:
# CI (−16.80, 3.66)
# Answer:
# We are 95% confident the true difference lies between -16.8 and 3.7.
# Since 0 is inside, there’s no significant difference.

# c. Is the time spent on Facebook normally distributed?
# Answer:
# Data is right-skewed with outliers, but large n (439 and 403), so CLT applies.
# The CI is valid.

# d. Comment on generalisability.
# Answer:
# The sample is from one large university — results may not generalize
# to all universities.

# e. Explain how the margin of error was obtained.
SE <- 5.21
t_val <- 1.96
MOE <- t_val * SE
MOE
# Answer:
# MOE = 1.96 * 5.21 ≈ 10.2, matching the ±10.23 in the table.



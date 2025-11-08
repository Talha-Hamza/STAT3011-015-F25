# STAT 3011 Lab 10 

# Assume that the Getting to Know You Survey is a random sample draw from the 
# population of all UofM students.

# We are interested in testing the following two claims.
# • Claim A About 12.5% of Americans identify as Swifties (Harris Poll).
# • Claim B The average amount of time a student spends procrastinating is 2 hrs/day.

###############################################################################
# Problem I
# Problem I will focus on assessing Claim A using the Swiftie variable.
###############################################################################

# (a) Create a table of the Swiftie variable.
Getting2NoU <- read.csv("https://raw.githubusercontent.com/Talha-Hamza/STAT3011-015-F25/refs/heads/main/Getting2NoU.csv", header = TRUE)
Swiftie <- Getting2NoU$Swiftie
table(Swiftie)

# (b) Combine “I am not sure” and “No” categories into one non-Swiftie group.
Swiftie_new <- ifelse(Swiftie == "Yes", "Yes", "No")
table(Swiftie_new)

# (c) What are the assumptions for conducting this hypothesis test? Are they met in this case?
x <- sum(Swiftie_new == "Yes")  # 51
n <- length(Swiftie_new)        # 335
p0 <- 0.125

n*p0
n*(1-p0)
# Both expected success and expected failures are greater than or equal to 15, so yes the
# statistical assumptions are met in this case

# (d) Let p denote the true proportion of Americans who are Swifties. Write the null and alternative
#     hypotheses to test Claim A at α = 0.05

# H0: p = 0.125
# Ha: p != 0.125

# (e) Test statistic
phat <- x/n
se <- sqrt(p0*(1-p0)/n)
T_stat <- (phat - p0) / se
T_stat

# (f) p-value and conclusion at α = 0.05
p_value <- 2 * pnorm(T_stat, lower.tail = FALSE)
p_value

# Conclusion: if p_value > 0.05 → Fail to reject H0
if(p_value > 0.05) "Fail to reject H0" else "Reject H0"

# (g) Conclusion statement:
# We do not have enough evidence that the true proportion of Swifties is different from 12.5%

# (h) Repeat using prop.test()
prop.test(x = x, n = n, p = p0, alternative = "two.sided",
          conf.level = 0.95, correct = FALSE)

# (i) Type of possible error:
# Since we failed to reject H0, we may have committed a Type II error.

# (j) Construct 95% CI using phat
z <- qnorm(1-0.05/2)
CI <- phat + c(-1, 1)*z*sqrt(phat*(1-phat)/n)
CI

# Note: CI and Hypothesis Test do not align perfectly due to different standard errors.

###############################################################
# Problem II — Testing Claim B using procrastinate variable
###############################################################

# a.
# Let μ denote the average amount of time UofM students spend procrastinating each day. 
# There are several missing values in this variable. 
# Test Claim B at α = 0.01. List all five steps

# Clean missing responses:
df <- na.omit(Getting2NoU)
procrastinate <- df$procrastinate

# Step 1: Assumptions
# 1. Random sample - this was given in the beginning of the problem.\n")
# 2. sample size n2 > 30 (228)
length(procrastinate)

# Step 2: Hypothesis
# H0: u = 2
# Ha: u != 2

# Step 3: Find the test-statistic
mu0 <- 2
xbar <- mean(procrastinate)
s <- sd(procrastinate)
n2 <- length(procrastinate)

t_stat <- (xbar - mu0) / (s / sqrt(n2))
t_stat

# Step 4: Find the p-value
p_value2 <- 2 * pt(abs(t_stat), df = n2 - 1, lower.tail = FALSE)
p_value2

# Step 5: Conclusion
if(p_value2 < 0.01) "Reject H0" else "Fail to reject H0"
#  Since the p-value < a, we have found statistically significant evidence, 
# that the true avergane time UofM students procrastinate is different from 2

# (b) Repeat using t.test()
t.test(procrastinate, mu = 2, conf.level = 0.99, alternative = "two.sided")


# (c) Type of possible error:
# Since we rejected H0, we could have committed a Type I error.

# (d) Construct 99% CI
# Can you use this confidence interval to draw a conclusion for the hypothesis test
CI2 <- xbar + c(-1, 1)*qt(1-0.01/2, df = n2 - 1)*s/sqrt(n2)
CI2

# Yes, since the SE for CI is the same as SE for Hypothesis test, the results are comparable.
# Since the 99% CI does not contain 2, we reject H0 and accept the Ha.


###############################################################
# Problem III — Interpretation (no calculations needed)
###############################################################
# Answers done on board

###############################################################
# Problem IV — Extra Practice p-values
###############################################################

# (a) H0: p = p0, Ha: p > p0 ; Test statistic = 2.7 ; n = 100
pnorm(2.7, lower.tail = FALSE)

# (b) H0: p = p0, Ha: p > p0 ; Test statistic = -2.7 ; n = 100
pnorm(-2.7, lower.tail = FALSE)

# (c) Two-sided: Test statistic = 0.75 ; n = 100
2 * pnorm(0.75, lower.tail = FALSE)

# (d) H0: μ = μ0 vs Ha != μ0 ; Test statistic = -1 ; df = 99
2 * pt(-1, df = 99)

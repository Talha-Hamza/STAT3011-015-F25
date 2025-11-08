# Date: Week 5: Sept 30 or Oct 2, 2025
# Fall 2025

# -----------------------------------------------------------------------------
# Problem 1
# Suppose X is continuous normal and X ~ N(1, 2).
# NOTE: here we interpret N(mean, variance) so standard deviation = 2 and mean = 1

# a) P(X < 1.64)
z_a <- (1.64 -1)/2
pnorm(z_a) # 0.6255158

pnorm(1.64, mean = 1, sd = 2)
# ---------------------
# b) P(X > 1.28)
z_b <- (1.28 - 1)/2
pnorm(z_b, lower.tail = FALSE)

pnorm(1.28, mean = 1, sd = 2, lower.tail = FALSE)
# ---------------------
# c) P(1.28 < X < 1.64)
pnorm(z_a) - pnorm(z_b) # 0.06984583

# ---------------------
# d) The 60th percentile of this normal distribution
qnorm(0.60, mean = 1, sd = 2) # 1.506694

# ------------------------------------------------------------------------------
# Problem 2
# Suppose X ~ Bin(n = 20, p = 0.6)

# a) P(X = 15) = 
choose(20,15) * 0.6^15 * 0.4^5 # 0.07464702
dbinom(15, 20, 0.6) # 0.07464702

# b) P(X <= 5)
pbinom(5, size = 20, prob = 0.6) # 0.001611525

# c) P(X >= 15) 
1- pbinom(14, size = 20, prob = 0.6) # 0.125599

# d) P(5 < X < 15) 
pbinom(14, size = 20, prob = 0.6) - pbinom(5, size = 20, prob = 0.6)
# 0.8727895

# ------------------------------------------------------------------------------
# R Problem
# Download Heights.csv from Canvas and set the pat.

# a) Do mothers’ heights follow a normal distribution? Use histogram and QQ-plot.
# (Same for daughters)

heights<-read.csv("https://raw.githubusercontent.com/Talha-Hamza/STAT3011-015-F25/refs/heads/main/week%205/Heights%20(5).csv", header = TRUE)

hist(heights$mheight, main = "Histogram for mothers' heights", xlab = "Height (inches)")
qqnorm(heights$mheight)
qqline(heights$mheight)


hist(heights$dheight, main = "Histogram for daughters' heights", xlab = "Height (inches)")
qqnorm(heights$dheight)
qqline(heights$dheight)

# b) Let Y = mother's height, X = daughter's height.
# Use sample mean and sd as estimates for mu and sigma.
# Specify the distribution of Y and X
mean(heights$mheight) # 62.4528
sd(heights$mheight) # 2.335

mean(heights$dheight) # 63.75
sd(heights$dheight) # 2.6

# Specify distributions:
# ANSWER:
# X (daughter) ~ Normal(mean = 63.75, sd = 2.6)
# Y (mother)  ~ Normal(mean = 62.45, sd = 2.335)

# c) Suppose mother = 64.45 in, daughter = 65.75 in. Who is relatively taller?
# After computing means/sds above:
m_z = (64.45 - 62.45) / 2.335
d_z = (65.75 - 63.75) / 2.6
# Since m_z > d_z the mother is relatively taller

# d) What is the probability that an English mother is taller than 63 inches?
pnorm(63, mean = 62.45, sd = 2.36, lower.tail = FALSE)
# ANSWER: 0.408
# e) Smallest height to be in the top 5% of mothers' heights:
qnorm(0.95, mean = 62.45, sd = 2.36)
# ANSWER: 66.3266
# ------------------------------------------------------------------------------
# HW Problem (Comcast streaming)

# According to Comcast, 86% of all U.S. households subscribe to a streaming service. Let X = the number
# of households that subscribe to a streaming service in a random sample of 20 selected households,
# X ∼ binom(n = 20, p = 0.86)

# a) exactly 15 households subscribe:
dbinom(15,  size = 20, prob = 0.86) # 0.08680819

# b) more than 18 households subscribe (P(X > 18))
dbinom(19,  size = 20, prob = 0.86) + dbinom(20,  size = 20, prob = 0.86)
# 0.2084259
1 - pbinom(18,  size = 20, prob = 0.86)

# c) at most 18 households subscribe (P(X <= 18))
pbinom(18,  size = 20, prob = 0.86) # 0.7915741


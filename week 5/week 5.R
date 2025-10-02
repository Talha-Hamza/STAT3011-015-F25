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

heights<-read.csv(file.choose(), header = TRUE)

# b) Let Y = mother's height, X = daughter's height.
# Use sample mean and sd as estimates for mu and sigma.
# Specify the distribution of Y and X

# Specify distributions:
# ANSWER:
# X (daughter) ~ Normal(mean = ___, sd = ___)
# Y (mother)  ~ Normal(mean = ___, sd = ___)

# c) Suppose mother = 64.45 in, daughter = 65.75 in. Who is relatively taller?
# After computing means/sds above:

# d) What is the probability that an English mother is taller than 63 inches?

# e) Smallest height to be in the top 5% of mothers' heights:

# ------------------------------------------------------------------------------
# HW Problem (Comcast streaming)

# According to Comcast, 86% of all U.S. households subscribe to a streaming service. Let X = the number
# of households that subscribe to a streaming service in a random sample of 20 selected households,
# X ∼ binom(n = 20, p = 0.86)

# a) exactly 15 households subscribe:


# b) more than 18 households subscribe (P(X > 18))

# c) at most 18 households subscribe (P(X <= 18))


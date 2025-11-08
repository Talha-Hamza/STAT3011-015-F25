# STAT 3011 Lab 3 (Date: Week 3: September 18, 2025) Fall 2025 

# Exercise 3:

# Download the tornadoes.csv dataset from Canvas 
# and use it to answer the following questions:
tor <- read.csv(file.choose(), header = TRUE)


# a.) Generate a cross tabulation of Sig by Area using the table() command. 
# Change the order of Sig and Area in the table() command.
# Which table do you like better

table(tor$Sig, tor$Area)
table(tor$Area, tor$Sig)

#b.) use the addmargins() command to obtain the overall sums

table_result <- table(tor$Sig, tor$Area)
addmargins(table_result)

#c.) For a randomly selected tornado 
# what is the possible outcomes (sample space) for Sig? 
# Answer: {TRUE, FALSE}

# What about for Area?
# Answer :{C, E, NE, NW, S, SE, W}

#d.) Estimate the probability that a Minnesota tornado made the touchdown in East Central Minnesota 
# and was significant.

# Pr (E ∩ T) = 31/1363 
31/1363

#e.) Let E and T denote the events that the tornado made the touchdown in East Central Minnesota 
# and that the tornado is a significant tornado, respectively. 
# Use the data above to estimate the probabilities Pr(E) and Pr(T).

# Pr(E)
127/1363 # = 0.093

# Pr(T)
237/1363 # = 0.17388

#f.) Estimate the probability that a Minnesota tornado made the touchdown in East Central Minnesota 
# or was significant (or both)

#Pr(E ∪ T) = Pr(E) + Pr(T) - Pr (E ∩ T)
0.093 + 0.17388 - (31/1363)

#g.) Are events E and T independent?
# IF independent, the Pr(R ∩ T) = Pr(E) * Pr(T)
(127/1363) * (237/1363) # calculated
31/1363 # From the table

# Since Pr(E ∩ T) is not equal to Pr(E) * Pr(T), NOT INDEPENDENT

#h.) Are events E and T disjoint?
# NO, because is they were disjoint Pr(R ∩ T) would be 0. 


# i.) Estimate the probability that a Minnesota tornado was significant given 
# that it had made the touch down in East Central Minnesota. 


#  Pr(T|E) = Pr(T∩E) / Pr(E)
(31/1363) / (127/1363) # 0.244

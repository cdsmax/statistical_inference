# Data from W.S. Gosset's 1908 paper on the t-test.
# Two different sleeping drugs were taken by two groups of patients.
# The variable "extra" is the increase in hours of sleep on the groups 
# (consisting of 10 patients each).
# The variable "group" gives the labels for which drug each patient took.
data(sleep)

# get the increase of sleep hours for each of 2 groups
g1 <- sleep$extra[1:10]
g2 <- sleep$extra[11:20]

# get the difference between the 2 groups
difference <- g2 - g1

# compute the expected values of the difference
mn <- mean(difference)
s <- sd(difference)

# our group size, ie degrees of freedom
n <- 10

# the T-Interval computation from scratch, just the formula
# estimate +- tQuantile * StrandardError
mn + c(-1, 1) * qt(0.975, n-1) * s / sqrt(n)

# the T-Interval computation using R function, and get more details in output
# all 3 methods are the same
t.test(difference)
t.test(g2, g1, paired=TRUE)
t.test(extra ~ I(relevel(group, 2)), paired=TRUE, data=sleep)

#################################################################

# In a study of emergency room waiting times, 
# investigators consider a new and the standard triage systems. 
# To test the systems, administrators selected 20 nights 
# and randomly assigned the new triage system 
# to be used on 10 nights and the standard system on the remaining 10 nights. 
# They calculated the nightly median waiting time (MWT) to see a physician. 
# The average MWT for the new system was 3 hours with a variance of 0.60 
# while the average MWT for the old system was 5 hours with a variance of 0.68. 
# Consider the 95% confidence interval estimate for the differences of the mean MWT associated with the new system. 
# Assume a constant variance. 
# What is the interval? 
# Subtract in this order (New System - Old System).

# New System
n_oc <- 10 # number of subjects
x_oc <- 3 # mean
s_oc <- sqrt(0.60) # standard deviation

# Old System
n_c <- 10 # subjects
x_c <- 5 # mean
s_c <- sqrt(0.68) # standard deviation

# degrees of freedom
# (n1 + n2 + ... + ni) - i
freedom <- n_oc + n_c - 2

# pooled standard deviation estimate
sp <- sqrt( ((n_oc - 1) * s_oc^2 + (n_c - 1) * s_c^2) / freedom )

# standard error of the difference
stderr <- sp * (1/n_oc + 1/n_c)^0.5

# the t intervals
t <- x_oc - x_c + c(-1, 1) * qt(0.975, freedom) * stderr

#################################################################

# Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. 
# Subjects body mass indices (BMIs) were measured at a baseline 
# and again after having received the treatment or placebo for four weeks. 
# The average difference from follow-up to the baseline (followup - baseline) 
# was -3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. 
# The corresponding standard deviations of the differences 
# was 1.5 kg/m2 for the treatment group 
# and 1.8 kg/m2 for the placebo group. 
# Does the change in BMI over the four week period 
# appear to differ between the treated and placebo groups? 
# Assuming normality of the underlying data and a common population variance, 
# calculate the relevant *90%* t confidence interval. 
# Subtract in the order of (Treated - Placebo) with the smaller (more negative) number first.

# Treated
n_oc <- 9 # number of subjects
x_oc <- -3 # mean
s_oc <- 1.5 # standard deviation

# Placebo
n_c <- 9 # subjects
x_c <- 1 # mean
s_c <- 1.8 # standard deviation

# degrees of freedom
# (n1 + n2 + ... + ni) - i
freedom <- n_oc + n_c - 2

# pooled standard deviation estimate
sp <- sqrt( ((n_oc - 1) * s_oc^2 + (n_c - 1) * s_c^2) / freedom )

# standard error of the difference
stderr <- sp * (1/n_oc + 1/n_c)^0.5

# the t intervals -- notice the qt() calculation, 
# it is no longer 97.5 which would have given then 95% confidence
# 90% of data falls into 95th quantile?...
t <- x_oc - x_c + c(-1, 1) * qt(0.95, freedom) * stderr

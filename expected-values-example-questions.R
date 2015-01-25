# common questions for expected values

# Suppose that the number of web hits to a particular site 
# are approximately normally distributed 
# with a mean of 100 hits per day and 
# a standard deviation of 10 hits per day. 
# What's the probability that 
# a given day has fewer than 93 hits per day 
#expressed as a percentage to the nearest percentage point?
round(pnorm(93, mean = 100, sd = 10) * 100)

# What number of web hits per day represents 
# the number so that only 5% of days have more hits? 
# Express your answer to 3 decimal places.
round(qnorm(.05, mean = 100, sd = 10, lower.tail = FALSE), 3)

# Imagine taking a random sample of 50 days. 
# What number of web hits would be the point 
# so that only 5% of averages of 50 days of web traffic have more hits? 
# Express your answer to 3 decimal places. 
round(qnorm(.05, mean = 100, sd = 10 / sqrt(50), lower.tail = FALSE), 3)

#################################################################

# Suppose that diastolic blood pressures (DBPs) for men aged 35-44 
# are normally distributed with a mean of 80 (mm Hg) 
# and a standard deviation of 10. 
# About what is the probability that a random 35-44 year old has a DBP less than 70?
pnorm(70, mean = 80, sd = 10)

#################################################################

# Brain volume for adult women is normally distributed 
# with a mean of about 1,100 cc for women 
# with a standard deviation of 75 cc. 
# What brain volume represents the 95th percentile?
qnorm(0.95, mean = 1100, sd = 75)

# Brain volume for adult women is about 1,100 cc for women 
# with a standard deviation of 75 cc. 
# Consider the sample mean of 100 random adult women from this population. 
# What is the 95th percentile of the distribution of that sample mean?
qnorm(0.95, mean = 1100, sd = 75/sqrt(100)) # sd is for sample size

#################################################################

# You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?
pbinom(3, size = 5, prob = 0.5, lower.tail = FALSE) # args caveat: 3 and lower.tail=FALSE means 4 and 5 are actually used

#################################################################

# You don't believe that your friend 
# can discern good wine from cheap. 
# Assuming that you're right, in a blind test 
# where you randomize 6 paired varieties of cheap and expensive wines 
# what is the change that she gets 5 or 6 right expressed as a percentage to one decimal place?
round(pbinom(4, prob = .5, size = 6, lower.tail = FALSE) * 100, 1)

#################################################################

# The respiratory disturbance index (RDI), a measure of sleep disturbance, 
# for a specific population has a mean of 15 (sleep events per hour) 
# and a standard deviation of 10. 
# They are not normally distributed. 
# Give your best estimate of the probability 
# that a sample mean RDI of 100 people is between 14 and 16 events per hour?
pnorm(16, mean = 15, sd = 1) - pnorm(14, mean = 15, sd = 1)
# ANSWER: The standard error of the mean is 10/sqrt(100) = 1. 
# Thus between 14 and 16 is with one standard deviation of the mean of the distribution of the sample mean. 
# Thus it should be about 68%.

#################################################################

# The number of people showing up at a bus stop is assumed to be 
# Poisson with a mean of 5 people per hour. 
# You watch the bus stop for 3 hours. 
# About what's the probability of viewing 10 or fewer people?
ppois(10, lambda = 5 * 3)

#################################################################

# The number of web hits to a site is Poisson with mean 16.5 per day. 
# What is the probability of getting 20 or fewer in 2 days 
# expressed as a percentage to one decimal place?
round(ppois(20, lambda = 16.5 * 2) * 100, 1)


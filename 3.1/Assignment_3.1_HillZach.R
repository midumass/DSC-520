# Assignment: Assignment 3.1 DSC 520
# Name: Hill, Zach
# Date: 30MAR2019

library(ggplot2)
library(readr)
library(pastecs)

# 1) Document the elements in your data including the categories and data types.

acs_csv <- read_csv("acs-14-1yr-s0201.csv")
# Id                    : chr : qualitative, nominal
# Id2                   : num : qualitative, nominal
# Geography             : chr : qualitative, nominal
# PopGroupID            : num : qualitative, nominal, irrelevant
# POPGROUP.display-label: chr : qualitative, nominal, irrelevant
# RacesReported         : num : quantitative, continuous
# HSDegree              : num : quantitative, interval
# BachDegree            : num : quantitative, interval

# 2) Report the output from at least the following functions: str(); nrow(); ncol()

str(acs_csv)
nrow(acs_csv)
ncol(acs_csv)
head(acs_csv)
#View(acs_csv)
acs_median <- median(acs_csv$HSDegree)
acs_mean <- mean(acs_csv$HSDegree)
acs_sd <- sd(acs_csv$HSDegree)
acs_median_b <- median(acs_csv$BachDegree)
acs_mean_b <- mean(acs_csv$BachDegree)
acs_sd_b <- sd(acs_csv$BachDegree)

# 3) Create a Histogram of the HSDegree variable using the ggplot2 package. Set a bin size for the Histogram.

plot_1 <- ggplot(acs_csv, aes(x = HSDegree)) + geom_histogram(aes(y = ..density..), binwidth = 3)
plot_1

# Include a Title and appropriate X/Y axis labels on your Histogram Plot.

plot_2 <- plot_1 + labs(title = "Histogram of High School Degrees Earners by County", x = "% with High School Degree", y = "Density of Counties")
plot_2

# Answer the following questions based on the Histogram produced:
#   Based on what you see in this histogram, is the data distribution unimodal?
# Yes, there is only one peak

#   Is it approximately symmetrical? 
# No

#   Is it approximately bell-shaped? 
# No, skewed left

#   Is it approximately normal?        
# No, skewed left

#   If not normal, is the distribution skewed? If so, in which direction?
#   Provide specifics in your responses.
# This histogram is skewed left because the mean is smaller than the median and the tail is to the right. 

# Include a normal curve to the Histogram that you plotted.

plot_3 <- plot_2 + stat_function(fun = dnorm, args = list(mean = acs_mean, sd = acs_sd))
plot_3

# Explain whether a normal distribution can accurately be used as a model for this data. 

# No, with more bins the data shows a picture that doesn't reflect a normal distribution


# Create a Probability Plot of the HSDegree variable.

ggplot(acs_csv, aes(sample = acs_csv$HSDegree)) + stat_qq()


# Answer the following questions based on the Probability Plot:

# Based on what you see in this probability plot, is the distribution
# approximately normal? Explain how you know. 

# The distribution is not normal. The arc curves upward indicating the data are skewed left.

# If not normal, is the distribution skewed? If so, in which direction? Explain how you know.

# The arc curves upward indicating the data are skewed left.


# Now that you have looked at this data visually for normality, you will now
# quantify normality with numbers using the stat.desc() function. Include a
# screen capture of the results produced. 
stat.desc(acs_csv$HSDegree)
# 
# nbr.val     nbr.null       nbr.na          min          max        range          sum       median         mean      SE.mean CI.mean.0.95 
# 1.360000e+02 0.000000e+00 0.000000e+00 6.220000e+01 9.550000e+01 3.330000e+01 1.191800e+04 8.870000e+01 8.763235e+01 4.388598e-01 8.679296e-01 
# var      std.dev     coef.var 
# 2.619332e+01 5.117941e+00 5.840241e-02 

# In several sentences provide an explanation of the result produced for skew,
# kurtosis, and z-scores. In addition, explain how a change in the sample size
# may change your explanation?


# Repeat steps 3 through 9 for the BachDegree variable.
# Create a Histogram of the HSDegree variable using the ggplot2 package. Set a bin size for the Histogram.

plot_1b <- ggplot(acs_csv, aes(x = BachDegree)) + geom_histogram(aes(y = ..density..), binwidth = 5)
plot_1b

# Include a Title and appropriate X/Y axis labels on your Histogram Plot.

plot_2b <- plot_1b + labs(title = "Histogram of Bachelor's Degrees Earners by County", x = "% with Bachelor's Degree", y = "Density of Counties")
plot_2b

# Answer the following questions based on the Histogram produced:
#   Based on what you see in this histogram, is the data distribution unimodal?
# Yes, there is only one peak


#   Is it approximately symmetrical? 
# No


#   Is it approximately bell-shaped? 
# No, skewed right, slightly


#   Is it approximately normal?        
# No, skewed right, slightly


#   If not normal, is the distribution skewed? If so, in which direction?
#   Provide specifics in your responses.
# This histogram is skewed right because the mean is larger than the median and the tail is to the left. 

# Include a normal curve to the Histogram that you plotted.

plot_3b <- plot_2b + stat_function(fun = dnorm, args = list(mean = acs_mean_b, sd = acs_sd_b))
plot_3b

# Explain whether a normal distribution can accurately be used as a model for this data. 
# No because its skewed right. It is very close, however.


# Create a Probability Plot of the HSDegree variable.
# ggdistribution(dnorm, seq(-1, 1, 0.1), mean = mean(acs_csv$HSDegree), sd = sd(acs_csv$HSDegree))
ggplot(acs_csv, aes(sample = acs_csv$BachDegree)) + stat_qq()


# Answer the following questions based on the Probability Plot:

# Based on what you see in this probability plot, is the distribution
# approximately normal? Explain how you know. 
# This appears to be a normal probability plot because it forms very close to a straight line


# If not normal, is the distribution skewed? If so, in which direction? Explain how you know.


# Now that you have looked at this data visually for normality, you will now
# quantify normality with numbers using the stat.desc() function. Include a
# screen capture of the results produced. 
stat.desc(acs_csv$BachDegree)
# 
# nbr.val     nbr.null       nbr.na          min          max        range          sum       median         mean      SE.mean CI.mean.0.95 
# 136.0000000    0.0000000    0.0000000   15.4000000   60.3000000   44.9000000 4822.7000000   34.1000000   35.4610294    0.8154527    1.6127146 
# var      std.dev     coef.var 
# 90.4349886    9.5097313    0.2681741

# In several sentences provide an explanation of the result produced for skew,
# kurtosis, and z-scores. In addition, explain how a change in the sample size
# may change your explanation?


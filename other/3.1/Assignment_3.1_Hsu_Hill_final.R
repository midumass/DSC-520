# Assignment 3.1: 2014 American Community Survey
# Name: Zachary Hill and Alan Hsu
# Date: 31 Mar 2019

# setwd("~\\GitHub\\School\\DSC-520")
input_filename = "acs-14-1yr-s0201.csv"
survey <- read.csv(input_filename)
library(ggplot2) # used for plotting
library(pastecs) # used for descriptive statistics

# 1. Document the elements in your data including the categories and data types.
# Categories (data types): ID (Factor), ID2 (int), Geography (Factor), PopGroupID (int), POPGROUP.display.label (Factor), RacesReported (int), HSDegree (num), BachDegree (num)

# 2. Report the output from at least the following functions: str(); nrow(); ncol()
str(survey)
# 'data.frame':	136 obs. of  8 variables:
#     $ Id                    : Factor w/ 136 levels "0500000US01073",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
# $ Geography             : Factor w/ 136 levels "Alameda County, California",..: 56 70 98 1 20 43 62 68 92 106 ...
# $ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
# $ POPGROUP.display.label: Factor w/ 1 level "Total population": 1 1 1 1 1 1 1 1 1 1 ...
# $ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
# $ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
# $ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...

nrow(survey)
# [1] 136

ncol(survey)
# [1] 8

# HSDegree calculations
# 3. Create a Histogram of the HSDegree variable using the ggplot2 package. Set a bin size for the Histogram.
hs_plot <- ggplot(data=survey, aes(x=HSDegree))
hs_plot_1 <- hs_plot + geom_histogram(aes(y=..density..), binwidth=3)
hs_plot_1

# 4. Include a Title and appropriate X/Y axis labels on your Histogram Plot.
hs_plot_2 <- hs_plot_1 + labs(title='Histogram of High School Degree Earners by County', x='% of Population', y='Density of Counties')
hs_plot_2

# 5. Answer the following questions based on the Histogram produced:
# a. Based on what you see in this histogram, is the data distribution unimodal?
# Yes, the data distribution is unimodal.

# b. Is it approximately symmetrical?
# No, it is not approximately symmetrical.

# c. Is it approximately bell-shaped?
# No, it is not approximately bell-shaped.

# d. Is it approximately normal?
# No, it is not approximately normal.

# e. If not normal, is the distribution skewed? If so, in which direction? Provide specifics in your responses.
# Yes, the distribution is skewed to the left because the mean is smaller than the median and the tail is to the right. A normal distribution would have both sides of the mean/mode/median be relatively equal. But there are more data points to the left of the mode (which is around 90%).

# f. Include a normal curve to the Histogram that you plotted.
hs_plot_3 <- hs_plot_2 + stat_function(fun = dnorm, args = list(mean = acs_mean, sd = acs_sd))
hs_plot_3

# g. Explain whether a normal distribution can accurately be used as a model for this data.
# No, a normal distribution cannot be accurately used as a model. By using unequal bins, it would be possible but it wouldn't be an accurate description of the data.


# 6. Create a Probability Plot of the HSDegree variable.
ggplot(survey, aes(sample = survey$HSDegree)) + stat_qq()

# 7. Answer the following questions based on the Probability Plot:
# a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# The distribution is not normal. A normal distribution would have a straight line. THe arc curves indicate that it's not normal. 

# b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Yes, the distribution is skewed. The arc curves upward indicating the data is skewed left.

# 8. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
stat.desc(survey['HSDegree'])

# 9. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
# The results showcase a negative skew and is revealed because the median and mean are closer in value to the maximum values. A normal distribution would have these values closer to the center of the minimum and maximum. 
# The results show that the kurtosis is a leptokurtic distribution. This is signified by a high value of the standard deviation and variance. The high standard deviation means that there are many values that are occurring away from the mean (or the tails) which means that the graph would be very pointy at the peak. 
# The z-scores utilize the mean and standard deviation. Since the mean and standard deviation are close in value, the calculated z-scores for the different points would show that the probability of those values would demonstrate the skew and kurtosis of the dataset.
# A change in sample size may normalize the data to be more centered. But it would require more scores to be to the left of the median and mean in order to normalize the dataset. However, given that there are already ~130 observations, I doubt that a larger sample size would largely affect it. 



#######################################
# BachDegree calculations
# 3. Create a Histogram of the BachDegree variable using the ggplot2 package. Set a bin size for the Histogram.
bach_plot <- ggplot(data=survey, aes(x=BachDegree))
bach_plot_1 <- bach_plot + geom_histogram(aes(y=..density..), binwidth=5)
bach_plot_1


# 4. Include a Title and appropriate X/Y axis labels on your Histogram Plot.
bach_plot_2 <- bach_plot_1 + labs(title='Histogram of Bachelor Degree Earners by County', x='% of Population', y='Density of Counties')
bach_plot_2

# 5. Answer the following questions based on the Histogram produced:
# a. Based on what you see in this histogram, is the data distribution unimodal?
# Yes, the data distribution is unimodal.

# b. Is it approximately symmetrical?
# No, it is not approximately symmetrical.

# c. Is it approximately bell-shaped?
# No, it is not approximately bell-shaped.

# d. Is it approximately normal?
# No, it is not approximately normal but it is close.

# e. If not normal, is the distribution skewed? If so, in which direction? Provide specifics in your responses.
# The distribution is slightly skewed to the right. It is more normalized than the HS Degree data, but there is still an unequal balance of the data points. 

# f. Include a normal curve to the Histogram that you plotted.
bach_plot_3 <- bach_plot_2 + stat_function(fun = dnorm, args = list(mean = acs_mean_b, sd = acs_sd_b))
bach_plot_3

# g. Explain whether a normal distribution can accurately be used as a model for this data.
# No, a normal distribution cannot be accurately used as a model. There are still a lot of data points in the tails, the sharp peak, and the asymmetry is enough to show that a normal distribution would be an inaccurate representation of the data. 

# 6. Create a Probability Plot of the BachDegree variable.
ggplot(survey, aes(sample = survey$BachDegree)) + stat_qq()

# 7. Answer the following questions based on the Probability Plot:
# a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# Based on the probability plot, this appears to be a normal distribution because it forms very close to a straight line

# b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Based on the probability plot, its normal or too close to distinguish

# 8. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
stat.desc(survey['BachDegree'])

# 9. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
# The results showcase a positive skew due to the median and mean both being less than the midpoint between the minimum and maximum. 
# The results show that the kurtosis is a leptokurtic distribution. This is signified by a high value of the standard deviation and variance. The high standard deviation means that there are many values that are occurring away from the mean (or the tails) which means that the graph would be very pointy at the peak. 
# The z-scores utilize the mean and standard deviation. The calculated z-scores for the different points would show that the probability of those values would demonstrate the skew and kurtosis of the dataset.
# A change in sample size may normalize the data to be more centered. Depending on the samples collected or removed, the distribution could be more normalized. 

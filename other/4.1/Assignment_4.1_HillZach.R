# Assignment: Assignment 4.1 DSC 520
# Name: Hill, Zach
# Date: 01APR2019

library(rmarkdown)
library(knitr)
library(ggplot2)
library(readr)
library(pastecs)
library(car)
library(psych) 

# The original dataset had trailing tabs creating a 7th column of NA.
# The below command will read the uncleaned file and assign it to the
# exams dataframe without that column.

#exams <- subset(read_tsv('Exams.dat'), select = -c(X7))

# I chose to remove the trailing tab in the .dat file prior to reading
# it so the 7th column was never created allowing me to use a much 
# simpler syntax.

exams <- read_tsv('Exams.dat')

exams$stats <- as.numeric(exams$stats, levels = c(0:4), labels = c("A", "B", "C", "D", "F"))
exams$uni <- factor(exams$uni, levels = c(0:2), labels = c("George", "Jeff", "Tushmann"))

# Commented out because they are unnecessary in the final project but
# useful for troubleshooting and verifying data

#View(exams)
str(exams) 
stat.desc(exams)

# Build histograms for all data
ggplot(exams, aes(exam)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$exam), sd = sd(exams$exam)), colour = "black", size =1)

ggplot(exams, aes(computer)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 3) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$computer), sd = sd(exams$computer)), colour = "black", size =1)

ggplot(exams, aes(lectures)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$lectures), sd = sd(exams$lectures)), colour = "black", size =1)

ggplot(exams, aes(numeracy)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 1) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$numeracy), sd = sd(exams$numeracy)), colour = "black", size =1)

ggplot(exams, aes(stats)) +
  geom_histogram(aes(y = ..count.., fill = uni), binwidth = 1)

# Breakdown statistics by professor
by(exams, exams$uni, describe)

# Subset by professor for building histograms
georgeData <- subset(exams, exams$uni == "George")
jeffData <- subset(exams, exams$uni == "Jeff")
tushmannData <- subset(exams, exams$uni == "Tushmann")

# Build histograms by professor with normalized curve to compare to all students
ggplot(georgeData, aes(exam)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$exam), sd = sd(exams$exam)), colour = "black", size =1)

ggplot(georgeData, aes(computer)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 3) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$computer), sd = sd(exams$computer)), colour = "black", size =1)

ggplot(georgeData, aes(lectures)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$lectures), sd = sd(exams$lectures)), colour = "black", size =1)

ggplot(georgeData, aes(numeracy)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 1) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$numeracy), sd = sd(exams$numeracy)), colour = "black", size =1)

ggplot(georgeData, aes(stats)) +
  geom_histogram(aes(y = ..count.., fill = uni), binwidth = 1)


#Plots for professor Jeff

ggplot(jeffData, aes(exam)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$exam), sd = sd(exams$exam)), colour = "black", size =1)

ggplot(jeffData, aes(computer)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 3) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$computer), sd = sd(exams$computer)), colour = "black", size =1)

ggplot(jeffData, aes(lectures)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$lectures), sd = sd(exams$lectures)), colour = "black", size =1)

ggplot(jeffData, aes(numeracy)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 1) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$numeracy), sd = sd(exams$numeracy)), colour = "black", size =1)

ggplot(jeffData, aes(stats)) +
  geom_histogram(aes(y = ..count.., fill = uni), binwidth = 1)


#Plots for professor Tushmann

ggplot(tushmannData, aes(exam)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$exam), sd = sd(exams$exam)), colour = "black", size =1)

ggplot(tushmannData, aes(computer)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 3) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$computer), sd = sd(exams$computer)), colour = "black", size =1)

ggplot(tushmannData, aes(lectures)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 5) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$lectures), sd = sd(exams$lectures)), colour = "black", size =1)

ggplot(tushmannData, aes(numeracy)) +
  geom_histogram(aes(y = ..density.., fill = uni), binwidth = 1) +
  stat_function(fun = dnorm, args = list(mean = mean(exams$numeracy), sd = sd(exams$numeracy)), colour = "black", size =1)

ggplot(tushmannData, aes(stats)) +
  geom_histogram(aes(y = ..count.., fill = uni), binwidth = 1)
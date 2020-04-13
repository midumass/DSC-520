library(readr)
library(knitr)
library(kableExtra)
library(dplyr)

survey <- read_csv("./student-survey.csv")

str(survey)

cov(survey$TimeReading, survey$TimeTV)
cov(survey$TimeReading, survey$Happiness)
cov(survey$TimeReading, survey$Gender)
cov(survey$TimeTV, survey$Happiness)
cov(survey$TimeTV, survey$Gender)
cov(survey$Happiness, survey$Gender)
cov(survey$TimeReading, survey$TimeReading)
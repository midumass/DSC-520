
library(readr)
library(knitr)
library(kableExtra)
library(dplyr)
library(ggplot2)

survey <- read_csv('./gss-2016.csv')
childs <- survey$CHILDS
sibs <- survey$SIBS
sex <- survey$SEX


childs_hist <- hist(childs, breaks = seq(0,8,1), ax = axes[0])
sibs_hist <- hist(sibs, breaks = seq(0,43,1), ax = axes[1])




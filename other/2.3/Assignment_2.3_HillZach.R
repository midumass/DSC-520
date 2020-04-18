# Assignment: Assignment 2.3 DSC 520
# Name: Hill, Zach
# Date: 24MAR2019

library(readr)

# Choose one of the Weather datasets [AKWeather or NEWeather] to use for this activity.

my_data <- read_csv('akweather.csv')

# What categories/variables of data do you have in your Weather dataset?

colnames(my_data)
# [1] "STATION" "NAME"    "DATE"    "TMAX"    "TMIN"   

# Use the following R functions: View(); str(); nrow(); ncol() to investigate
# the dataset you are working with. Report the output from each function and
# provide a brief explanation of the output.  Remember the following resources,
# outside of R Studio can be used for additional help:
# Google – Just add R to the end of your search criteria
# R Bloggers - https://www.r-bloggers.com/

View(my_data)

# Explanation: Creates a spreadsheet-style view of the data (see tabs)

str(my_data)

# Classes ‘spec_tbl_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	729 obs. of  5 variables:
#   $ STATION: chr  "USW00026533" "USW00026533" "USW00026533" "USW00026533" ...
# $ NAME   : chr  "BETTLES AIRPORT, AK US" "BETTLES AIRPORT, AK US" "BETTLES AIRPORT, AK US" "BETTLES AIRPORT, AK US" ...
# $ DATE   : Date, format: "2016-03-01" "2016-03-02" "2016-03-03" "2016-03-04" ...
# $ TMAX   : num  29 23 19 25 22 21 19 20 23 23 ...
# $ TMIN   : num  3 -1 2 14 -1 -6 -15 -14 -7 -1 ...
# - attr(*, "spec")=
#   .. cols(
#     ..   STATION = col_character(),
#     ..   NAME = col_character(),
#     ..   DATE = col_date(format = ""),
#     ..   TMAX = col_double(),
#     ..   TMIN = col_double()
#     .. )

# Explanation: Shows the structure of the element and the relevant classes

nrow(my_data)

# [1] 729

# Explanation: Number of rows in the dataframe 

ncol(my_data)

# [1] 5

# Explanation: Number of columns in the dataframe

# For the Weather dataset you chose, what levels of measurement are included? 

# STATION and NAME are nominal as they are just names assigned to the variables
# TMAX and TMIN are interval levels of measure as they can be sorted and 
# math can performed on them. DATE is ordinal in this case as it can be used to
# sort in an order. 

# Create a few vectors from your dataset and perform each of the following operations:

vector_1 <- my_data$TMAX
vector_2 <- my_data$TMIN
vector_3 <- my_data$DATE

# max(x)
max(vector_1)
# [1] 88

max(vector_2)
# [1] 64

max(vector_3)
# [1] "2018-02-27"

# min(x)
min(vector_1)
# [1] -43

min(vector_2)
# [1] -56

min(vector_3)
# [1] "2016-03-01"

# sum(x)
sum(vector_1)
# [1] 26038

sum(vector_2)
# [1] 11581

# sum(vector_3)
# sum Not defined for object DATE

# mean(x)
mean(vector_1)
# [1] 35.71742

mean(vector_2)
# [1] 15.88615

mean(vector_3)
# [1] "2017-02-28"

# median(x)
median(vector_1)
# [1] 38

median(vector_2)
# [1] 19

median(vector_3)
# [1] "2017-02-28"

# range(x)
range(vector_1)
# [1] -43  88

range(vector_2)
# [1] -56  64

range(vector_3)
# [1] "2016-03-01" "2018-02-27"

# var(x)
var(vector_1)
# [1] 846.5272

var(vector_2)
# [1] 771.5708

var(vector_3)
# [1] 44347.5

# sd(x)
sd(vector_1)
# [1] 29.09514

sd(vector_2)
# [1] 27.77716

sd(vector_3)
# [1] 210.5885

# Choose 4 of the operations above and provide an explanation of the result for each.
mean(vector_1)
# [1] 35.71742

# Average of all temperatures in vector_1

median(vector_1)
# [1] 38

# Middle number of the numbers in vector_1

range(vector_3)
# [1] "2016-03-01" "2018-02-27"

# The lowest and highest values in vector_3, in this case the earliest and latest dates

sd(vector_2)
# [1] 27.77716

# How spread out the values in vector_2 are, and their relationship to the mean
# Assignment: Assignment 2.2 DSC 520
# Name: Hill, Zach
# Date: 24MAR2019

# Load readr package

library(readr)

# Create variables for each city's csv

caweather <- read_csv("caweather.csv")
scweather <- read_csv("scweather.csv")
sdweather <- read_csv("sdweather.csv")

# Change column names from sdweather.csv to match other two csvs' names
names(sdweather) <- c("NAME", "DATE", "TMAX")

# Create stripchart for each city's weather conditions in February and
# print to PDF

caweather_chart <- stripchart(caweather$TMAX, method="jitter", main="Bakersfield, CA February High Temps",ylab="Count", xlab="Temperatures")
pdf('caweather.pdf')
caweather_chart
dev.off()

scweather_chart <- stripchart(scweather$TMAX, method="jitter", main="Charleston, SC February High Temps",ylab="Count", xlab="Temperatures")
pdf('scweather.pdf')
scweather_chart
dev.off()

sdweather_chart <- stripchart(sdweather$TMAX, method="jitter", main="Pierre, SD February High Temps",ylab="Count", xlab="Temperatures")
pdf('sdweather.pdf')
sdweather_chart
dev.off()

# Get average, max, and min temperature of each city in February

mean(caweather$TMAX)
# [1] 64.18519

max(caweather$TMAX)
# [1] 73

min(caweather$TMAX)
# [1] 51

sd(caweather$TMAX)
# [1] 6.900597

mean(scweather$TMAX)
# [1] 69.45238

max(scweather$TMAX)
# [1] 81

min(scweather$TMAX)
# [1] 47

sd(scweather$TMAX)
# [1] 6.623079
 
mean(sdweather$TMAX)
# [1] 40.10714

max(sdweather$TMAX)
# [1] 70

min(sdweather$TMAX)
# [1] 12

sd(sdweather$TMAX)
# [1] 17.01272

# Which city tended to have the highest temperatures in February?

# Charleston, SC had the highest average temperature in February as well as the
# highest max temperature.

# Which city tended to have the lowest temperatures? Describe how you can tell.

# Pierre, SD had the lowest average temperature as well as the lowest overall
# temperature. The mean() function in R can be used to generate the average
# numbers in a list, in this case the TMAX variable

# Which city had the most day-to-day consistency in its high temperatures in
# February? Which city had the least? Explain how you can tell.

# Charleston, SC had the most consistency in its' weather. sd() in R can be used
# to calculate the Standard Deviation of a range of values which tells us how
# far the values are from the mean.

library(readr)
library(Rcmdr)
library(knitr)

dcdon <- read_csv("./donations-2015-2016-DC.txt")
nedon <- read_csv("./donations-2015-2016-NE.txt")

summary(dcdon)
str(dcdon)
sum(is.na(dcdon))

dcdon <- na.omit(dcdon)
dcdon = dcdon[ dcdon$donation_amount > 0, ]
View(dcdon)

#There are 16 Variables with 87921 observations in the DC Donations file. There
#are over 10000 missing (or NA) values in this dataset which have been replaced
#with NA. Stored as a .txt file, the data is actually a csv. The first row is
#headers.

summary(nedon)
str(nedon)
sum(is.na(nedon))

nedon <- na.omit(nedon)
nedon = nedon[ nedon$donation_amount > 0, ]

#There are 16 Variables with 24270 observations in the NE Donations file. There
#are 3637 missing (or already NA) values in the donor_zip variable, which are
#added as NA. Stored as a .txt file, the data is actually a csv. The first row
#is headers.

#View(dcdon, "DC Donations")
#View(nedon, "NE Donations")

avgdcdon <- format(mean(dcdon$donation_amount), digits = 2, nsmall = 2)
avgnedon <- format(mean(nedon$donation_amount), digits = 2, nsmall = 2)
dim(dcdon)
dim(nedon)

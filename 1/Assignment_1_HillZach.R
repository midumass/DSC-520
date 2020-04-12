# Assignment: Assignment 1 DSC 520
# Name: Hill, Zach
# Date: 17MAR2019

# a. Create two vectors assigning each a unique name.  Each vector needs to
# contain at least 15 elements. Use the Range operator or the Sequence operator
# to create these two vectors.

vector_1 <- c(1:16)
vector_2 <- c(1.5:17)


# b. Leaving the two vectors unchanged, create a third vector, assigning it a
# unique name. Merge the two vectors from part a into a single list that is
# assigned to the third vector.
  
vector_3 <- c(vector_1, vector_2)

# c. Sort the third vector (merged at this point) in ascending, then descending
# order.

vector_3[order(vector_3)]
vector_3[order(-vector_3)]

# d. Use the length function to determine the number of elements contained in
# your third vector.

length(vector_3)

# e. Use the appropriate function to determine only the last 4 elements in your
# third vector.

tail(vector_3, 4)

# f. Use one of the logical operators to only select values greater than 5 from
# the vector.

subset(vector_3, subset = vector_3 > 5)

# g. Calculate the mean and median for each vector.

mean(vector_1)
mean(vector_2)
mean(vector_3)
median(vector_1)
median(vector_2)
median(vector_3)

# h. Save your third vector using the SaveRDS function. You do not need to
# submit the saved vector with your assignment but make sure you verify you have
# saved and can reload the RDS file.

saveRDS(vector_3, "vector_3.rds")
readRDS("vector_3.rds")

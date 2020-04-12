# Assignment: Assignment 2.1 DSC 520
# Name: Hill, Zach
# Date: 24MAR2019

# 1. What are the observational units in this study?
#
# Units of Observation in this study are the grades of students in a proferssor's course.
#
# 2. Identify the variables mentioned in the narrative paragraph and determine
# which are categorical and quantitative?
# 
# Categorical variables include the section topics (sports vs. other areas),
# while quantitative variables would include the students scores and the number of students
# with each score
# 
# 3. Create one variable to hold a subset of your data set that contains only
# the Regular Section and one variable for the Sports Section.

library(readr)
my_csv <- read_csv('scores.csv')

sports <- subset(my_csv, Section == 'Sports')
sports

regular <- subset(my_csv, Section == 'Regular')
regular  

# 4. Use the Plot function to plot each Sections scores and the number of
# students achieving that score. Use additional Plot Arguments to label the
# graph and give each axis an appropriate label. Once you have produced your
# Plots answer the following questions:

plot(sports$Score, sports$Count, main = 'Sports Sections', xlab = 'Scores', ylab = 'Number of Students')
plot(regular$Score, regular$Count, main = 'Regular Sections', xlab = 'Scores', ylab = 'Number of Students')

# a. Comparing and contrasting the point distributions between the two section,
# looking at both tendency and consistency: Can you say that one section tended
# to score more points than the other? Justify and explain your answer.

# More students in the regular sections scored higher. Both the mean and the
# median scores of the regular sections were higher than the sports sections.

mean(my_csv$Score)
mean(sports$Score)
mean(regular$Score)
median(my_csv$Score)
median(sports$Score)
median(regular$Score)

# b. Did every student in one section score more points than every student in
# the other section? If not, explain what a statistical tendency means in this
# context.

# No, students scores were fairly well distributed across all sections. The 
# sports sections had a broader range of scores than the regular sections but
# tended towards doing above the mean of the other students in the sections.
# The regular students were more evenly spread out.

# c. What could be one additional variable that was not mentioned in the
# narrative that could be influencing the point distributions between the two
# sections?

# It might be important to allow the students to have chosen whether they were
# enrolled in the sports section or the regular section. If a student finds 
# no interest in sports, they might be less likely to do well with sports.

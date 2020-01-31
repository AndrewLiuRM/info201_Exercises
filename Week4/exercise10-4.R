# Exercise 4: external data sets: Gates Foundation Educational Grants

# Use the `read.csv()` functoin to read the data from the `data/gates_money.csv`
# file into a variable called `grants` using the `read.csv()`
# Be sure to set your working directory in RStudio, and do NOT treat strings as 
# factors!

# setwd("/Users/andrewliu/Documents/git/info201_Exercises/Week4")
gates_money <- read.csv("data/gates_money.csv", stringsAsFactors = FALSE)

# Use the View function to look at the loaded data
View(gates_money)

# Create a variable `organization` that contains the `organization` column of 
# the dataset
organization <- gates_money[, "organization"]

# Confirm that the "organization" column is a vector using the `is.vector()` 
# function. 
# This is a useful debugging tip if you hit errors later!
print(is.vector(organization))

## Now you can ask some interesting questions about the dataset

# What was the mean grant value?
mean_grant <- mean(gates_money[, "total_amount"], na.rm = TRUE)
print(mean_grant)

# What was the dollar amount of the largest grant?
max_grant <- max(gates_money[, "total_amount"], na.rm = TRUE)
print(max_grant)

# What was the dollar amount of the smallest grant?
min_grant <- min(gates_money[, "total_amount"], na.rm = TRUE)
print(min_grant)

# Which organization received the largest grant?
print(gates_money[gates_money[, "total_amount"] == max_grant, "organization"])

# Which organization received the smallest grant?
print(gates_money[gates_money[, "total_amount"] == min_grant, "organization"])

# How many grants were awarded in 2010?
print(nrow(gates_money))

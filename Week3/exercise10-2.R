# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste(c("Employee"), seq(1, 100, 1))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salary <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
annual_salary_adjustments <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salary, annual_salary_adjustments, stringsAsFactors = F)
rownames(salaries) <- salaries$employees
# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salary_2018 <- salaries$salary + salaries$annual_salary_adjustments

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise <- salaries$salary_2018 > salaries$salary


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
print(salaries["Employee 57", "salary_2018"])

# How many employees got a raise?
print(nrow(salaries[salaries$raise, ]))

# What was the dollar value of the highest raise?
print(max(salaries$salary_2018 - salaries$salary, na.rm = TRUE))

# What was the "name" of the employee who received the highest raise?
print(salaries[which.max(salaries$salary_2018 - salaries$salary), "employees"])

# What was the largest decrease in salaries between the two years?
print(max(salaries$salary - salaries$salary_2018, na.rm = TRUE))

# What was the name of the employee who recieved largest decrease in salary?
print(salaries[which.max(salaries$salary - salaries$salary_2018), "employees"])

# What was the average salary change?
print(mean(salaries$salary_2018 - salaries$salary))

# For people who did not get a raise, how much money did they lose on average?
print(mean(salaries[salaries$raise,]$salary - salaries[salaries$raise,]$salary_2018))

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# it makes sense since the average of the change is expected to be 2500

# Write a .csv file of your salary data to your working directory
write.csv(salaries, paste(getwd(), "/salaries.csv", sep = ""), row.names = FALSE)

#### Libraries ####

# Load tidyverse and lubridate


#### Import and examine data ####

# Import vaccine data. Look carefully at the output here.
vaccines <- read_csv("data/chicago_vaccines_daily.csv")

# Let's glimpse the data
glimpse(vaccines)

# What happens if we try to plot the doses administered over time?
ggplot(vaccines, aes(x=date, y=doses)) + geom_col() 

#### Working with dates ####

# What is the class of the date variable in our data?


# Let's look at one possible function from lubridate that might help
?as_date

# Does it work?
as_date(vaccines$date)

# Whoops! Not quite. Let's take a look at the cheatsheet for help: https://raw.githubusercontent.com/rstudio/cheatsheets/master/lubridate.pdf 

# Try to use a different function to convert the date variable


# Replace the date variable in the dataset with the converted version


# Check the class of our converted variable


# Now what happens if we plot?
ggplot(vaccines, aes(x=date, y=doses)) + geom_col() 

#### Converting date formats ####

# Create a new variable for month. Refer to the cheatsheet for guidance.


# Check the class for the new variable


# Repeat the plot, using month as the x-axis


# Create a new variable for day of the week
# Note: Look at the help file for the function. Are there any arguments you want to use? 


# Repeat the plot, using day of the week as the x-axis


#### Bonus ####

# Bonus question: Can you calculate the number of days it took for Chicago to fully vaccinate 1 million people?
# Hint: You may need to ue the function cumsum()
#### Libraries ####

# Load tidyverse and lubridate
library(tidyverse)
library(lubridate)

#### Import and examine data ####

# Import vaccine data. Look carefully at the output here.
vaccines <- read_csv("data/chicago_vaccines_daily.csv")

# Let's glimpse the data
glimpse(vaccines)

# What happens if we try to plot the 
ggplot(vaccines, aes(x=date, y=doses)) + geom_col() 

#### Working with dates ####

# What is the class of the date variable in our data?
class(vaccines$date)

# Let's look at one possible function from lubridate that might help
?as_date

# Does it work?
as_date(vaccines$date)

# Whoops! Not quite. Let's take a look at the cheatsheet for help: https://raw.githubusercontent.com/rstudio/cheatsheets/master/lubridate.pdf 

# Try to use a different function to convert the date variable
mdy(vaccines$date)
# Note that we can also use as_date() by supplying a format argument. To learn about options in the format argument, look at the help file for ?strptime
as_date(vaccines$date, format="%m/%d/%y")

# Replace the date variable in the dataset with the converted version
vaccines$date <- mdy(vaccines$date)

# Check the class of our converted variable
class(vaccines$date)

# Now what happens if we plot?
ggplot(vaccines, aes(x=date, y=doses)) + geom_col() 

#### Converting date formats ####

# Create a new variable for month. Refer to the cheatsheet for guidance.
vaccines$month <- month(vaccines$date)

# Check the class for the new variable
class(vaccines$month)

# Repeat the plot, using month as the x-axis
ggplot(vaccines, aes(x=month, y=doses)) + geom_col()

# Create a new variable for day of the week
vaccines$wday <- wday(vaccines$date, label=TRUE)

# Repeat the plot, using day of the week as the x-axis
ggplot(vaccines, aes(x=wday, y=doses)) + geom_col()

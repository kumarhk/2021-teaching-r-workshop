#### Libraries ####

# Load tidyverse and lubridate
library(tidyverse)
library(lubridate)

#### Import and examine data ####

# Import vaccine data. Look carefully at the output here.
vaccines <- read_csv("data/chicago_vaccines_daily.csv")

# Let's glimpse the data
glimpse(vaccines)

# What happens if we try to plot the doses administered over time?
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
# Note: Look at the help file for the function. Are there any arguments you want to use?
# I used label=TRUE here, to create a factor variable (Mon, Tue, etc.) rather than a numeric one (1, 2, etc.)
vaccines$wday <- wday(vaccines$date, label=TRUE)

# Repeat the plot, using day of the week as the x-axis
ggplot(vaccines, aes(x=wday, y=doses)) + geom_col()

#### Bonus ####

# Bonus question: Can you calculate the number of days it took for Chicago to fully vaccinate 1 million people?
# Hint: You may need to use the function cumsum() 

# Step 1: Create a cumulative sum of the final doses variable
vaccines$final_doses_cumulative <- cumsum(vaccines$final_dose)

# Step 2: Identify the first date when the cumulative final doses variable reaches 1,000,000
date_million <- min(vaccines$date[vaccines$final_doses_cumulative>=1000000])

# Step 3: Identify first date of vaccines being administered
date_first <- min(vaccines$date)

# Calculate difference
date_million-date_first

# Lubridate helpfully informs us: "Time difference of 149 days"!
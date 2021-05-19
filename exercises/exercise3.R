#### Libraries ####

# Load gapminder - we will need this for the example data
library(gapminder)

# Load coefplot - we will use this to visualize results
library(coefplot)

#### Import and examine data ####

# Import data
gapminder <- gapminder::gapminder

# Examine data
glimpse(gapminder)

# Create GDP per capita (per thousand dollars) variable
gapminder$gdpPercap_perthou <- gapminder$gdpPercap/1000

#### Regression model 1 ####

# Are life expectancy and GDP per capita related? A scatterplot suggests ... maybe!
plot(lifeExp ~ gdpPercap_perthou, data=gapminder)

# Let's try a bivariate linear regression
mod1 <- lm(lifeExp ~ gdpPercap_perthou, data=gapminder)

# What is the structure of the resultant object?
str(mod1)

# Use summary() to view regression results
summary(mod1)

#### Regression model 2 ####

# Implement a regression, similar to the one above, but with the added covariate "year"


# Use summary() to view regression results


# Use coefplot() to view regression results


# That plot is not very useful ... what can we do to make it more useful? Check the help file.


# Bonus: try adding a title to the plot. Hint: coefplot is based on ggplot2. 


#### Regression model 3 ####

# Predict life expectancy as a function of GDP per capita, year, and continent


# Use summary() to view regression results
# What happened to the character variable that we inserted as a covariate? 


# Use coefplot() to view regression results


# Bonus: Install and load the weights package and use nalevs() to recode all the independent variables. Note that you can do this directly in the formula within lm(). What does this function do? How does it change the results of coefplot()?

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
mod2 <- lm(lifeExp ~ gdpPercap_perthou + year, data=gapminder)

# Use summary() to view regression results
summary(mod2)

# Use coefplot() to view regression results
coefplot(mod2)

# That plot is not very useful ... what can we do to make it more useful?
coefplot(mod2, intercept=FALSE)

# Bonus: try adding a title to the plot
# Option 1: use coefplot argument
coefplot(mod2, intercept=FALSE, title="Coefficients from Model 2")
# Option 2: use ggplot layers
coefplot(mod2, intercept=FALSE) + labs(title="Coefficients from Model 2")

#### Regression model 3 ####

# Predict life expectancy as a function of GDP per capita, year, and continent
mod3 <- lm(lifeExp ~ gdpPercap_perthou + year + continent, data=gapminder)

# Use summary() to view regression results
# Note that continent is treated as a set of fixed effects, and "Africa" is automatically chosen as the excluded category
summary(mod3)

# Use coefplot() to view regression results
coefplot(mod3, intercept=FALSE)

# Bonus: Install and load the weights package and use nalevs() to recode all the independent variables. Note that you can do this directly in the formula within lm(). What does this function do? How does it change the results of coefplot()? 
# Load library and look at the help file. nalevs() recodes numeric variables into a 0 to 1 range.
library(weights)
?nalevs
# Let's look at an example
summary(gapminder$gdpPercap)
summary(nalevs(gapminder$gdpPercap))
# Run the regression
mod4 <- lm(lifeExp ~ nalevs(gdpPercap) + nalevs(pop) + nalevs(year) + continent, data=gapminder)
# Examine results using coefplot(). When variables are recoded 0 to 1, coefficient plots are easier to read. 
coefplot(mod4, intercept=FALSE) + 
    labs(title="Coefficients from Model 4", subtitle="All independent variables recoded to a 0-1 range.")


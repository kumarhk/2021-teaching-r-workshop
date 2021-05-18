#### Load libraries ####

# Load tidyverse - note the output lets you know this contains ggplot2


# Load gapminder - this contains the data we will use


#### Import and view data ####

# Load data
gapminder <- gapminder::gapminder

# Look at the structure of the data. You can use glimpse(), summary(), or head().


# Create a new data frame with only the data for 2007
gapminder07 <- filter(gapminder, year==2007)

#### Basic plot ####

# Scatterplot of population over time
ggplot(gapminder) + 
    geom_point(aes(x=year, y=pop))

# Add labels to the plot
ggplot(gapminder) + 
    geom_point(aes(x=year, y=pop)) + 
    labs(title="Population over time", x="Year", y="Population")

# Your turn: plot life expectancy as a function of GDP per capita for the year 2007, and add labels


#### Choosing geoms ####

# Let's look at geom_smooth(). Add a geom_smooth() layer to the previous plot.


# How about geom_hline()? When you add it, you'll need to provide a new aesthetic option.
ggplot(gapminder07) + 
    geom_point(aes(x=gdpPercap, y=lifeExp)) + 
    geom_hline(aes(yintercept=mean(lifeExp))) + 
    labs(title="Do people in richer countries live longer?", 
         x="GDP per capita", y="Life expectancy",
         subtitle="Gapminder 2007 data")

# Your turn: Plot the life expectancy of each continent in 2007
# Look at the ggplot cheatsheet and decide what kind of geom to use: https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf 


#### Grouping variables ####

# Grouping by color
ggplot(gapminder07) + 
    geom_point(aes(x=gdpPercap, y=lifeExp, col=continent)) + 
    labs(title="Do people in richer countries live longer?", x="GDP per capita", y="Life expectancy")

# Grouping by facet
ggplot(gapminder07, aes(x=gdpPercap, y=lifeExp)) + 
    geom_point() + 
    geom_smooth() + 
    facet_wrap(~year) + 
    labs(title="Do people in richer countries live longer?", x="GDP per capita", y="Life expectancy")

# Add scales="free" in facet_wrap() and see what happens


# Your turn: Let's visualize life expectancy by continent in 2007 again. This time, use grouping by color or facet.
# Bonus: Use two geoms.


#### Choose your own adventure! ####

# Create a plot that includes two geoms and facets by some variable. 








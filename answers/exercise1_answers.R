#### Load libraries ####

# Load tidyverse - note the output lets you know this contains ggplot2
library(tidyverse)

# Load gapminder - this contains the data we will use
library(gapminder)

#### Import and view data ####

# Load data
gapminder <- gapminder::gapminder

# Look at the structure of the data
glimpse(gapminder)

# Create a new data frame with only the data for 2007
gapminder07 <- filter(gapminder, year==2007)

#### Basic plot ####

# Scatterplot of population over time
ggplot(gapminder, aes(x=year, y=pop)) + 
    geom_point()

# Add labels to the plot
ggplot(gapminder, aes(x=year, y=pop)) + 
    geom_point() + 
    labs(title="Population over time", x="Year", y="Population")

# Your turn: plot life expectancy as a function of GDP per capita for the year 2007, and add labels
ggplot(gapminder07, aes(x=gdpPercap, y=lifeExp)) + 
    geom_point() + 
    labs(title="Do people in richer countries live longer?", x="GDP per capita", y="Life expectancy")

#### Choosing geoms ####

# Let's look at geom_smooth(). Add a geom_smooth() layer to the previous plot.
ggplot(gapminder07, aes(x=gdpPercap, y=lifeExp)) + 
    geom_point() + 
    geom_smooth() + 
    labs(title="Do people in richer countries live longer?", 
         x="GDP per capita", y="Life expectancy",
         subtitle="Gapminder 2007 data")

# How about geom_hline()? When you add it, you'll need to provide a new aesthetic option.
ggplot(gapminder07, aes(x=gdpPercap, y=lifeExp)) + 
    geom_point() + 
    geom_hline(aes(yintercept=mean(lifeExp))) + 
    labs(title="Do people in richer countries live longer?", 
         x="GDP per capita", y="Life expectancy",
         subtitle="Gapminder 2007 data")

# Your turn: Plot the life expectancy of each continent in 2007
# Look at the ggplot cheatsheet and decide what kind of geom to use: https://github.com/rstudio/cheatsheets/blob/master/data-visualization-2.1.pdf
# Option 1: Box plot
ggplot(gapminder07) + 
    geom_boxplot(aes(x=continent, y=lifeExp))
# Option 2: Column plot
ggplot(gapminder07) + 
    geom_col(aes(x=continent, y=lifeExp))

#### Grouping variables ####

# Grouping by color
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=year)) + 
    geom_point() + 
    geom_hline(aes(yintercept=mean(lifeExp))) + 
    labs(title="Do people in richer countries live longer?", x="GDP per capita", y="Life expectancy")

# Grouping by facet
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
    geom_point() + 
    geom_smooth() + 
    facet_wrap(~year) + 
    labs(title="Do people in richer countries live longer?", x="GDP per capita", y="Life expectancy")

# Add scales="free" in facet_wrap() and see what happens
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + 
    geom_point() + 
    geom_smooth() + 
    facet_wrap(~year, scales="free") + 
    labs(title="Do people in richer countries live longer?", x="GDP per capita", y="Life expectancy")

# Your turn: Let's visualize life expectancy by continent in 2007 again. This time, use grouping by color or facet.
# Bonus: Use two geoms.
# Option 1: By colors
ggplot(gapminder07, aes(x=gdpPercap, y=lifeExp, col=continent, size=pop)) + 
    geom_point() + 
    labs(title="Life expectancy as a function of GDP per capita, by continent", x="GDP per capita", y="Life expectancy")
# Option 2: By facet
ggplot(gapminder07, aes(x=gdpPercap, y=lifeExp, size=pop)) + 
    geom_point() + 
    geom_smooth() + 
    facet_wrap(~continent, scales="free") + 
    labs(title="Life expectancy as a function of GDP per capita, by continent", x="GDP per capita", y="Life expectancy")
# Option 3: By facet
ggplot(gapminder07, aes(x=lifeExp, size=pop)) + 
    geom_density() + 
    facet_wrap(~continent, scales="free")+ 
    labs(title="Life expectancy by continent", x="Life expectancy", y="")

#### Choose your own adventure! ####

# Create a plot that includes two geoms and facets by some variable. 








library(gapminder)
data<-gapminder
print(gapminder)

head(gapminder) # first six entries of the gapminder dataset
ncol(gapminder) # number of columns in gapminder dataset
str(gapminder) # Info about each variable in gapminder (typeOf, levels, etc)
summary(gapminder) # Tukey five number summary for each variable in gapminder

var(gapminder$year) # extract variance of year in gapminder data set
var(gapminder$lifeExp) # variance of life expectancy
var(gapminder$pop) # variance of population
var(gapminder$gdpPercap) # variance of gdp per capita

# Github pages
# Github page link: https://ernestl91.github.io/STAT545_participation/
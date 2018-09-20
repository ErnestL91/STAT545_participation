STAT545 HW01
================
Ernest Lai
September 17, 2018

<br/>

R Markdown
==========

This is the R Markdown document for hw01, which explores the **gapminder** dataset. To explore the data, we first have to install the 'gapminder' package through **install.packages('gapminder')** and open the dataset into our R-Studio environment through **library(gapminder)**.

<br/> *For additional information on functions used in this exercise, type "?" and the function as one word in the console and the R help documentation will explain the function and the object needed to run the function successfully*

Viewing and Exploring the dataset
---------------------------------

To first explore contents of the dataset, we should assign our gapminder dataset to a variable called 'data'. Prior to this, please be reminded to do a one-time installation of gapminder dataset via **install.packages('gapminder')**:

<br/>

``` r
library(gapminder)
data <- gapminder
```

*The statements message=FALSE and warning=FALSE excludes external warning messages or output messages from being printed in the HTML version*

<br/>

From this point on, any work associated with gapminder in this R-Studio session will be referenced to the variable called 'data'. Lets try exploring the gapminder dataset:

<br/>

``` r
 # Provides number of observations and variables, also the class of each variable in the gapminder dataset
str(data)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
    ##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
    ##  $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
    ##  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
    ##  $ pop      : int  8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
    ##  $ gdpPercap: num  779 821 853 836 740 ...

``` r
# Information provided for each variable for the first 6 observed entries in the gapminder dataset
head(data) 
```

    ## # A tibble: 6 x 6
    ##   country     continent  year lifeExp      pop gdpPercap
    ##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ## 1 Afghanistan Asia       1952    28.8  8425333      779.
    ## 2 Afghanistan Asia       1957    30.3  9240934      821.
    ## 3 Afghanistan Asia       1962    32.0 10267083      853.
    ## 4 Afghanistan Asia       1967    34.0 11537966      836.
    ## 5 Afghanistan Asia       1972    36.1 13079460      740.
    ## 6 Afghanistan Asia       1977    38.4 14880372      786.

``` r
# Number of rows in gapminder dataset (or number of observations)
nrow(data) 
```

    ## [1] 1704

``` r
# Number of columns in gapminder dataset (or number of variables)
ncol(data) 
```

    ## [1] 6

<br/>

Summary Statistics
------------------

We can produce summary statistics for specific variables within the gapminder dataset, by adding the syntax '$' after the gapminder dataset name (data), followed by the variable name in the gapminder dataset

<br/>

``` r
# Gives the frequency of each country in the dataset
table(data$country) 
```

    ## 
    ##              Afghanistan                  Albania                  Algeria 
    ##                       12                       12                       12 
    ##                   Angola                Argentina                Australia 
    ##                       12                       12                       12 
    ##                  Austria                  Bahrain               Bangladesh 
    ##                       12                       12                       12 
    ##                  Belgium                    Benin                  Bolivia 
    ##                       12                       12                       12 
    ##   Bosnia and Herzegovina                 Botswana                   Brazil 
    ##                       12                       12                       12 
    ##                 Bulgaria             Burkina Faso                  Burundi 
    ##                       12                       12                       12 
    ##                 Cambodia                 Cameroon                   Canada 
    ##                       12                       12                       12 
    ## Central African Republic                     Chad                    Chile 
    ##                       12                       12                       12 
    ##                    China                 Colombia                  Comoros 
    ##                       12                       12                       12 
    ##         Congo, Dem. Rep.              Congo, Rep.               Costa Rica 
    ##                       12                       12                       12 
    ##            Cote d'Ivoire                  Croatia                     Cuba 
    ##                       12                       12                       12 
    ##           Czech Republic                  Denmark                 Djibouti 
    ##                       12                       12                       12 
    ##       Dominican Republic                  Ecuador                    Egypt 
    ##                       12                       12                       12 
    ##              El Salvador        Equatorial Guinea                  Eritrea 
    ##                       12                       12                       12 
    ##                 Ethiopia                  Finland                   France 
    ##                       12                       12                       12 
    ##                    Gabon                   Gambia                  Germany 
    ##                       12                       12                       12 
    ##                    Ghana                   Greece                Guatemala 
    ##                       12                       12                       12 
    ##                   Guinea            Guinea-Bissau                    Haiti 
    ##                       12                       12                       12 
    ##                 Honduras         Hong Kong, China                  Hungary 
    ##                       12                       12                       12 
    ##                  Iceland                    India                Indonesia 
    ##                       12                       12                       12 
    ##                     Iran                     Iraq                  Ireland 
    ##                       12                       12                       12 
    ##                   Israel                    Italy                  Jamaica 
    ##                       12                       12                       12 
    ##                    Japan                   Jordan                    Kenya 
    ##                       12                       12                       12 
    ##         Korea, Dem. Rep.              Korea, Rep.                   Kuwait 
    ##                       12                       12                       12 
    ##                  Lebanon                  Lesotho                  Liberia 
    ##                       12                       12                       12 
    ##                    Libya               Madagascar                   Malawi 
    ##                       12                       12                       12 
    ##                 Malaysia                     Mali               Mauritania 
    ##                       12                       12                       12 
    ##                Mauritius                   Mexico                 Mongolia 
    ##                       12                       12                       12 
    ##               Montenegro                  Morocco               Mozambique 
    ##                       12                       12                       12 
    ##                  Myanmar                  Namibia                    Nepal 
    ##                       12                       12                       12 
    ##              Netherlands              New Zealand                Nicaragua 
    ##                       12                       12                       12 
    ##                    Niger                  Nigeria                   Norway 
    ##                       12                       12                       12 
    ##                     Oman                 Pakistan                   Panama 
    ##                       12                       12                       12 
    ##                 Paraguay                     Peru              Philippines 
    ##                       12                       12                       12 
    ##                   Poland                 Portugal              Puerto Rico 
    ##                       12                       12                       12 
    ##                  Reunion                  Romania                   Rwanda 
    ##                       12                       12                       12 
    ##    Sao Tome and Principe             Saudi Arabia                  Senegal 
    ##                       12                       12                       12 
    ##                   Serbia             Sierra Leone                Singapore 
    ##                       12                       12                       12 
    ##          Slovak Republic                 Slovenia                  Somalia 
    ##                       12                       12                       12 
    ##             South Africa                    Spain                Sri Lanka 
    ##                       12                       12                       12 
    ##                    Sudan                Swaziland                   Sweden 
    ##                       12                       12                       12 
    ##              Switzerland                    Syria                   Taiwan 
    ##                       12                       12                       12 
    ##                 Tanzania                 Thailand                     Togo 
    ##                       12                       12                       12 
    ##      Trinidad and Tobago                  Tunisia                   Turkey 
    ##                       12                       12                       12 
    ##                   Uganda           United Kingdom            United States 
    ##                       12                       12                       12 
    ##                  Uruguay                Venezuela                  Vietnam 
    ##                       12                       12                       12 
    ##       West Bank and Gaza              Yemen, Rep.                   Zambia 
    ##                       12                       12                       12 
    ##                 Zimbabwe 
    ##                       12

``` r
# Gives the frequency of each continent in the dataset
table(data$continent) 
```

    ## 
    ##   Africa Americas     Asia   Europe  Oceania 
    ##      624      300      396      360       24

``` r
# Number of countries in the data set
length(
  table(data$country)
  ) 
```

    ## [1] 142

``` r
# Number of continents in the data set
length(
  table(data$continent)
  ) 
```

    ## [1] 5

``` r
# Gives the average population based on all the countries in the data set
mean(data$pop) 
```

    ## [1] 29601212

``` r
# Gives the variance of the population based on all countries in the data set
var(data$pop) 
```

    ## [1] 1.12695e+16

``` r
# Gives the 1st quartile, median, third quartile, minimum, maximum, and average values for GDP per capita 
summary(data$gdpPercap) 
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##    241.2   1202.1   3531.8   7215.3   9325.5 113523.1

<br/>

Summary Statistics with Specific Requirements
---------------------------------------------

As seen in the dataset, there are a lot different countries being observed. What if we are interested in the average or range of the population for a specific country? Or GDP per capita given a certain continent? Or even average population with a given range of GDP per capita?

<br/>

``` r
# Takes the average population for Montenegro (average population, given country = Montenegro)
mean(
  data$pop[data$country == "Montenegro"]
  ) 
```

    ## [1] 564269.7

``` r
# Max, min, mean, median, Q1, and A3 values for population in the Asia continent
summary(
  data$pop[data$continent == "Asia"]
  ) 
```

    ##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
    ## 1.204e+05 3.844e+06 1.453e+07 7.704e+07 4.630e+07 1.319e+09

``` r
# Max, min, mean, median, Q1, and A3 values for GDP per capita in the Europe continent
summary(
  data$gdpPercap[data$continent == "Europe"]
  ) 
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   973.5  7213.1 12081.8 14469.5 20461.4 49357.2

``` r
# Mean population of countries with GDP per capita between 1202.1 and 3531.8 inclusive.
mean(
  data$pop[data$gdpPercap >= '1202.1' & data$gdpPercap <= '3531.8']
  ) 
```

    ## [1] 30745781

<br/>

Including Plots
---------------

Plots can also be made for each variable. Which plot we use is dependent on the type of data we are dealing with (ie. continuous, discrete, etc)

<br/>

``` r
# Boxplot of population for Morocco
boxplot(
  data$pop[data$country == 'Morocco'], 
  ylab = 'Population', xlab ='Country', main = 'Frequency of Each Continent in gapminder Dataset'
  )
```

![](hw01_gapminder_files/figure-markdown_github/plots-1.png)

``` r
# Boxplot of life expectancy for each continent
boxplot(data$lifeExp ~ data$continent, 
        xlab = 'Continent', ylab = 'Life Expectancy (by Years)', main = 'Boxplot of Life Expectancy (in
        Years) by Continent'
        ) 
```

![](hw01_gapminder_files/figure-markdown_github/plots-2.png)

``` r
# Histogram of Life Expectancy for the African Continent
hist(data$lifeExp[data$continent =='Africa'], 
     xlab='Life Expectancy (in Years)', ylab='Frequency', main = 'Life Expectancy (in Years) for Africa)'
     )
```

![](hw01_gapminder_files/figure-markdown_github/plots-3.png)

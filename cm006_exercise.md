cm006 Exercises: Exploring Geometric Objects
================

In this worksheet, we'll be exploring various plot types (i.e., geometric objects), only using the `x` and `y` aesthetics (and `group`).

1.  To get started, load the `tidyverse` and `gapminder` R packages.

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 3.3.3

    ## -- Attaching packages ---------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.0.0     v purrr   0.2.4
    ## v tibble  1.4.2     v dplyr   0.7.4
    ## v tidyr   0.8.0     v stringr 1.2.0
    ## v readr   1.1.1     v forcats 0.3.0

    ## Warning: package 'tibble' was built under R version 3.3.3

    ## Warning: package 'tidyr' was built under R version 3.3.3

    ## Warning: package 'readr' was built under R version 3.3.3

    ## Warning: package 'purrr' was built under R version 3.3.3

    ## Warning: package 'dplyr' was built under R version 3.3.3

    ## Warning: package 'stringr' was built under R version 3.3.3

    ## Warning: package 'forcats' was built under R version 3.3.3

    ## -- Conflicts ------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(gapminder)
```

    ## Warning: package 'gapminder' was built under R version 3.3.3

Scatterplot
-----------

Let's look at a *scatterplot* of `gdpPercap` vs. `lifeExp`.

1.  Fill out the grammar components below. Again, bold *must* be specified to make a `ggplot2` plot.
    -   We'll ignore "coordinate system" and "facetting" after this.

| Grammar Component     | Specification |
|-----------------------|---------------|
| **data**              | `gapminder`   |
| **aesthetic mapping** | 'x' and 'y'   |
| **geometric object**  | point         |
| scale                 | linear        |
| statistical transform | none          |
| coordinate system     | rectangular   |
| facetting             | none          |

1.  Populate the data and aesthetic mapping in `ggplot`. What is returned? What's missing?

``` r
ggplot(data=gapminder, mapping=aes(x=lifeExp, y=gdpPercap)) + 
    geom_point()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-2-1.png)

1.  Add the missing component as a *layer*.

Notice the "metaprogramming" again!

1.  You *must* remember to put the aesthetic mappings in the `aes` function! What happens if you forget?

``` r
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
    geom_point()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
## Error: geom_point requires the following missing aesthetics: x, y
```

1.  Put the x-axis on a log scale, first by transforming the x variable.
    -   Note: `ggplot2` does some data wrangling and computations itself! We don't always have to modify the data frame.

``` r
ggplot(gapminder, aes(x=lifeExp, y=log(gdpPercap))) +
    geom_point()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
## Graph looks more linear
```

1.  Try again, this time by changing the *scale* (this way is better).

``` r
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
    geom_point() +
    scale_y_log10() # changes y-scale to log scale
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
## aes -> first argument always x, followed by y
## everything should be done in order (ie. geom point, scale, etc)
```

1.  The aesthetic mappings can be specified on the geom layer if you want, instead of the main `ggplot` call. Give it a try:

``` r
ggplot(gapminder) +
    geom_point(aes(lifeExp, gdpPercap)) +
    scale_y_log10() 
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-6-1.png)

1.  Optional: git stage and commit

**Uses of a scatterplot**:

-   Visualize 2-dimensional distributions; dependence.
-   2 numeric variables

Histograms, and Kernel Density Plots
------------------------------------

Let's build a histogram of life expectancy.

1.  Fill out the grammar components below. Again, bold *must* be specified to make a `ggplot2` plot.

| Grammar Component     | Specification |
|-----------------------|---------------|
| **data**              | `gapminder`   |
| **aesthetic mapping** | 'x'           |
| **geometric object**  | histogram     |
| scale                 | linear        |
| statistical transform | none          |

1.  Build the histogram of life expectancy.

``` r
ggplot(gapminder, aes(lifeExp)) +
    geom_histogram()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-7-1.png)

1.  Change the number of bins to 50.

``` r
ggplot(gapminder, aes(lifeExp)) +
    geom_histogram(bins=50)
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-8-1.png)

``` r
## bin-width = how wide want our bars to be
```

1.  Instead of a histogram, let's create a kernel density plot.

``` r
ggplot(gapminder, aes(lifeExp)) +
    geom_density() ## bw='' changes bin width)
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-9-1.png)

``` r
# Overlay density plot over histogram
ggplot(gapminder, aes(lifeExp)) +
    geom_histogram(aes(y=..density..)) +
    geom_density() 
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-9-2.png)

1.  Optional: git stage and commit

**Uses of a histogram**: Explore the distribution of a single numeric variable.

Box plots, and violin plots
---------------------------

Let's make *box plots* of population for each continent. Note: y-axis is much better on a log scale!

1.  Fill out the grammar components below. Again, bold *must* be specified to make a `ggplot2` plot.

| Grammar Component     | Specification    |
|-----------------------|------------------|
| **data**              | `gapminder`      |
| **aesthetic mapping** | 'x' and 'y'      |
| **geometric object**  | boxplot          |
| scale                 | log-y            |
| statistical transform | 5-number summary |

1.  Initiate the `ggplot` call, with the log y scale, and store it in the variable `a`. Print out `a`.

``` r
## store ggplot boxplot in 'a'
a <- ggplot(gapminder, aes(continent, pop)) + 
    scale_y_log10() # add log scale
```

1.  Add the boxplot geom to `a`.

``` r
a + geom_boxplot()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-11-1.png)

1.  A violin plot is a kernel density on its side, made symmetric. Add that geom to `a`.
    -   What's better here, boxplots or violin plots? Why?

``` r
a + geom_violin()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-12-1.png)

``` r
# Kernel densities on their side - more information given (ie. far right = looks like hour glass, can't find this by looking at a boxplot)

# Wherever its wider, there is more data
```

1.  Optional: git stage and commit

**Use of boxplot**: Visualize 1-dimensional distributions (of a single numeric variable).

Jitter plots
------------

Let's work up to the concept of a *jitter plot*. As above, let's explore the population for each continent, but using points (again, with the y-axis on a log scale).

Let's hold off on identifying the grammar.

1.  Initiate the `ggplot` call to make a scatterplot of `continent` vs `pop`; initiate the log y scale. Store the call in the variable `b`.

``` r
a + geom_point()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-13-1.png)

``` r
# No good, can't see any structure. Within geom point, change alpha (alpha transperancy). E.g. alpha = 0.1, inverse number of points needed to get perfectly opaque point (gives more structure)

a + geom_point(alpha=0.1)
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-13-2.png)

``` r
# Better way is to jitter the plot, spread the data out more
```

1.  Add the point geom to `b`. Why is this an ineffective plot?

2.  A solution is to jitter the points. Add the jitter geom. Re-run the command a few times -- does the plot change? Why?

``` r
a + geom_jitter()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-14-1.png)

``` r
# See much more density, where there is more density in some areas compared to others
```

1.  How does the grammar differ from a box plot or violin plot?
    -   ANSWER:

2.  We can add multiple geom *layers* to our plot. Put a jitterplot overtop of the violin plot, starting with our base `b`. Try vice-versa.

``` r
a + geom_violin() +
    geom_jitter(alpha=0.1)
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-15-1.png)

``` r
# Gives visualization of complete picture of the data
```

1.  Optional: git stage and commit

**Uses of jitterplot**: Visualize 1-dimensional distributions, AND get a sense of the sample size.

Time/Line Plots
---------------

Let's make some time/line plot, starting with Canada's life expectancy over time. (Need to do filtering!)

1.  Fill out the grammar components below. Again, bold *must* be specified to make a `ggplot2` plot.

| Grammar Component     | Specification |
|-----------------------|---------------|
| **data**              | `gapminder`   |
| **aesthetic mapping** |               |
| **geometric object**  |               |
| scale                 |               |
| statistical transform |               |

1.  In one readable call, write code that:
    1.  Filters the data to Canada only
    2.  Pipes the filtered data into `ggplot`
    3.  Makes the time plot of `lifeExp` over time
    4.  Also displays the points

``` r
gapminder %>%
      filter(country == "Canada") %>% 
      ggplot(aes(year, lifeExp)) +
      geom_line() # connect dots from left to right
```

    ## Warning: package 'bindrcpp' was built under R version 3.3.3

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-16-1.png)

``` r
      geom_point()
```

    ## geom_point: na.rm = FALSE
    ## stat_identity: na.rm = FALSE
    ## position_identity

``` r
# Piping takes the first (left) argument (filter and puts it into second function)
# Filter gapminder to Canadian country only, then tell it to make a ggplot
```

1.  Attempt to overlay line plots for all countries. That is, repeat the above code, but don't filter. What's wrong here?

``` r
c <- ggplot(gapminder, aes(year, lifeExp))
c + geom_line()
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-17-1.png)

``` r
c + geom_line(aes(group=country)) #  takes the data, creates chunks by  country (each country is its own chunk - does this geom line for each country)
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-17-2.png)

``` r
c + geom_line(aes(group=country), alpha =0.2)
```

![](cm006_exercise_files/figure-markdown_github/unnamed-chunk-17-3.png)

1.  Use the `group` aesthetic to fix the problem.

2.  Optional: git stage and commit

**Uses of time/line plots**: Visualize trends of a numeric variable over time.

Path plots
----------

Let's see how Rwanda's life expectancy and GDP per capita have evolved over time, using a path plot.

1.  Make a scatterplot. Store it in the variable `c`.

2.  We want to connect the dots from earliest point to latest. What happens if we add the "line" geom to `c`?

3.  Add the appropriate geom to `c`. In that geom, specify a property of the geom: `arrow=arrow()`.

4.  Optional: git stage and commit

**Uses of path plots**: The four "corners" of the plot usually indicate different qualities. This plot allows you to see how Rwanda (or some entity) evolves over these qualities.

Bar plots
---------

How many countries are in each continent? Use the year 2007.

1.  Fill out the grammar components below. Again, bold *must* be specified to make a `ggplot2` plot.

| Grammar Component     | Specification |
|-----------------------|---------------|
| **data**              | `gapminder`   |
| **aesthetic mapping** |               |
| **geometric object**  |               |
| scale                 |               |
| statistical transform |               |

1.  After filtering the gapminder data to 2007, make a bar chart of the number of countries in each continent. Store everything except the geom in the variable `d`.

2.  Notice the y-axis. Oddly, `ggplot2` doesn't make it obvious how to change to proportion. Try adding a `y` aesthetic: `y=..count../sum(..count..)`.

3.  Optional: git stage, commit, and push!

**Uses of bar plots**: Get a sense of relative quantities of categories, or see the probability mass function of a categorical random variable.

## data visualization

## 1. number of variables
## 2. data types

library(tidyverse)

## basic ggplot2
## grammar of graphics
## data, mapping, geometry
ggplot(data = mtcars,
       mapping = aes(x = mpg)) +
  geom_histogram(bins=10, fill="#277EFC")

ggplot(data = mtcars,
       mapping = aes(x = mpg)) +
  geom_density()

myPlot <- ggplot(data = mtcars, 
       mapping = aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE) +
  geom_rug() +
  theme_minimal()

## BREAK 10 Minutes
## meet you again at 10:50 AM

## Highlight specific data
## split data into two dataframes
df1 <- mtcars %>% filter(wt < 5)
df2 <- mtcars %>% filter(wt >= 5)

ggplot() +
  theme_minimal() +
  geom_point(data = df1,
             mapping = aes(wt, mpg),
             color = "red", size = 3) +
  geom_point(data = df2,
             mapping = aes(wt, mpg),
             color = "blue", size = 3)

## customization

mtcars <- mtcars %>%
  mutate(am = factor(am, 
                     levels=c(0,1),
                     labels=c("Auto", "Manual")))

mtcars <- mtcars %>%
  mutate(vs = factor(vs,
                     levels=c(0,1),
                     labels=c("V-Shaped","Straight")))

ggplot(data = mtcars,
       # mapping
       mapping = aes(x=wt, 
                     y=mpg, 
                     col=am,
                     size=hp)) +
  # setting
  geom_point(alpha=0.8) + 
  theme_minimal() +
  labs(
    title = "Scatter plot Weight x MPG",
    subtitle = "We found negative correlation between two variables",
    caption = "Data Source: RStudio 2022",
    x = "Weight (Tonne)",
    y = "Miles Per Gallon"
  )

## diamonds built-in dataset
library(tidyverse)

View(diamonds)

## EDA => Exploratory Data Analysis
## helper function
qplot(price, data=diamonds, 
      geom="histogram",
      bins=100)

# Overplotting
qplot(x=carat, 
      y=price,
      data=diamonds,
      geom="point",
      alpha = 0.1)

ggplot(diamonds, aes(carat, price)) +
  geom_point(alpha = 0.05)

## random data in dplyr
set.seed(42) # lock result from sample_n
diamonds %>%
  sample_n(2000) %>%
  ggplot(aes(x=carat, y=price)) +
  geom_point(alpha = 0.3)

set.seed(42) # lock result from sample_n
diamonds %>%
  sample_frac(0.01) %>% #5%
  ggplot(aes(x=carat, y=price)) +
  geom_point(alpha = 0.3)

## Facet ggplot
ggplot(diamonds %>% sample_n(10000),
       aes(carat, price, col=cut)) +
  geom_point(alpha=0.5) +
  facet_wrap(~cut, ncol=2) +
  theme_minimal()

## Facet Grid => more than one dimension
ggplot(diamonds %>% sample_n(10000),
       aes(carat, price, col=cut)) +
  theme_minimal() +
  geom_smooth(col="red") +
  geom_point(alpha=0.5) +
  facet_grid(clarity ~ cut)
  
## Bar Chart => One Variable/ Factor
ggplot(diamonds, aes(cut,fill=color)) +
  geom_bar(position = "fill") +
  theme_minimal()

## Change Manual Color
mtcars <- mtcars %>%
  mutate(am = factor(am,
                     levels=c(0,1),
                     labels=c("Auto", 
                              "Manual")))

ggplot(mtcars, 
       aes(wt, mpg, col=am)) +
  geom_point(size=5, alpha=0.8) +
  theme_minimal() +
  scale_color_manual(
    values = c("gold","#5c4cc0"))

## base layer
p1 <- ggplot(mtcars, aes(wt, mpg)) +
  theme_minimal()

p1 +
  geom_point(mapping=aes(col=hp), 
             size=5) +
  scale_color_gradient(low="gold",
                       high="red")

## back to diamonds
ggplot(diamonds, aes(color, fill=color)) +
  geom_bar() +
  scale_fill_manual(
    values = c("red", 
               "blue", 
               "gold",
               "violetred", 
               "tan3", 
               "steelblue" , 
               "slateblue3")
  )

## load ggthemes
## install.packages("ggthemes")
library(ggthemes)
library(tidyverse)
library(plotly)

myplot <- diamonds %>%
    sample_n(2000) %>%
    ggplot(aes(carat, price,col=cut)) +
    geom_point(alpha=0.5) +
  theme_fivethirtyeight()

ggplotly(myplot)
























  
  
  








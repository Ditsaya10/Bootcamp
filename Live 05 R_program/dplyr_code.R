## Data Transformation

library(tidyverse)
library(readxl)

## Read data into R
students <- read_excel("scholarships.xlsx", 1)
address <- read_excel("scholarships.xlsx", "address")
scholarship <- read_excel("scholarships.xlsx", 3)

## Vlookup (Google Sheets) == left_join (R)

## MUTATING JOIN (left, inner, right, full)
## Data Pipeline (Transform)
selected_students <- students %>%
  left_join(address, by="id") %>%
  inner_join(scholarship, by = "id")

## FILTERING JOINS (anti , semi)
## anti join - select students dont qualify for scholarships
students %>%
  left_join(address, by = "id") %>%
  anti_join(scholarship, by = "id")

students %>%
  left_join(address, by = "id") %>%
  semi_join(scholarship, by = "id")

students %>%
  left_join(address, by = "id") %>%
  inner_join(scholarship, by = "id")

## Review dplyr
mtcars <- as_tibble(mtcars)

mtcars %>%
  select(milePerGallon = mpg, 
         horsePower = hp, wt, am) %>%
  filter(horsePower > 200) %>%
  mutate(milePerGallon = milePerGallon + 1,
         am = if_else(am == 0, "Auto", "Manual")) %>%
  arrange(am, desc(horsePower)) %>%
  summarise(avg_hp = mean(horsePower),
            sd_hp = sd(horsePower),
            n = n())

## Group By + Summarise
mtcars %>%
  mutate(am = if_else(am == 0, "Auto", "Manual")) %>%
  group_by(am) %>%
  summarise(avg_hp = mean(hp),
            sd_hp = sd(hp),
            n = n())























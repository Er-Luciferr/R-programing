#Installing packages
install.packages("palmerpenguins")
library("palmerpenguins")
library(tidyverse)
#Data_cleaning_process
as_tibble(penguins)
penguins %>% 
  arrange(bill_length_mm)
#Creating new dataset
penguins_2 <- penguins %>%
  arrange(-bill_length_mm)
View(penguins_2)
#using pipes to group data
#case 1
library(palmerpenguins)
penguins_2 %>%
  group_by(island) %>%
  drop_na() %>%
  summarize(mean_bill_length <- mean(bill_length_mm))
# case 2
library(palmerpenguins)
penguins_2 %>%
  group_by(island) %>%
  drop_na() %>%
  summarize(mean_flipper_length <- mean(flipper_length_mm))
#Improvising
library(palmerpenguins)
penguins %>%
  group_by(island) %>%
  drop_na() %>%
  summarize(mean_bill_length <- mean(bill_length_mm) , mean_flipper_length <- mean(flipper_length_mm) , max_bm <- max(body_mass_g) )
# more_cleaning
library(palmerpenguins)
penguins %>%
  group_by(species , island)
filter(species == "Adelie")

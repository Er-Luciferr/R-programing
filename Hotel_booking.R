#Loading library
library(tidyverse)
library(skimr)
library(janitor)
library(readr)
library(here)
library(dplyr)

#loading data
# use \\ instead of \ 
booking_df <- read.csv("G:\\Google's Professional Certification\\R\\hotel_bookings.csv")

#studying data
colnames(booking_df)
skim_without_charts(booking_df)
as_tibble(booking_df)

#data wrangling

trim_data <- booking_df %>%
  select(is_canceled,lead_time,hotel) %>%
  rename(hotel_type = hotel)

#Joining relavent columns

final <- booking_df %>%
  mutate(guest = adults +  children  + babies )

colnames(final)

final <- select(final, -babies,-adults, -children)

final <- final %>%
  unite(date , c("arrival_date_day_of_month","arrival_date_month","arrival_date_year"), sep = " ")

summary_final <- final %>%
  summarize(number_canceled = sum(is_canceled),average_lead_time = mean(lead_time))

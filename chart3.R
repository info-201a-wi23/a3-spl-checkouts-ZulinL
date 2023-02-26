library(tidyverse)
library(ggplot2)
library(dplyr)

checkouts <- read.csv("/Users/lawclrr/Desktop/2017-2023-10-Checkouts-SPL-Data.csv") 

checkouts <- checkouts %>%
  filter(CheckoutYear != 2023)

yr_checkout <- checkouts %>% 
  group_by(CheckoutYear, CheckoutType) %>% 
  summarize(total_yr = sum(Checkouts))

ggplot(data = yr_checkout, aes(x = CheckoutYear, y = total_yr/100000, fill = CheckoutType)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Total Checkout Numbers Per Year By Checkout Types", x = "Year", 
       y = "Mean Checkout (in 100,000)") +
  scale_x_continuous(breaks = seq(2017, 2022)) + 
  scale_y_continuous(breaks = seq(0, 50, by = 5))
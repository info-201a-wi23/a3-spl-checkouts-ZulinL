library(tidyverse)
library(ggplot2)
library(dplyr)

checkouts <- read.csv("/Users/lawclrr/Desktop/2017-2023-10-Checkouts-SPL-Data.csv") 

checkouts <- checkouts %>%
  filter(CheckoutYear != 2023)

total_checkout <- checkouts %>% 
  group_by(CheckoutYear, UsageClass) %>% 
  summarize(yr_total = sum(Checkouts))

ggplot(total_checkout) +
  geom_line(aes(x = CheckoutYear, y = yr_total/100000, color = UsageClass)) +
  labs(title = "Total Checkouts for Digital and Physical Items Over Years",
       x = "Year", y = "Number of Checkouts (in 100,000)") +
  scale_x_continuous(breaks = seq(2017, 2022)) + 
  scale_y_continuous(breaks = seq(0, 50, by = 5))
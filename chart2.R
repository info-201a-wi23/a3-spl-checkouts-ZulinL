library(tidyverse)
library(ggplot2)
library(dplyr)

checkouts <- read.csv("/Users/lawclrr/Desktop/2017-2023-10-Checkouts-SPL-Data.csv") 
checkouts <- checkouts %>%
  filter(CheckoutYear == 2022)

top_material <- checkouts %>%
  group_by(MaterialType) %>%
  summarize(checkout_total = sum(Checkouts)) %>%
  arrange(-checkout_total) %>%
  head(3)
  
top_3 <- checkouts %>%
  filter(MaterialType %in% top_material$MaterialType) %>%
  group_by(CheckoutMonth, MaterialType) %>%
  summarize(checkout_mean = mean(Checkouts))

ggplot(top_3) +
  geom_line(aes(x = CheckoutMonth, y = checkout_mean, color = MaterialType)) +
  labs(title = "Average Checkout for Top Three Material Types Over Time in 2022",
       x = "Month", y = "Number of Checkouts") +
  scale_x_continuous(breaks = seq(1, 12, by = 1))
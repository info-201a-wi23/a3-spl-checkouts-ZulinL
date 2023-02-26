library(dplyr)
checkouts <- read.csv("/Users/lawclrr/Desktop/2017-2023-10-Checkouts-SPL-Data.csv") 

summary_info <- list()

# Chart 1: 
summary_info$total_checkout <- checkouts %>% 
  group_by(CheckoutYear, UsageClass) %>% 
  summarize(yr_total = sum(Checkouts))

# Chart 2: 
summary_info$top_material <- checkouts %>%
  group_by(MaterialType) %>%
  summarize(checkout_total = sum(Checkouts)) %>%
  arrange(-checkout_total) %>%
  head(3)

summary_info$top_3 <- checkouts %>%
  filter(MaterialType %in% summary_info$top_material$MaterialType) %>%
  group_by(CheckoutMonth, MaterialType) %>%
  summarize(checkout_mean = mean(Checkouts))

# Chart 3: 
summary_info$yr_checkout <- checkouts %>% 
  group_by(CheckoutYear, CheckoutType) %>% 
  summarize(total_yr = sum(Checkouts))

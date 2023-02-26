library(dplyr)
checkouts <- read.csv("/Users/lawclrr/Desktop/2017-2023-10-Checkouts-SPL-Data.csv") 
checkouts <- checkouts %>%
  filter(CheckoutYear != 2023)

summary_info <- list()

# Chart 1: 
summary_info$total_checkout <- checkouts %>% 
  group_by(CheckoutYear, UsageClass) %>% 
  summarize(yr_total = sum(Checkouts))

# Chart 2: 
summary_info$top_material <- checkouts %>%
  filter(CheckoutYear == 2022) %>%
  group_by(MaterialType) %>%
  summarize(checkout_total = sum(Checkouts)) %>%
  arrange(-checkout_total) %>%
  head(3)

summary_info$top_3 <- checkouts %>%
  filter(CheckoutYear == 2022) %>%
  filter(MaterialType %in% summary_info$top_material$MaterialType) %>%
  group_by(CheckoutMonth, MaterialType) %>%
  summarize(checkout_mean = mean(Checkouts))

# Chart 3: 
summary_info$yr_checkout <- checkouts %>% 
  group_by(CheckoutYear, CheckoutType) %>% 
  summarize(total_yr = sum(Checkouts))

#Other:
summary_info$ebook <- checkouts %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutYear) %>%
  summarize(mean_ebook = mean(Checkouts))

# scripts/00-simulate_data.R

# Load necessary libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(304)

# Simulate red light camera data
locations <- c('Dundas St W & Bathurst St', 'Yonge St & Finch Ave', 
               'King St W & Spadina Ave', 'Bloor St W & Keele St', 
               'Queen St E & Carlaw Ave', 'Eglinton Ave W & Dufferin St')
years <- 2015:2023

simulated_data <- expand.grid(location = locations, year = years) %>%
  mutate(
    year_installed = sample(2015:2017, nrow(.), replace = TRUE),
    violations = ifelse(year >= year_installed, rpois(1, lambda = 1000 - 50 * (year - year_installed)), NA),
    latitude = runif(n(), 43.6, 43.8),
    longitude = runif(n(), -79.5, -79.3)
  ) %>%
  filter(!is.na(violations))

# Save the simulated data
write_csv(simulated_data, "data/simulated_data/simulated_red_light_data.csv")


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")

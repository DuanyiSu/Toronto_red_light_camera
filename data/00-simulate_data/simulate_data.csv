#### Preamble ####
# Purpose: Simulates the data about Marriage Licence Statistics.
# Author: Duanyi Su
# Date: 19 Sept. 2024

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)

#### Simulate data ####
set.seed(304)

# Simulate data
dates <- seq.Date(from = as.Date("2020-01-01"), to = as.Date("2023-12-31"), by = "day")
count <- rpois(length(dates), lambda = 10)

simulated_data <- data.frame(Date = dates, Count = count)

write.csv(simulated_data, "simulated_marriage_data.csv", row.names = FALSE)


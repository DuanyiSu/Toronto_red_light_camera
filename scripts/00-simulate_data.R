#### Preamble ####
# Purpose: Simulates data for the Red Light Cameras dataset analysis.
# Author: Duanyi Su 
# Date: Sep 23 2024 
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Be familiar with R, dplyr package, and basic data structures.
# Any other information needed? Ensure you have all required libraries installed.

#### Workspace setup ####
library(dplyr)

#### Simulate data ####
set.seed(304)
simulated_data <- data.frame(
  camera_id = 1:100,
  location = paste("Intersection", 1:100),
  latitude = runif(100, min = 43.6, max = 43.8),
  longitude = runif(100, min = -79.6, max = -79.2),
  activation_date = sample(
    seq(as.Date('2005-01-01'),
        as.Date('2023-01-01'), by="month"), 100, replace = TRUE),
  tickets_issued = rpois(100, lambda = 30)
)

stopifnot(nrow(simulated_data) == 100)
stopifnot(all(colnames(simulated_data) == c("camera_id", "location",
                                            "latitude", "longitude",
                                            "activation_date", "tickets_issued")))

write.csv(simulated_data, "~/Downloads/Red Light Cameras Data - 4326.csv")

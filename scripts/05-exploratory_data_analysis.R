#### Preamble ####
# Purpose: Models the relationship between traffic violations and red light camera installation details
# Author: Duanyi Su
# Date: 27 September 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Requires the 'tidyverse' and 'rstanarm' packages

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_red_light_data.csv")

### Model data ####
red_light_model <-
  stan_glm(
    formula = violations ~ year_installed + latitude + longitude,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 304
  )

#### Save model ####
saveRDS(
  red_light_model,
  file = "models/red_light_model.rds"
)

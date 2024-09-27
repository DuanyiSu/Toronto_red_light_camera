#### Preamble ####
# Purpose: Cleans the raw red light camera data obtained from Open Data Toronto
# Author: Duanyi Su
# Date: 27 September 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Requires the 'tidyverse' and 'janitor' packages

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/unedited_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(intersection, year_installed, violations, latitude, longitude) |>
  filter(!is.na(year_installed)) |>
  mutate(
    violations = as.numeric(violations),
    latitude = as.numeric(latitude),
    longitude = as.numeric(longitude)
  )

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/cleaned_red_light_data.csv")

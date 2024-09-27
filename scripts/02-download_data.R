#### Preamble ####
# Purpose: Downloads and saves the red light camera data from Open Data Toronto
# Author: Duanyi Su
# Date: 27 September 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the opendatatoronto and tidyverse packages.

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# Downloading the red light camera data
rlc_package <- show_package("red-light-cameras")
rlc_resource <- list_package_resources(rlc_package) %>% filter(name == "Red Light Camera Locations")
the_raw_data <- rlc_resource %>% get_resource()

#### Save data ####
# Save the downloaded data
write_csv(the_raw_data, "data/raw_data/unedited_data.csv")

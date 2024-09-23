#### Preamble ####
# Purpose: Downloads the actual Red Light Cameras dataset from Open Data Toronto for analysis.
# Author: Duanyi Su 
# Date: Sep 23 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: The opendatatoronto package has installed.
# Any other information needed? Ensure that having a valid dataset ID.


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
dataset_id <- "9fcff3e1-3737-43cf-b410-05acd615e27b"
package <- show_package(dataset_id)

resources <- list_package_resources(package)
print(resources)

csv_resource <- resources %>%
  filter(format == "CSV")

#### Save data ####
write_csv(resources, "~/Downloads/Red Light Cameras Data - 4326.csv")

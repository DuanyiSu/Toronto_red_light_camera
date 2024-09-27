# scripts/01-download_data.R

# Load required libraries
library(opendatatoronto)
library(dplyr)

# Download the red light camera dataset
package <- show_package("red-light-cameras")
resources <- list_package_resources(package)
data <- resources %>%
  filter(name == "Red Light Camera Locations") %>%
  get_resource()

# Save the raw data
write_csv(data, "data/raw_data/red_light_camera_raw.csv")

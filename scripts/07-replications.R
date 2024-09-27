#### Preamble ####
# Purpose: Replicates graphs to visualize red light camera data trends and patterns
# Author: Duanyi Su
# Date: 27 September 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Requires the 'tidyverse' package for data visualization

#### Workspace setup ####
library(tidyverse)

#### Load data ####
analysis_data <- read_csv("data/analysis_data/cleaned_red_light_data.csv")

#### Replicate graphs ####
# Example: Plotting the trend of violations over the years
ggplot(analysis_data, aes(x = year_installed, y = violations)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Red Light Violations Over Time",
       x = "Year Installed",
       y = "Number of Violations")

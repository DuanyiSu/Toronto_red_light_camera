#### Preamble ####
# Purpose: Tests the cleaned red light camera data for accuracy and integrity
# Author: Duanyi Su
# Date: 27 September 2024
# Contact: duanyi.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Requires the 'tidyverse' and 'testthat' packages

#### Workspace setup ####
library(tidyverse)
library(testthat)

# Load the cleaned analysis data
analysis_data <- read_csv("data/analysis_data/cleaned_red_light_data.csv")

#### Test data ####
# Test that the dataset has the expected number of rows (e.g., based on known observations)
test_that("dataset has the expected number of rows", {
  expect_equal(nrow(analysis_data), 54) # Update 54 with the actual expected row count if needed
})

# Test that the dataset has 5 columns
test_that("dataset has 5 columns", {
  expect_equal(ncol(analysis_data), 5)
})

# Test that each column is of the expected data type
test_that("'intersection' is character", {
  expect_type(analysis_data$intersection, "character")
})

test_that("'year_installed' is numeric", {
  expect_type(analysis_data$year_installed, "double")
})

test_that("'violations' is numeric", {
  expect_type(analysis_data$violations, "double")
})

test_that("'latitude' and 'longitude' are numeric", {
  expect_type(analysis_data$latitude, "double")
  expect_type(analysis_data$longitude, "double")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that 'intersection' contains unique values
test_that("'intersection' column contains unique values", {
  expect_equal(length(unique(analysis_data$intersection)), nrow(analysis_data))
})

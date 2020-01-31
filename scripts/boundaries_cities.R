# Joins boundaries andcities
# Creates rds with all data
# Source: https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson
#         https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv


# Author: Nicolas Rodriguez
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
# City data file
file_city_evictions <- here::here("data/sc_city_evictions.rds")
# Boundaries data file
file_boundaries <- here::here("data/sc_city_boundaries.rds")
# Output file
file_out <- here::here("data/sc_boundaries_convictions.rds")

#===============================================================================

boundaries <-
  file_boundaries %>%
  read_rds()

file_city_evictions %>%
  read_rds() %>%
  left_join(boundaries, by = "geoid") %>%
  write_rds(file_out)



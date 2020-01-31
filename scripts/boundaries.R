# Download: South Carolina City Boundaries
# Supplier: The Eviction Lab of Princeton University
# Source: https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson

# Author: Nicolas Rodriguez
# Version: 2020-01-30

# Libraries
library(tidyverse)
library(sf)

# Parameters
# Input Data

file_raw <- here::here("data-raw/cities.geojson")

column_names <-
  c(
    geoid = "GEOID",
    name = "n",
    geometry = "geometry"
  )

file_out <- here::here("data/sc_city_boundaries.rds")

#===============================================================================

file_raw %>%
  sf::read_sf() %>%
  rename(!!! column_names) %>%
  select(geoid, name, geometry) %>%
  write_rds((file_out))

# Download: South Carolina Evictions Data
# Supplier: The Eviction Lab at Princeton University
# Source: https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv

# Author: Nicolas Rodriguez
# Version: 2020-01-30

# Libraries
library(tidyverse)


# Parameters
# Input data

file_raw <- here::here("data-raw/cities.csv")


column_names <-
  c(
    geoid = "GEOID",
    year = "year",
    name = "name",
    evictions = "evictions"
  )

file_out <- here::here("data/sc_city_evictions.rds")

#===============================================================================

file_raw %>%
  read_csv(
    col_types =
      cols(
        GEOID = col_character(),
        year = col_integer(),
        name = col_character(),
        evictions = col_double()
      )
  ) %>%
  filter(year == 2016) %>%
  rename(!!! column_names) %>%
  select(geoid, year, name, evictions) %>%
  write_rds((file_out))

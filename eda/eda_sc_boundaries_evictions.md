2020-01-31

``` r
# Libraries
library(tidyverse)

# Parameters
sc_eviction_boundaries <- here::here("data/sc_boundaries_convictions.rds")

#===============================================================================

# Code
```

``` r
df <- read_rds(sc_eviction_boundaries)

df %>%
  top_n(1, evictions)
```

    ## # A tibble: 1 x 6
    ##   geoid    year name.x           evictions name.y           geometry
    ##   <chr>   <int> <chr>                <dbl> <chr>            <list>  
    ## 1 4550875  2016 North Charleston     3660. North Charleston <XY>

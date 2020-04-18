library(tigris)
library(tidyverse)
library(tidycensus)
library(ggplot2)

census_api_key('b7a25a2c31338c9a9c54ab2fc6091328496f75e1')
egrid_data <- read_excel('./egrid2016_data.xlsx', skip =1, 'US16')
acs_2016 <- load_variables(2016, 'acs5', cache = TRUE)

co2_pc_global <- read_csv('./co-emissions-per-capita.csv')
#state_income <- get_acs(geography = 'state',
#                        variables = '')
# View(acs_2016)
head(acs_2016)
head(egrid_data)
head(co2_pc_global)
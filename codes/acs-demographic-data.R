
install.packages("tidycensus")


# Data from census

library(tidycensus)
library(tidyverse)


### Uploading the Key to access to the ACS's API

census_api_key("94b2e4e0fbd4ea5b12065dabc6c8b7292a615248", install = TRUE)


ldf <- list() # creates a list

# To chose variables to subset
# 
acs_vars <- load_variables(2022, "acs5", cache = TRUE)


# Load ACS data for Baltimore City census tracts
baltimore_data21 <- get_acs(
    geography = "tract",
    variables = c(
        median_income = "B19013_001",
        population = "B01003_001",
        white_population = "B02001_002",
        black_population = "B02001_003",
        hispanic_population = "B03002_012",
        owner_occupied = "B25003_002",
        renter_occupied = "B25003_003",
        median_rent = "B25064_001",
        disabilities = "C18120_001",
        male_population = "B01001_002",
        female_population = "B01001_026",
        High_school_graduate =   "B15003_017",
        Bachelor_degree_holders= " B15003_022",
        graduate_degree_holders = "B15003_025",  # Graduate or professional degree holders
        age_35_44 = "B01001_020",  # Ages 35-44
        age_45_54 = "B01001_021",  # Ages 45-54 (prime tax-paying ages)
        age_65_plus = "B01001_023",  # Ages 65+ (older adults more likely to face financial instability)
        foreign_born = "B05002_013",  # Total foreign-born population
        naturalized_citizens = "B05001_006",  # Naturalized citizens
        poverty_below = "B17001_002",  # Number of people below poverty level
        per_capita_income = "B19301_001"  # Per capita income
        
    ),    state = "MD",
    county = "Baltimore City",
    year = 2021
)




baltimore_data22 <- get_acs(
    geography = "tract",
    variables = c(
        median_income = "B19013_001",
        population = "B01003_001",
        white_population = "B02001_002",
        black_population = "B02001_003",
        hispanic_population = "B03002_012",
        owner_occupied = "B25003_002",
        renter_occupied = "B25003_003",
        median_rent = "B25064_001",
        disabilities = "C18120_001",
        male_population = "B01001_002",
        female_population = "B01001_026",
        High_school_graduate =   "B15003_017",
        Bachelor_degree_holders= " B15003_022",
        graduate_degree_holders = "B15003_025",  # Graduate or professional degree holders
        age_35_44 = "B01001_020",  # Ages 35-44
        age_45_54 = "B01001_021",  # Ages 45-54 (prime tax-paying ages)
        age_65_plus = "B01001_023",  # Ages 65+ (older adults more likely to face financial instability)
        foreign_born = "B05002_013",  # Total foreign-born population
        naturalized_citizens = "B05001_006",  # Naturalized citizens
        poverty_below = "B17001_002",  # Number of people below poverty level
        per_capita_income = "B19301_001"  # Per capita income
        
    ),    state = "MD",
    county = "Baltimore City",
    year = 2022
)

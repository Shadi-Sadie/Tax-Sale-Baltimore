install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)


library(httr)
library(jsonlite)
library(dplyr)


# Define a function for geocoding
geocode_census <- function(address) {
    # Set up the API endpoint and parameters
    base_url <- "https://geocoding.geo.census.gov/geocoder/geographies/onelineaddress"
    params <- list(
        address = address,
        benchmark = "Public_AR_Current",
        vintage = "Current_Current", 
        format = "json"
    )
    
    # Make the GET request
    response <- GET(base_url, query = params)
    
    # Parse the JSON response
    if (status_code(response) == 200) {
        data <- fromJSON(content(response, as = "text"))
        matches <- data$result$addressMatches
        if (length(matches) > 0) {
            # Extract latitude, longitude, and GEOID (tract/block)
            lat <- matches[[3]]$y
            lon <- matches[[3]]$x
            geoid <- matches[[2]]$`Census Tracts`[[1]]$GEOID
            return(data.frame(address = address, latitude = lat, longitude = lon, GEOID = geoid))
        } else {
            return(data.frame(address = address, latitude = NA, longitude = NA, GEOID = NA))
        }
    } else {
        stop("Error: ", status_code(response))
    }
}



result <- geocode_census("1600 Pennsylvania Ave NW, Washington, DC")





###############################################################################


address_df <- data.frame(address = c(
    "1600 Pennsylvania Ave NW, Washington, DC",
    "350 Fifth Ave, New York, NY"
))
    
    
geocoded_data <- do.call(rbind, lapply(address, geocode_census))


address<-paste0(trimws(subadd$PROPERTY_ADDRESS), ",Baltimore")

geocoded_data <- bind_rows(lapply(address, function(address) {
    geocode_census(address)
}))    


df1 <- tibble(x = 1:2, y = letters[1:2])
df2 <- tibble(x = 4:5, z = 1:2)





geocode_census("350 Fifth Ave, New York, NY")












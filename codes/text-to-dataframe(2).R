addresses <- c()
block_lots<- c()
lot_sizes <-c()
assessed_values <- c()
owner_names <- c()
liens <- c()

# Process each page of the PDF

    # Iterate through each line to extract data
    for(line in combined_lines) {
        if(grepl("ASSESSED FOR", line)) {
            # Split the line at "ASSESSED FOR"
            parts <- strsplit(line, "ASSESSED FOR")[[1]]
            address_part <- parts[1]
            value_part <- parts[2]
            
            # Extract address, lot number, and block number
            address_split <- strsplit(address_part, "\\(")[[1]]
            address <- trimws(address_split[1])
            
            # Lot size is located after parentheses before "ASSESSED FOR"
            block_lot_split <- strsplit(address_split[2], "\\)")[[1]]
            block_lot <- gsub("\\)", "", trimws(block_lot_split[1]))
            lot_size <- trimws(gsub("ACRES", "", block_lot_split[2] ))
            
            
            # Extract owner name and assessed value
            value_split <- strsplit(value_part, " TO ")[[1]]
            assessed_value <- gsub("\\s*ACRES\\s*", "", trimws(value_split[1]))
            owner_lien_split <- strsplit(value_split[2], "\\$")[[1]]
            owner_name <- trimws(owner_lien_split[1])
            lien <- trimws(owner_lien_split[2])
            # Now split owner name and lien amount
            
            # Append to lists
            addresses <- c(addresses, address)
            block_lots <- c(block_lots, block_lot)
            lot_sizes <- c(lot_sizes, lot_size)
            assessed_values <- c(assessed_values, assessed_value)
            owner_names <- c(owner_names, owner_name)
            liens <- c (liens, lien)
        }
    }

# Combine the extracted data into a data frame
df <- data.frame(
    Count = seq_along(addresses),
    Address = addresses,
    block_lot = block_lots,
    lot_size = lot_sizes,
    Owner_Name = owner_names,
    assessed_value = assessed_values,
    lien = liens,
    stringsAsFactors = FALSE
)



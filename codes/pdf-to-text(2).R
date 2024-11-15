library(tabulapdf)
library(stringr)  # Ensure stringr is loaded for str_split and trimws
library(pdftools)
library(dplyr)
library(readxl)
#library(tabulizer)
library(stringr)
library(tabulapdf)

file_path <- "data pdf/2018-Tax-sale.pdf"

# Get the number of pages in the PDF
num_pages <- pdf_info(file_path)$pages



# Initialize an empty list to store combined lines
combined_lines <- list()

# Loop through the specified pages of the PDF
for (page_num in 2:num_pages) {
    # Extract text from the current page
    temp <- extract_text(file_path, page_num)
    
    # Split the extracted text into lines
    #split_lines <- str_split(temp, "\n")[[1]]  # Extract the first element (lines)
    split_lines <- str_trim(str_split(temp, "\n")[[1]])
    
    # Initialize an empty string for the current line
    current_line <- ""
    # Initialize a flag to track if the previous line starts with '**'
    previous_line_stars <- FALSE
    # Initialize a flag to track if the previous line matches the digit+special char pattern
    previous_line_matches_digit_pattern <- FALSE
    
    # Loop through the split_lines to concatenate as needed
    for (i in seq_along(split_lines)[-1]) {  # Exclude the first element
        # Define the conditions for concatenation
        is_starts_with_stars <- grepl("^\\*\\*", split_lines[[i]])
        is_starts_with_digit <- grepl("^\\d+.*[\\(#].*$", split_lines[[i]])


        # Update the flag for whether the previous line matches the digit pattern
        if (i > 1) {
            previous_line_matches_digit_pattern <- grepl("^\\d+.*[\\(#].*$", split_lines[[i - 1]])
        }
        
        # Concatenate the line if:
        # 1. It doesn't start with '**' or digits.
        # 2. OR it starts with digits, but the previous line started with '**' or matches the digit+special char pattern.
        if (!is_starts_with_stars && (!is_starts_with_digit || previous_line_stars || previous_line_matches_digit_pattern)) {
            # Concatenate the current line with the previous part
            current_line <- paste0(current_line, " ", trimws(split_lines[[i]]))
        } else {
            # If a new section starts, save the previous combined line
            if (current_line != "") {
                combined_lines <- append(combined_lines, trimws(current_line))  # Save previous combined line
                current_line <- ""  # Reset for the new section
            }
            # Start the new section with the current line
            current_line <- trimws(split_lines[[i]])
        }
        
        # Update the flag to track if the current line starts with '**'
        previous_line_stars <- is_starts_with_stars
    }
    
    # Append any remaining line after the loop ends
    if (current_line != "") {
        combined_lines <- append(combined_lines, trimws(current_line))
    }
}


# At the end, 'combined_lines' will hold the properly concatenated lines





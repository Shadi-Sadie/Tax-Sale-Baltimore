# Load necessary libraries
library(tabulapdf)
library(stringr)  # Ensure stringr is loaded for str_split and trimws
library(pdftools)
library(dplyr)
library(readxl)
#library(tabulizer)
library(stringr)
library(tabulapdf)


# Define the file path to the PDF
file_path <- "data pdf/2021-Tax-sale.pdf"

# Get the number of pages in the PDF
num_pages <- pdf_info(file_path)$pages


# Initialize an empty list to store combined lines from all pages
combined_lines <- list()


# Loop through all pages of the PDF
for (page_num in 2:num_pages) {
    # Extract text from the current page
    temp <- extract_text(file_path, page_num)
    
    # Split the extracted text into lines
    split_lines <- str_split(temp, "\n")[[1]]  # Extract the first element (lines)
    
    # Initialize an empty string for the current line
    current_line <- ""
    # Initialize a flag to track if the previous line starts with '**'
    previous_line_stars <- FALSE
    

    
    # Loop through the split_lines to concatenate as needed
    for (i in seq_along(split_lines)[-1]) {  # Exclude the first element
        # Define the conditions for concatenation
        is_starts_with_stars <- grepl("^\\*\\*", split_lines[[i]])
       # is_starts_with_digit <- grepl("^\\d+.*\\(.*$", split_lines[[i]])
        is_starts_with_digit <- grepl("^\\d+.*[\\(#].*$", split_lines[[i]])
        
        # Concatenate the line if:
        # 1. It doesn't start with '**' or digits (the original rule).
        # 2. OR if it starts with digits, but the previous line started with '**'.
        if (!is_starts_with_stars && (!is_starts_with_digit || previous_line_stars)) {

            current_line <- paste0(current_line, " ", trimws(split_lines[[i]]))
        } else {
            # If we encounter a new section, save the current combined line
            if (current_line != "") {
                combined_lines <- append(combined_lines, trimws(current_line))  # Use append
                current_line <- ""
            }
            # Start the new section with the current line
            current_line <- trimws(split_lines[[i]])
        }
        
        # Update the flag to track if the current line starts with '**'
        previous_line_stars <- is_starts_with_stars
    }
    
    # Append any remaining line after the loop
    if (current_line != "") {
        combined_lines <- append(combined_lines, trimws(current_line))  # Use append
    }
}

# Now combined_lines will contain the concatenated text from all pages


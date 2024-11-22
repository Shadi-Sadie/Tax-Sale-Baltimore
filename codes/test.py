from geopy.geocoders import Nominatim
import pandas as pd
import time


# Load data


# Corrected URL

# Load the CSV file directly from Google Drive
block_data = pd.read_csv("data/D24.csv")
print(block_data.head())

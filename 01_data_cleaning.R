# ==========================================
# Step 1: Data Cleaning and Preparation
# Project: Cyclistic Bike-Share Analysis
# ==========================================

# Load required libraries
library(tidyverse)
library(lubridate)

# Define path to the directory containing 12 CSV files
path_to_data <- "your/path/to/csv/folder/"

# List all CSV files in the directory
files <- list.files(path = path_to_data, pattern = "*.csv", full.names = TRUE)

# Import and merge all 12 CSV files into one dataframe
# Reading all columns as character to avoid data type conflicts during binding
all_trips <- files %>% 
  map_df(~read_csv(.x, col_types = cols(.default = "c")))

# Convert date columns and numeric columns to correct formats
all_trips <- all_trips %>% 
  mutate(
    started_at = ymd_hms(started_at),
    ended_at = ymd_hms(ended_at)
  )

# Clean data:
# 1. Calculate ride length in seconds
# 2. Extract day of week and month from started_at
all_trips_cleaned <- all_trips %>% 
  mutate(
    ride_length_sec = as.numeric(ended_at - started_at),
    day_of_week = wday(started_at, label = FALSE), # 1 = Sunday, 7 = Saturday
    month = month(started_at)
  )

# Filter out bad data (trips less than or equal to 0 seconds)
all_trips_v2 <- all_trips_cleaned %>% 
  filter(ride_length_sec > 0)

# Check total row count after cleaning (should be around 6.4 million)
nrow(all_trips_v2)
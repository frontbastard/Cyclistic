# ==========================================
# Step 2: Data Analysis and Visualization
# Project: Cyclistic Bike-Share Analysis
# ==========================================

# Load required libraries
library(tidyverse)

# Note: This script assumes 'all_trips_v2' is already in your environment 
# from the previous cleaning step.

# ------------------------------------------
# 1. Overall Trip Proportions
# ------------------------------------------
# Checking total breakdown of trips between members and casuals
all_trips_v2 %>% 
  group_by(member_casual) %>% 
  summarize(
    total_trips = n(),
    percentage = (n() / nrow(all_trips_v2)) * 100
  )

# ------------------------------------------
# 2. Weekly Activity and Average Ride Length
# ------------------------------------------
# Checking average ride length (in minutes) for each day of the week
# 1 = Sunday, 7 = Saturday
all_trips_v2 %>% 
  group_by(member_casual, day_of_week) %>% 
  summarize(
    number_of_rides = n(),
    avg_ride_length_min = mean(ride_length_sec) / 60
  )

# Plotting weekly activity (Number of Rides)
all_trips_v2 %>% 
  group_by(member_casual, day_of_week) %>% 
  summarize(number_of_rides = n()) %>% 
  ggplot(aes(x = factor(day_of_week), y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Number of Rides by Day of the Week",
    x = "Day of Week (1 = Sunday, 7 = Saturday)",
    y = "Total Number of Rides",
    fill = "User Type"
  )

# ------------------------------------------
# 3. Monthly Activity (Seasonality)
# ------------------------------------------
# Checking how ridership changes across 12 months
all_trips_v2 %>% 
  group_by(member_casual, month) %>% 
  summarize(
    number_of_rides = n(),
    avg_length_minutes = mean(ride_length_sec) / 60
  ) %>% 
  print(n = 24)
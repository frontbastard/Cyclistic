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

# Plotting weekly activity (Number of Rides) with proper day names
all_trips_v2 %>% 
  mutate(day_name = wday(started_at, label = TRUE, abbr = FALSE)) %>% 
  group_by(member_casual, day_name) %>% 
  summarize(number_of_rides = n(), .groups = "drop") %>% 
  ggplot(aes(x = day_name, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::comma) + # Removes scientific notation like 5e+05
  labs(
    title = "Ridership: Weekly Activity Comparison",
    subtitle = "Number of rides per day for members vs casual riders",
    x = "Day of the Week",
    y = "Total Number of Rides",
    fill = "User Type"
  ) +
  theme_minimal() # Clean, modern look without heavy gray background

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

# Plotting monthly activity (Seasonality) using a Line Chart
all_trips_v2 %>% 
  group_by(member_casual, month) %>% 
  summarize(number_of_rides = n(), .groups = "drop") %>% 
  ggplot(aes(x = factor(month), y = number_of_rides, group = member_casual, color = member_casual)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Ridership: Monthly Seasonality Trend",
    subtitle = "Total rides per month demonstrating high volatility among casual users",
    x = "Month (1 = January, 12 = December)",
    y = "Total Number of Rides",
    color = "User Type"
  ) +
  theme_minimal()

# Plotting average ride length by user type and day of week
all_trips_v2 %>% 
  mutate(day_name = wday(started_at, label = TRUE, abbr = FALSE)) %>% 
  group_by(member_casual, day_name) %>% 
  summarize(average_ride_length_min = mean(ride_length_sec) / 60, .groups = "drop") %>% 
  ggplot(aes(x = day_name, y = average_ride_length_min, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Ridership: Average Ride Length Comparison",
    subtitle = "Casual riders consistently take much longer trips, especially on weekends",
    x = "Day of the Week",
    y = "Average Trip Duration (minutes)",
    fill = "User Type"
  ) +
  theme_minimal()

# Analyzing bike type preferences by user type
all_trips_v2 %>% 
  group_by(member_casual, rideable_type) %>% 
  summarize(number_of_rides = n(), .groups = "drop") %>% 
  ggplot(aes(x = rideable_type, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Ridership: Bike Type Preferences",
    subtitle = "Distribution of bike types used by casual riders vs members",
    x = "Bike Type",
    y = "Number of Rides",
    fill = "User Type"
  ) +
  theme_minimal()

# Top 10 start stations for casual riders
all_trips_v2 %>% 
  filter(member_casual == "casual", !is.na(start_station_name)) %>% 
  group_by(start_station_name) %>% 
  summarize(number_of_rides = n(), .groups = "drop") %>% 
  slice_max(order_by = number_of_rides, n = 10)

# Visualizing Top 10 start stations for casual riders vs members
top_casual_stations <- all_trips_v2 %>% 
  filter(member_casual == "casual", !is.na(start_station_name)) %>% 
  group_by(start_station_name) %>% 
  summarize(number_of_rides = n(), .groups = "drop") %>% 
  slice_max(order_by = number_of_rides, n = 10) %>% 
  pull(start_station_name)

all_trips_v2 %>% 
  filter(start_station_name %in% top_casual_stations) %>% 
  group_by(start_station_name, member_casual) %>% 
  summarize(number_of_rides = n(), .groups = "drop") %>% 
  ggplot(aes(x = reorder(start_station_name, number_of_rides), y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Ridership: Top 10 Casual Start Stations Comparison",
    subtitle = "Casual riders heavily dominate key tourist spots and leisure areas",
    x = "Station Name",
    y = "Number of Rides",
    fill = "User Type"
  ) +
  theme_minimal()
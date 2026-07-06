# Cyclistic Bike-Share Case Study

## Project Overview
This project is part of my Data Analytics portfolio. The goal is to analyze historical trip data from Cyclistic, a fictional bike-share company in Chicago, to understand how casual riders and annual members use the system differently. 

The ultimate business objective is to design marketing strategies aimed at converting casual riders into annual members.

## Data Source
The analysis uses Cyclistic's historical trip data (approx. 1.2 GB, over 6 million rows). Due to GitHub file size limitations, the raw CSV data is ignored via `.gitignore` and kept locally, while the processing scripts are fully documented here.

## Project Structure
* `01_data_cleaning.R`: R script for data ingestion (`purrr::map_df`), data type alignment, formatting dates, and filtering anomalies.
* `02_data_analysis.R`: R script containing exploratory data analysis (EDA) and visualization logic using `tidyverse` and `ggplot2`.

## Key Insights Discovered So Far
1. **User Behavior**: Annual members are "commuters" who primarily use bikes on weekdays for fixed-duration trips (averaging 12-13 minutes). Casual riders are "leisure users" who dominate the weekends and take much longer trips (averaging 25+ minutes).
2. **Seasonality**: Casual ridership is highly volatile and weather-dependent, dropping by over 90% in winter. Member ridership remains the steady backbone of the company, maintaining stable activity even in colder months.

## Technologies Used
* **R Programming Language**
* **tidyverse** (for data manipulation)
* **lubridate** (for date-time extraction)
* **ggplot2** (for data visualization)
* **Git/GitHub** (for version control)

---
*Created by Pavlo Sokolov - 2026*
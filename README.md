# Cyclistic Bike-Share Case Study

## Project Overview
This project is part of my Data Analytics portfolio. The goal is to analyze historical trip data from Cyclistic, a fictional bike-share company in Chicago, to understand how casual riders and annual members use the system differently. 

The ultimate business objective is to design targeted marketing strategies aimed at converting casual riders into annual members.

### 🔗 [View Interactive HTML Report](https://frontbastard.github.io/Cyclistic/cyclistic_report.html)

## Data Source
The analysis uses Cyclistic's historical trip data. Due to GitHub file size limitations, the raw and processed datasets are ignored via `.gitignore` and kept locally, while the processing, analysis, and reporting scripts are fully documented here.

## Project Structure
* `01_data_cleaning.R`: R script for data ingestion, data type alignment, formatting dates, and filtering anomalies.
* `02_data_analysis.R`: R script containing exploratory data analysis (EDA) and visualization logic using `tidyverse` and `ggplot2`.
* `cyclistic_report.Rmd`: The final R Markdown file combining the analysis narrative, code chunks, and data visualizations.
* `cyclistic_report.html`: The generated standalone HTML document deployed via GitHub Pages for stakeholders.

## Key Insights Discovered
1. **User Behavior**: Annual members act as "commuters" who primarily ride on weekdays for fixed-duration trips (averaging 12-13 minutes). Casual riders are "leisure users" who dominate the weekends and take much longer trips (averaging ~25+ minutes).
2. **Seasonality**: Casual ridership is highly volatile and weather-dependent, peaking in summer (June–August). Member ridership remains the steady financial backbone of the company, maintaining stable activity even in colder months.
3. **Geography**: Casual riders heavily dominate waterfront stations and tourist hubs (e.g., *Navy Pier*, *Millennium Park*), whereas annual members rarely start their journeys from these leisure-focused locations.

## Business Recommendations
* **Targeted Campaigns**: Deploy hyper-local physical and digital marketing efforts directly at the top casual stations (*Navy Pier*, *Millennium Park*) strictly during the peak summer months.
* **The "Weekend Warrior" Membership**: Design a weekend-focused subscription tier demonstrating the cost-savings of a membership over a full summer compared to per-minute casual rates.
* **Electric Bike Perks**: Introduce member-only discounts or waived unlocking fees for e-bikes to leverage their massive popularity among casual riders.

## Technologies Used
* **R Programming Language**
* **tidyverse** (dplyr, ggplot2, purrr, lubridate, scales)
* **R Markdown** (for dynamic business reporting)
* **Git/GitHub** (for version control and hosting)

---
*Created by Pavlo Sokolov - 2026*

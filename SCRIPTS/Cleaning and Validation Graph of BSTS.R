# Load necessary libraries
library(ggplot2)
library(dplyr)
library(lubridate)

data <- read.csv("Taxi_Trips_Count.csv")

file_path <- file.choose()
data <- read.csv(file_path)

head(data)


data$Trip.Start.Timestamp <- as.POSIXct(data$Trip.Start.Timestamp, format="%m/%d/%Y %I:%M:%S %p")
head(data)
colnames(data)[colnames(data) == "Trip.Start.Timestamp"] <- "datetime"

# Check if the column has been renamed correctly
head(data)

############# delete check with prof
data$date <- floor_date(data$datetime , unit = "day")
data$floor_hour <- hour(data$datetime )#group by both day and hour, then sum the Taxi.ID

# Group the data by date and hour, and then summarize the trip count
result <- data %>%
  group_by(date, floor_hour) %>%
  summarise(Trip_Count = sum(Taxi.ID, na.rm = TRUE), .groups = "drop")

# Now, aggregate by date to get daily trip counts
daily_agg <- result %>%
  group_by(date) %>%
  summarise(daily_trip_count = sum(Trip_Count, na.rm = TRUE))

# Print the aggregated result to check
print(daily_agg)

# Create the plot
ggplot(daily_agg, aes(x = date, y = daily_trip_count)) +
  geom_line(color = "blue") +           # Line plot
  labs(title = "Daily Taxi Trip Counts", 
       x = "Date", 
       y = "Number of Taxi Trips") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
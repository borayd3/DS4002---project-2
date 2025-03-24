----------------------------------------------------------------------------------
  #### BSTS
library(forecast)
library(tseries)
library(lubridate)
library(dplyr)
library(xts)
library(bsts)

# Convert date column to Date type
data$date <- as.Date(data$date, format="%m/%d/%Y")

# Ensure floor_hour remains as a separate column
data$floor_hour <- as.integer(data$floor_hour)  # Ensure it's numeric

# Convert floor_hour into a time format
data$datetime <- as.POSIXct(paste(data$date, sprintf("%02d:00:00", data$floor_hour)), format="%Y-%m-%d %H:%M:%S")

# Ensure Taxi.ID is treated as ride counts
data <- data %>%
  select(datetime, date, floor_hour, Taxi.ID) %>%
  rename(ride_count = Taxi.ID)

# View first few rows to confirm changes
head(data)

# Define training and test sets
train_data <- data %>% filter(datetime >= "2023-10-01" & datetime < "2023-10-30")
test_data <- data %>% filter(datetime >= "2023-10-30" & datetime < "2023-10-31")

# Convert to time-series object
y_train <- ts(train_data$ride_count, frequency=24)  # Hourly data

# Define state space model with trend and seasonal components
ss <- AddLocalLinearTrend(list(), y_train)  # Trend Component
ss <- AddSeasonal(ss, y_train, nseasons=24)  # Hourly Seasonality

# Fit BSTS Model
bsts_model <- bsts(y_train, 
                   state.specification = ss, 
                   niter = 1000)  # Number of iterations

# Define forecast horizon
horizon <- 24

# Predict next 24 hours
bsts_pred <- predict(bsts_model, horizon = horizon)

# Extract median predictions
forecast_values <- bsts_pred$mean

# Create a DataFrame for visualization

forecast_df <- data.frame(
  datetime = seq(from = as.POSIXct("2023-10-30 00:00:00"), by = "hour", length.out = horizon),
  predicted_ridership = forecast_values)

# Plot Predictions
library(ggplot2)
ggplot(forecast_df, aes(x = datetime, y = predicted_ridership)) +
  geom_line(color = "blue", size = 1) +
  ggtitle("BSTS Forecast for October 30th, 2023") +
  xlab("Hour") + ylab("Predicted Ride Count")
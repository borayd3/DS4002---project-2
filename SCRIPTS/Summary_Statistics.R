library(lubridate)  
library(dplyr)      
library(ggplot2)    
library(ggthemes)

data <- read.csv("/Users/siobhanflood/Desktop/Taxi_Trips_Counts.csv")
head(data)


summary(data$Taxi.ID)

count <- length(data$Taxi.ID)
print(count)
total_rides <- sum(data$Taxi.ID, na.rm = TRUE)
print(total_rides)

std_dev <- sd(data$Taxi.ID, na.rm = TRUE)
print(std_dev)


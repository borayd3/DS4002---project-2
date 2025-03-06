library(lubridate)  
library(dplyr)      
library(ggplot2)    
library("ggthemes")
library(xts)   


# first graphy, prob conssnt variation no need for logrithmic, but will still do if want more than graph
# Set your working directory (or go to Session > set working directory)
# setwd("/path/to/your/directory")

######################################### set up
data <- read.csv("Taxi_Trips_Count.csv")
head(data)

data$Trip.Start.Timestamp <- as.POSIXct(data$Trip.Start.Timestamp, format="%m/%d/%Y %I:%M:%S %p")
head(data)
colnames(data)[colnames(data) == "Trip.Start.Timestamp"] <- "datetime"

# Check if the column has been renamed correctly
head(data)

############# delete check with prof
data$date <- floor_date(data$datetime , unit = "day")
data$floor_hour <- hour(data$datetime )#group by both day and hour, then sum the Taxi.ID

result <- data %>%
  group_by(date, floor_hour) %>%
  summarise(Trip_Count = sum(Taxi.ID, na.rm = TRUE), .groups = "drop")

print(result)
########################## Delete check with prof First time series graph
trip_count_ts <- ts(result$Trip_Count, freq=24, start=c(1)) # seasonality present,some variance, relatively mean centered)
plot(trip_count_ts, type ='l')
points(trip_count_ts, pch = 1, cex=0.6)

############### prettier graph
trip_count_df <- data.frame(
  Time = time(trip_count_ts),
  Trip_Count = as.vector(trip_count_ts)
)
library(gridExtra)

ggplot(trip_count_df, aes(x = Time, y = Trip_Count)) +
  geom_line(size = 1.0) +                            
  geom_point(size = 1.65) +                            
  labs(
    title = "Ridership Over October 2023",                   
    x = "Day",                                       
    y = "Trip Count"                                  
  ) +
  theme_economist() +                                 
  scale_colour_economist() # first graphy, prob conssnt variation no need for logrithmic, but will still do if want more than graph


##################################################################################################seperate into training and test
train_data <- result %>% 
  filter(date != "2023-10-30") 

test_data <- result %>% 
  filter(date == "2023-10-30")

head(train_data)
tail(train_data) # Does not include 30th
###############

log_returns <- log(train_data$Trip_Count)
log_returns <- ts(log_returns, frequency = 24,start = c(1)) # does not fo up to 30, it ends right befroe midnight on the 29th

plot(log_returns, type ='l')
points(log_returns, pch = 1, cex=0.6)

########## same graph prettier
log_returns_df <- data.frame(Time = time(log_returns), Log_Returns = log_returns)

# Create ggplot following the desired pattern
ggplot(log_returns_df, aes(x = Time, y = Log_Returns)) +
  geom_line(size = 1.0) +                            
  geom_point(size = 1.65) +                            
  labs(
    title = "Ridership Over October 2023",                   
    x = "Day",                                       
    y = "Log Trip Count"                                  
  ) +
  theme_economist() +                                 
  scale_colour_economist()

#####################

diff_fst_log <- diff(train_data$Trip_Count) # want to see if we could stabalize the mean, mean wasnt constant originally, 5 long peaks, 2 small oeaks. becaude subbtractine next time index by the one before, the difference will aocunt for any huge changes that might of happen. looking at this graph, still variance, most likey seasonal,

plot(diff_fst_log, xlab = 'Time', ylab = "First difference", type='l', main= "TS Plot of Differenced Trip Count Returns")

diff_fst_log_df <- data.frame(Time = time(diff_fst_log), Diff = diff_fst_log)

ggplot(diff_fst_log_df, aes(x = Time, y = Diff)) +
  geom_line(size = 1.0) +                            
  geom_point(size = 1.65) +                            
  labs(
    title = "TS Plot of Differenced Trip Count Returns October 2023",                   
    x = "Hour",                                       
    y = "First Difference"                                  
  ) +
  theme_economist() +                                 
  scale_colour_economist()


#######################\
ds_log_s <- diff(diff_fst_log, 24) # seasonal differncing- now mean centered around 0, can see seasonality now accounted for, as ckose as we can get .

plot(ds_log_s, xlab = 'Time', ylab = "Log returns", type='l')
points(ds_log_s,pch=1, cex=0.7)

ds_log_s_df <- data.frame(Time = time(ds_log_s), Diff = ds_log_s)


ggplot(ds_log_s_df, aes(x = Time, y = Diff)) +
  geom_line(size = 1.0) +                            
  geom_point(size = 1.65) +                            
  labs(
    title = "TS Plot of Seasonal Differenced Trip Count Returns October 2023",                   
    x = "Hour",                                       
    y = "Seasonal Difference"                                  
  ) +
  theme_economist() +                                 
  scale_colour_economist()

diff_log_seasonal <- diff(ds_log_returns)






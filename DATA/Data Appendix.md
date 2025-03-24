# Data Appendix

## Chicago Taxi Dataset

### Unit of Observation:
Each observation in the dataset corresponds to the total number of taxi rides that began within a given timestamp. The dataset is structured as a time series with one hour intervals, meaning that each row captures the ride count for every hour period between October 1 and October 30, 2023.

Trip Start Timestamp

### Variables:
- **Date**: DateTime
- **Trip_Count**: Float
- **floor_hour**: DateTime


### Descriptive Statistics:

#### Summary Statistics for Date:
- **Defintion**: The month, day, year, when taxi rides took place.
- **Date Range**: The recorded trips range from October 1 to October 30, 2023.
- **missing values**: None
- **method to final form**: The data was obtained from the Transportation section of the Chicago Data Portal, specifically the dataset "Taxi Trips (2013 - 2023)." We used the query function on the website to filter the data for trips occurring between October 1 and October 30, 2023. During the data cleaning process in R, we separated the hour from the month, day, and year to create a new column that displayed only the date without the time." 

 #### Figure 1: 

![Rplot.pdf](https://github.com/user-attachments/files/19393058/Rplot.pdf)

This graph shows the distribution of trip counts over the month of October.


#### Summary Statistics for floor_hour:
- **Defintion**: The hour when taxi rides took place.
- **Date Range**: The recorded hours range from 0 to 23 in military time.
- **missing values**: None
- **method to final form**: The data was obtained from the Transportation section of the Chicago Data Portal, specifically the dataset "Taxi Trips (2013 - 2023)." We used the query function on the website to filter the data for trips occurring between October 1 and October 30, 2023, which included the time of each trip. However, the timestamps were recorded in 15-minute intervals. During the data cleaning process in R, we extracted only the hour component from the timestamp, creating a new column that displayed the floor hour without the date.


#### Summary Statistics for Trip_Count:
- **Defintion**:  The total number of taxi rides recorded for each hourly interval within a given day.
- **missing values**: None
- **method to final form**: The data was sourced from the "Taxi Trips (2013 - 2023)" dataset on the Chicago Data Portal. After filtering for trips occurring between October 1 and October 30, 2023, we processed the data in R by extracting the date and hour from the original timestamp. We then grouped the data by both date and hour, summing the Taxi.ID values, which represent the number of trips recorded at each timestamp, within each group to calculate the total number of rides for that hour.
### Figures and Tables:

| Metric | Value |
|--------|-------|
| Count  | 2877 or 590025 |
| Mean   | 205.1 |
| Min    | 5.0 |
| 25%    | 81.0 |
| Median | 214.0 |
| 75%    | 318.0 |
| Max    | 501.0 |
| Std Dev| 129.0811 |

#### Figure 1: 
![RPLOT](https://github.com/user-attachments/assets/d1526a7f-8e4c-44f4-b4a8-d9d761131e69)


This graph shows the differenced trip count returns over time, revealing variance and potential seasonal patterns even after stabilization.












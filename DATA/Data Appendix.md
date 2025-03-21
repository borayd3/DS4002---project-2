# Data Appendix

## Chicago Taxi Dataset

### Unit of Observation:
Each observation in the dataset corresponds to the total number of taxi rides that began within a given timestamp. The dataset is structured as a time series with 15-minute intervals, meaning that each row captures the ride count for every 15-minute period between October 1 and October 30, 2023.

### Variables:
- **Trip Start Timestamp**: DateTime
- **Taxi ID**: Float


### Descriptive Statistics:

#### Summary Statistics for Trip Start Timestamp:
- **Defintion**: The month, day, year, and time (in 15-minute intervals) when taxi rides took place.
- **Date Range**: The recorded trips range from October 1 to October 30, 2023.
- **missing values**: None
- **method to final form**: The data was obtained from the Transportation section of the Chicago Data Portal, specifically the dataset "Taxi Trips (2013 - 2023)." We used the query function on the website to filter the data for trips occurring between October 1 and October 30, 2023.

 #### Figure 1: 

![Rplot.pdf](https://github.com/user-attachments/files/19393058/Rplot.pdf)

This graph shows the distribution of trip counts over the month of October.


### Descriptive Statistics:


#### Summary Statistics for Taxi ID:
- **Defintion**: The number of taxi rides that occurred at each timestamp
- **missing values**: None
- **method to final form**: The data was obtained from the Transportation section of the Chicago Data Portal, specifically the dataset "Taxi Trips (2013 - 2023)." We used the query function on the website to group by the Trip Start Timestamp column and then calculated the total number of taxi rides at each timestamp by aggregating based on Taxi ID.

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













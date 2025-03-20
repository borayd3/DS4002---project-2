# DS-4002-Group-Project: TEAM SBT


## Section 1: Software and Platform Used

### Software:
- **R**: The primary programming language used for this project.
- **R Studio**: The Integrated Development Environment (IDE) used to code and build both the BSTS and SAMIRA model.
- **Chicago Data Portal Query**: The Query function in the Chicago Data Portal, where we got our data from, was used to filter out the columns and data we used.

  When conducting our analysis to assess which time series predictive model best predicts future ridership, we will employ two predictive models: a Seasonal Autoregressive Integrated Moving Average (SARIMA) model and a Bayesian Structure Time Series (BSTS) model.
  
### Add-on Packages:
- **Batesisn Structure Time Sereies (BSTS)**: This is a package for a specific time sereice predctive model that is found in R, whihc we used to build one of our predtivie models.
- **Seasonal Autoagressive Integrated Moving Average (SAMIRA)**: This is a pacakge for a specfic time sereies predivtive modesl that is found in R, which we used to build one of our predtive models.
- **lubridate**: For working with date and time data. 
- **dplyr**: For data manipulation and transformation. 
- **ggplot2**: For data visualization. 
- **ggthemes**: For enhancing and customizing the appearance of ggplot2 visualizations.
- **xts**: For handling time series data. 
- **gridExtra**: For arranging multiple grid-based plots.

### Platform:
- **Mac** and **Windows**: These operating systems were used during development.



## Section 2: Map of Documentation

**DS-4002-GROUP-PROJECTS**
- DATA (main folder)
    - Data_Appendix.md
    - Taxi_Trips_count.csv

- OUTPUT (main folder)
    - BSTS
- SCRIPTS (main folder)
    - Summary_Statistics.R
    - time_analysis.R
- LICENSE.md
- README.md


## Section 3: Instructions for reproducing our results. 


 ### Acquiring the Dataset
 
**Access the Chicago Data Portal**:
Visit the Chicago Data Portal's transportation section at https://data.cityofchicago.org.
Locate the "Taxi Trips (2013-2023)" dataset which includes information about taxi rides in Chicago from 2013 to 2023.

**Filter the Data**:

We used the query tool to filter the dataset for taxi rides that occurred between October 1st and October 30th, 2025.
Then we selected the columns that were important for analysis, such as:
- Trip Start Timestamp (the date and time of the taxi ride),
- Taxi ID (a unique identifier for each taxi ride).
  
 **Aggregate the Data**:

We grouped the data by Trip Start Timestamp and aggregated the taxi rides by Taxi ID to count how many taxi rides started at each timestamp.

**Export the Data**:

Once the data was filtered and aggregated, we exported it as a CSV file. Named the file Taxi_Trips_Count.csv and saved it in our DATA folder within our GitHub repository.

### Cleaning Data

The dataset had no missing information and the datatypes for both our columns were correct, so we did not have to clean the data after exporting it. The Trip Start Timestamp column was in DateTime format. The Taxi Ride Count column was a Float. 

### Build the SARIMA Model

**Prepare the Data**:

We loaed the Taxi_Trips_Count.csv dataset from our DATA folder into R studio. 
Then properly structured the dataset with the Trip Start Timestamp as the index and the Taxi Ride Count as the variable of interest.

**Determine the SARIMA Parameters**:
We used R in R studio for all the coding portions of our project, which can be found in our SCRIPTS folder in our github repo.

In R studio we used tools like AutoCorrelation Function (ACF) and Partial AutoCorrelation Function (PACF) plots to identify the appropriate parameters for the SARIMA model: (p, d, q) for the non-seasonal components and (P, D, Q) for the seasonal components.

**Build and Fit the SARIMA Model**:

We then used the SARIMA model to fit the data from October 1st to October 29th, 2023, with the identified parameters. This created our training set which was used to train the model.

**Make Predictions**:

Once the SARIMA model was trained, we used it to forecast the taxi ride count for October 30th, 2023.

**Results**:

The forecasted results from the SARIMA model can be found in the OUTPUT folder.

###  Build the BSTS Model

**Prepare the Data**:

We loaded the Taxi_Trips_Count.csv dataset from your DATA folder into R studio. 

**Fit the BSTS Model**:

We Used the Bayesian Structural Time Series (BSTS) model to account for both trend and seasonality in the data. We fit the model using the data from October 1st to October 21st, 2023.

**Make Predictions**:

After fitting the BSTS model, we used it to forecast the taxi ride count for October 30th, 2023.

**Results**:

The forecasted results from the BSTS model can also be found in the OUTPUT folder.

### Model Comparison and Evaluation

**Calculate Evaluation Metrics**:

Once the predictions were made from both models, we calculated the following metrics to compare their performance:
Root Mean Square Error (RMSE)
Mean Absolute Error (MAE)
Mean Absolute Percentage Error (MAPE)
Akaike Information Criterion (AIC)
Ljung-Box Test (to check for autocorrelation in the residuals)

**Compare the Models**:

We compared the evaluation metrics of the SARIMA and BSTS models. The model with lower values for RMSE, MAE, and MAPE will be considered the better fit.
The Ljung-Box test should have a p-value greater than 0.05 to indicate no significant autocorrelation in the residuals.

**Results**:

The evaluation metrics and comparison results can be found in the OUTPUT folder.

### Interpret the Results

**Examine the Forecast**:

We then reviewed the forecasted taxi ride counts for October 30th, 2023 from both models.

**Evaluate Model Performance**:

Based on the evaluation metrics, we assessed which model (SARIMA or BSTS) fit the data better and provided more accurate predictions.

## Section 4: References
 [1] Andrés, David. “Error Metrics for Time Series Forecasting - Ml Pills.” ML Pills - Machine Learning Pills, 24 June 2023. [Online]. Available: mlpills.dev/time-series/error-metrics-for-time-series-forecasting/. [Accessed: March 5, 2025].
 
[2] “ARIMA vs SARIMA Model.” GeeksforGeeks, 26 Mar. 2024. [Online]. Available: www.geeksforgeeks.org/arima-vs-sarima-model/. [Accessed: March 5, 2025].

[3] City of Chicago. “Taxi Trips (2013-2023): City of Chicago: Data Portal.” Chicago Data Portal, 7 Feb. 2024. [Online]. Available: data.cityofchicago.org/Transportation/Taxi-Trips-2013-2023-/wrvz-psew/about_data. [Accessed: March 2, 2025].

[4]  Hyndman, Rob J. et al. Forecasting: principles and practice, 2nd edition, OTexts, 2018. OTexts.com/fpp2.

[5] “The Akaike Information Criterion.” Statistical Modeling and Forecasting, 23 June 2024. [Online]. Available: timeseriesreasoning.com/contents/akaike-information-criterion/. [Accessed: March 4, 2025].

[6] Wu, Lea. “Predicting Chicago Taxi Trips with R Time Series Model - BSTS.” Towards Data Science, 21 Jan. 2025. [Online]. Available: towardsdatascience.com/predicting-chicago-taxi-trips-with-r-time-series-model-bsts-f857efe38bb4/. [Accessed: March 2, 2025].

[7] “Sarima (Seasonal Autoregressive Integrated Moving Average).” GeeksforGeeks, GeeksforGeeks, 24 May 2024, www.geeksforgeeks.org/sarima-seasonal-autoregressive-integrated-moving-average/. 

[8] “Sign In.” RPubs, [Online]. Available: rpubs.com/osazuwa/bsts. [Accessed 17 Mar. 2025]. 

 

> train_data <- result1 %>% 
  +     filter(date != "2023-10-30") 
> test_data <- result1 %>% 
  +     filter(date == "2023-10-30")

ss <- AddSemilocalLinearTrend(list(), train_data$Trip_Count)
ss <- AddSeasonal(ss, train_data$Trip_Count, nseasons=7)
model1 <- bsts(train_data, state.specification = ss, niter = 1000, seed=1014)

summary(model1)
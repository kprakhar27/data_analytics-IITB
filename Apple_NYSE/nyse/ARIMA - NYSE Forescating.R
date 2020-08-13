library(readr)
library(dplyr)
library(DT)
library(knitr)
library(forecast)
library(fpp2)
library(ggfortify)

directory <- "D:/data_analytics/nyse/prices.csv"
fundamentals_dir <- "D:/data_analytics/nyse/fundamentals.csv"
nyse_data <- read_csv(directory)
fundamentals_data <- read_csv(fundamentals_dir)

dim(nyse_data)

colnames(nyse_data)

View(nyse_data)

sum(is.na(nyse_data))

nyse_apple <- nyse_data %>% 
  mutate(fluctuation = close - open) %>% 
  filter(symbol == "AAPL") %>% 
  arrange(date)
names(fundamentals_data)[2] = "symbol"
fundamentals_data_apple <- filter(fundamentals_data,symbol == "AAPL")

dim(nyse_apple)

dim(fundamentals_data_apple)

kable(summary(nyse_apple))

datatable(head(nyse_apple,50))

nyse_apple_open_price <- nyse_apple[,c("open")]
nyse_apple_open_price <- nyse_apple_open_price[1:1050,]
appl.ts <- ts(nyse_apple_open_price, start = c(2010,1, 1), frequency = 365)
autoplot(appl.ts,ts.geom = 'bar', fill = "blue") + 
  labs(x = "Time in Years", y = "Stock Price in $") +
  ggtitle("Apple Stock Price")

ggseasonplot(appl.ts,col=rainbow(3), year.labels=TRUE)+ 
  labs(x = "Time in Months", y = "Stock Price in $") +
  scale_x_discrete(1:12)  + ggtitle("Season Plot for Apple Share")


## The Seasonal plot unveils an interesting pattern in the price of the stock, 
# we see a constant increase in share price around June in 2010, October in 2011 
# and September in 2012, which can be attributed to the launch of the new products for these respective years.

ggAcf(appl.ts, lag.max = 20) +
ggtitle("Auto Correlation Function for Apple stock for 20 days")

forecast::gglagplot(appl.ts, lags = 6) + 
  labs(x = "Stock Price in $", y = "Stock Price in $") +
  ggtitle("Lag Plot for 6 days")

logreturns <- log(diff(appl.ts))
qplot(x = logreturns, fill=..count.., geom="histogram") +
  ggtitle("Distribution for Log Returns")


mean(logreturns)

autoplot(logreturns, colour = 'red', linetype = 'dashed' ) 

AR <-arima(appl.ts, order =c(1,0,0))
autoplot(appl.ts, colour = "blue")  + 
  labs(x = "Time in Years", y = "Stock Price in $") +
  ggtitle("Apple Stock Price - Observed Values")


## ARIMA model with AR residuals
AR_fitted <- appl.ts - residuals(AR)

# Forecasting
autoplot(appl.ts, ts.colour = "blue") + 
  geom_point(aes(y=AR_fitted), col = "red", size = 1) + 
  ggtitle("Fitted Values on observed Values")

# Reformation of ARIMA
AR <-arima(appl.ts, order =c(1,0,0))

# FORECASTED DATA WITH RESIDUALS
d.forecast <- forecast(AR, level = c(95), h = 100)
autoplot(d.forecast, ts.color = "blue", predict.linetype = 'dashed') +
  ggtitle("Predicted Values and Standard Error")

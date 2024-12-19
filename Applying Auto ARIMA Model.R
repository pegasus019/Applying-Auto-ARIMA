# Load necessary libraries
library(quantmod)  # For financial data
library(forecast)  # For ARIMA modeling
library(tseries)   # For statistical tests
# Fetch S&P 500 data
getSymbols("^GSPC", src = "yahoo", from = "2000-01-01", to = "2023-12-31")

# Inspect the data
head(GSPC)

# Use Adjusted Closing Prices
sp500 <- Cl(GSPC)  # Closing prices
log_returns <- diff(log(sp500))  # Log returns

# Remove NA values
log_returns <- na.omit(log_returns)

# Plot the time series
plot(log_returns, main = "Log Returns of S&P 500", col = "blue")

# Augmented Dickey-Fuller Test
adf.test(log_returns)

# Automatically fit an ARIMA model
arima_fit <- auto.arima(log_returns, seasonal = FALSE)

# Display model details
summary(arima_fit)





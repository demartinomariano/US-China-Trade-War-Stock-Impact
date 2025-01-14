#let's clean the environment and load the data
rm(list=ls())
library(readxl)
#import the data from excel
#data <- read_excel(path_dataset)
path_dataset <- "/Users/mariano/Documents/01.Università/Exchange semester/Econ 664/dataset econ664.xlsx"
path_book <- "/Users/mariano/Documents/01.Università/Exchange semester/Econ 664/Book1.xlsx"
data <- read_excel(path_dataset)
#let's see the data
head(data)
#let's see the structure of the data
str(data)
#let's see the summary of the data
summary(data)
#check that dates are in the right format
data$Dates <- as.Date(data$Dates, format = "%Y/%m/%d")
str(data$Dates)
#create the time series of any column
ts_000921 <- ts(data$`000921 CH Equity`, start=c(2017, 1), frequency=365)
ts_000333 <- ts(data$`000333 CH Equity`, start=c(2017, 1), frequency=365)
ts_600690 <- ts(data$`600690 CH Equity`, start=c(2017, 1), frequency=365)
#plot the time series
plot(ts_000921, main="000921 CH Equity", xlab="Time", ylab="Price", col="blue")
plot(ts_000333, main="000333 CH Equity", xlab="Time", ylab="Price", col="red")
plot(ts_600690, main="600690 CH Equity", xlab="Time", ylab="Price", col="green")
#compute the daily log returns of the price series
logret_000921 <- diff(log(ts_000921))
logret_000333 <- diff(log(ts_000333))
logret_600690 <- diff(log(ts_600690))
#plot the daily log returns
plot(logret_000921, main="000921 CH Equity", xlab="Time", ylab="Log Returns", col="blue")
plot(logret_000333, main="000333 CH Equity", xlab="Time", ylab="Log Returns", col="red")
plot(logret_600690, main="600690 CH Equity", xlab="Time", ylab="Log Returns", col="green")
#summary statistics of the daily log returns
summary(logret_000921)
summary(logret_000333)
summary(logret_600690)
#let's do the same for the other sheets of the excel file
data2 <- read_excel(path_dataset, sheet = 2)
head(data2)
str(data2)
summary(data2)
data2$Dates <- as.Date(data2$Dates, format = "%Y/%m/%d")
#let's do the same for the other sheets (AUTO) of the excel file
data2 <- read_excel(path_dataset, sheet = "AUTO")
head(data2)
str(data2)
summary(data2)
data2$Dates <- as.Date(data2$Dates, format = "%Y/%m/%d")
str(data2$Dates)
colnames(data2)
ts_3333 <- ts(data2$`3333 Equity`, start=c(2017, 1), frequency=365)
ts_1211 <- ts(data2$`1211 Equity`, start=c(2017, 1), frequency=365)
ts_1958 <- ts(data2$`1958 Equity`, start=c(2017, 1), frequency=365)
plot(ts_3333, main="3333 Equity", xlab="Time", ylab="Price", col="blue")
plot(ts_1211, main="1211 Equity", xlab="Time", ylab="Price", col="red")
plot(ts_1958, main="1958 Equity", xlab="Time", ylab="Price", col="green")
logret_3333 <- diff(log(ts_3333))
logret_1211 <- diff(log(ts_1211))
logret_1958 <- diff(log(ts_1958))
plot(logret_3333, main="3333 Equity", xlab="Time", ylab="Log Returns", col="blue")
plot(logret_1211, main="1211 Equity", xlab="Time", ylab="Log Returns", col="red")
plot(logret_1958, main="1958 Equity", xlab="Time", ylab="Log Returns", col="green")
summary(logret_3333)
summary(logret_1211)
summary(logret_1958)
#let's do the same for the other sheets (solar cells) of the excel file
data3 <- read_excel(path_dataset, sheet = "solar cells")
head(data3)
str(data3)
summary(data3)
data3$Dates <- as.Date(data3$Dates, format = "%Y/%m/%d")
str(data3$Dates)
ts_002459 <- ts(data3$`002459 Equity`, start=c(2017, 1), frequency=365)
ts_601012 <- ts(data3$`601012 Equity`, start=c(2017, 1), frequency=365)
ts_601799 <- ts(data3$`601799 Equity`, start=c(2017, 1), frequency=365)
plot(ts_002459, main="002459 Equity", xlab="Time", ylab="Price", col="blue")
plot(ts_601012, main="601012 Equity", xlab="Time", ylab="Price", col="red")
plot(ts_601799, main="601799 Equity", xlab="Time", ylab="Price", col="green")
logret_002459 <- diff(log(ts_002459))
logret_601012 <- diff(log(ts_601012))
logret_601799 <- diff(log(ts_601799))
plot(logret_002459, main="002459 Equity", xlab="Time", ylab="Log Returns", col="blue")
plot(logret_601012, main="601012 Equity", xlab="Time", ylab="Log Returns", col="red")
plot(logret_601799, main="601799 Equity", xlab="Time", ylab="Log Returns", col="green")
summary(logret_002459)
summary(logret_601012)
summary(logret_601799)
data5 <- read_excel(path_book, sheet = "auto")
data5
head(data5)
str(data5)
summary(data5)
data5$Dates <- as.Date(data5$Dates, format = "%Y/%m/%d")
str(data5$Dates)
cap_3333 <- ts(data5$`3333 HK Equity`, start=c(2017, 1), frequency=365)
cap1211 <- ts(data5$`1211 HK Equity`, start=c(2017, 1), frequency=365)
cap1958 <- ts(data5$`1958 HK Equity`, start=c(2017, 1), frequency=365)
#let's built the auto sector index as the average of the three log returns weighted by their market capitalization
auto_index <- (logret_3333*cap_3333 + logret_1211*cap1211 + logret_1958*cap1958)/(cap_3333 + cap1211 + cap1958)
plot(auto_index, main="Auto Sector Index", xlab="Time", ylab="Log Returns", col="blue")
summary(auto_index)
#import data in the sheet "lavatrici" of the file Book1.xlsx
data6 <- read_excel(path_book, sheet = "lavatrici")
head(data6)
str(data6)
summary(data6)
data6$Dates <- as.Date(data6$Dates, format = "%Y/%m/%d")
str(data6$Dates)
cap_000921 <- ts(data6$`000921 CH Equity`, start=c(2017, 1), frequency=365)
cap_000333 <- ts(data6$`000333 CH Equity`, start=c(2017, 1), frequency=365)
cap_600690 <- ts(data6$`600690 CH Equity`, start=c(2017, 1), frequency=365)
#let's built the washing machines sector index as the average of the three log returns weighted by their market capitalization
wm_index <- (logret_000921*cap_000921 + logret_000333*cap_000333 + logret_600690*cap_600690)/(cap_000921 + cap_000333 + cap_600690)
plot(wm_index, main="Washing Machines Sector Index", xlab="Time", ylab="Log Returns", col="blue")
summary(wm_index)
data7 <- read_excel(path_book, sheet="solar")
head(data7)
str(data7)
summary(data7)
data7$Dates <- as.Date(data7$Dates, format = "%Y/%m/%d")
str(data7$Dates)
cap_002459 <- ts(data7$`002459 CH Equity`, start=c(2017, 1), frequency=365)
cap_601012 <- ts(data7$`601012 CH Equity`, start=c(2017, 1), frequency=365)
cap_601799 <- ts(data7$`601799 CH Equity`, start=c(2017, 1), frequency=365)
#let's built the solar cells sector index as the average of the three log returns weighted by their market capitalization
sc_index <- (logret_002459*cap_002459 + logret_601012*cap_601012 + logret_601799*cap_601799)/(cap_002459 + cap_601012 + cap_601799)
plot(sc_index, main="Solar Cells Sector Index", xlab="Time", ylab="Log Returns", col="blue")
summary(sc_index)
#let's do the same for the indepedent variables, sheet "Sheet6"
data4 <- read_excel(path_dataset, sheet = "Sheet6")
head(data4)
str(data4)
ts_USDCNY <- ts(data4$`USDCNH Curncy`, start=c(2017, 1), frequency=365)
ts_SHIF3M <- ts(data4$`SHIF3M Index`, start=c(2017, 1), frequency=365)
ts_CSI300 <- ts(data4$`Chinese index CSI 300`, start=c(2017, 1), frequency=365)
ts_BRENT <- ts(data4$`DCOILBRENTEU`, start=c(2017, 1), frequency=365)
#compute the daily log returns of the price series
logret_USDCNY <- diff(log(ts_USDCNY))
logret_SHIF3M <- diff(log(ts_SHIF3M))
logret_CSI300 <- diff(log(ts_CSI300))
logret_BRENT <- diff(log(ts_BRENT))

data8 <- read_excel(path_dataset, sheet="GDP")
# revert the order of the rows
data8 <- data8[nrow(data8):1,]
# Fill the column Dates starting with Q3 2024 and going back to Q1 2017
data8$Dates <- seq(as.Date("2017-01-01"), by = "quarter", length.out = nrow(data8))

daily_data <- data.frame()

for(i in 1:(nrow(data8)-1)) {
  # Get start and end dates for current quarter
  quarter_start <- data8$Dates[i]
  quarter_end <- data8$Dates[i+1] - 1  # Subtract 1 day to avoid overlap
  dates_seq <- seq(from = quarter_start, to = quarter_end, by = "day")
  dates_seq <- dates_seq[!weekdays(dates_seq) %in% c("Saturday", "Sunday")]
  
  # Create temporary dataframe for this quarter
  temp_df <- data.frame(
    date = dates_seq,
    gdp_growth = rep(data8$`GDP Growth`[i], length(dates_seq))
  )
  
  # Append to main dataframe
  daily_data <- rbind(daily_data, temp_df)
}
# Handle the last quarter (business days only)
last_quarter_start <- data8$Dates[nrow(data8)]
# Calculate next quarter date based on the pattern (3 months exactly)
last_quarter_end <- seq(from = last_quarter_start, by = "quarter", length.out = 2)[2] - 1
last_dates_seq <- seq(from = last_quarter_start, to = last_quarter_end, by = "day")
# Keep only business days
last_dates_seq <- last_dates_seq[!weekdays(last_dates_seq) %in% c("Saturday", "Sunday")]

last_temp_df <- data.frame(
  date = last_dates_seq,
  gdp_growth = rep(data8$`GDP Growth`[nrow(data8)], length(last_dates_seq))
)
daily_data <- rbind(daily_data, last_temp_df)

daily_data <- daily_data[-1,]

# Inflation
data9 <- read_excel(path_dataset, sheet="inflazione")
# set to NA all the dates in data9
data9$Dates <- NA
# reverse the data9
data9 <- data9[nrow(data9):1,]
# Create sequence of last days of months
start_date <- as.Date("2017-01-31")
end_date <- as.Date("2024-09-30")

# Calculate sequence of last days of months 
months_seq <- format(seq(as.Date("2017-01-01"), 
                         by = "month", 
                         length.out = nrow(data9)), "%Y-%m")
library(lubridate)
data9$Dates <- lubridate::ceiling_date(as.Date(paste0(months_seq, "-01")), unit = "month") - 1

# Create a column Start_Date with the first day of the month of that row
data9$Start_Date <- lubridate::floor_date(data9$Dates, unit = "month")
# in between Dates and Start_Date do backward fill of the datapoint you have in that row

library(tidyverse)
library(lubridate)

fill_dates <- function(data) {
  # Create an empty list to store expanded dataframes
  expanded_list <- list()
  
  # For each row in the original dataframe
  for(i in 1:nrow(data)) {
    # Get the start and end date for current row
    start_date <- data$Start_Date[i]
    end_date <- data$Dates[i]
    
    # Create sequence of dates
    date_seq <- seq.Date(from = start_date, to = end_date, by = "day")
    
    # Create temporary dataframe with all dates
    temp_df <- data[rep(i, length(date_seq)), ]
    temp_df$Date <- date_seq
    
    # Add to list
    expanded_list[[i]] <- temp_df
  }
  
  # Combine all expanded dataframes
  result <- do.call(rbind, expanded_list)
  
  # Sort by Date
  result <- result[order(result$Date), ]
  
  # Reset row names
  rownames(result) <- NULL
  
  return(result)
}

# Example usage:
# Assuming data9 has all other columns you want to preserve
result <- fill_dates(data9)
# Now remove column Dates and Start_Date
result <- result[, !names(result) %in% c("Dates", "Start_Date")]
# Now remove all non business days
result <- result[!weekdays(result$Date) %in% c("Saturday", "Sunday"),]
# Remove the first row
result <- result[-1,]

ts_inflation <- result
ts_gdp <- daily_data
# make them a time series
ts_inflation <- ts(ts_inflation$`Inflazione`, start=c(2017, 1), frequency=365)
ts_gdp <- ts(ts_gdp$gdp_growth, start=c(2017, 1), frequency=365)

# auto_index, sc_index, wm_index remove the last 4 rows of the ts
auto_index <- window(auto_index, end = time(auto_index)[length(auto_index) - 4])
sc_index <- window(sc_index, end = time(sc_index)[length(sc_index) - 4])
wm_index <- window(wm_index, end = time(wm_index)[length(wm_index) - 4])

# do the same for the log returns
logret_USDCNY <- window(logret_USDCNY, end = time(logret_USDCNY)[length(logret_USDCNY) - 4])
logret_SHIF3M <- window(logret_SHIF3M, end = time(logret_SHIF3M)[length(logret_SHIF3M) - 4])
logret_CSI300 <- window(logret_CSI300, end = time(logret_CSI300)[length(logret_CSI300) - 4])
logret_BRENT <- window(logret_BRENT, end = time(logret_BRENT)[length(logret_BRENT) - 4])

# ts_inflation, ts_gdp remove the first observation
ts_inflation <- window(ts_inflation, start = time(ts_inflation)[2])
ts_gdp <- window(ts_gdp, start = time(ts_gdp)[2])

# interpolate the missing data in logret_BRENT
library(zoo)
logret_BRENT <- na.approx(logret_BRENT)

# regress auto_index on the independent variables
reg_auto <- lm(auto_index ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + logret_BRENT + ts_inflation + ts_gdp)
summary(reg_auto)

# now do it for the single components of the index
logret_1211 <- window(logret_1211, end = time(logret_1211)[length(logret_1211) - 4])
reg_1211 <- lm(logret_1211 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + logret_BRENT + ts_inflation + ts_gdp)
summary(reg_1211)

logret_1958 <- window(logret_1958, end = time(logret_1958)[length(logret_1958) - 4])
reg_1958 <- lm(logret_1958 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + logret_BRENT + ts_inflation + ts_gdp)
summary(reg_1958)

logret_000921 <- window(logret_000921, end = time(logret_000921)[length(logret_000921) - 4])
reg_000921 <- lm(logret_000921 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp)
summary(reg_000921)

logret_000333 <- window(logret_000333, end = time(logret_000333)[length(logret_000333) - 4])
reg_000333 <- lm(logret_000333 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp)
summary(reg_000333)

logret_600690 <- window(logret_600690, end = time(logret_600690)[length(logret_600690) - 4])
reg_600690 <- lm(logret_600690 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp)
summary(reg_600690)

logret_002459 <- window(logret_002459, end = time(logret_002459)[length(logret_002459) - 4])
reg_002459 <- lm(logret_002459 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp)
summary(reg_002459)

logret_601012 <- window(logret_601012, end = time(logret_601012)[length(logret_601012) - 4])
reg_601012 <- lm(logret_601012 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp)
summary(reg_601012)

logret_601799 <- window(logret_601799, end = time(logret_601799)[length(logret_601799) - 4])
reg_601799 <- lm(logret_601799 ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp)
summary(reg_601799)

#create a new dataframe with the variable with 2019 observations
data10 <- data.frame(Dates = data$Dates[1:2019], auto_index = auto_index, sc_index = sc_index, wm_index = wm_index, logret_USDCNY = logret_USDCNY, logret_SHIF3M = logret_SHIF3M, logret_CSI300 = logret_CSI300, ts_inflation = ts_inflation, ts_gdp = ts_gdp)
# Replace 'tariff_date' with your actual tariff introduction date
tariff_date_2 <- as.Date("2021-01-14")  
tariff_date_3 <- as.Date("2022-02-04")
# Set your start and end dates
start_date_1 <- as.Date("2018-01-22")  # Replace with your start date
end_date_1 <- as.Date("2023-02-07")    # Replace with your end date

# Create the dummy variable
# Create dummy variable for the introduction of tariffs 
data10$tariff_dummy_2 <- ifelse(data10$Dates >= tariff_date, 2, 0)
data10$tariff_dummy_3 <- ifelse(data10$Dates >= tariff_date_3, 1, 0)
data10$tariff_dummy_1 <- ifelse(data10$Dates >= start_date_1 & data10$Dates <= end_date_1, 1, 0)
reg_sc <- lm(sc_index ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp + tariff_dummy_1, data = data10)
summary(reg_sc)
#dothe same regression for the washing machines sector
reg_wm <- lm(wm_index ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp + tariff_dummy_1 + tariff_dummy_2, data = data10)
summary(reg_wm)
#do the regressione for the solar cells sector
reg_sc <- lm(sc_index ~ logret_USDCNY + logret_SHIF3M + logret_CSI300 + ts_inflation + ts_gdp + tariff_dummy_1 + tariff_dummy_3, data = data10)
summary(reg_sc)


library(readxl)# lib to read xslx file
library(ggplot2)# lib to plot graphs

setwd("C:/Users/mohit/OneDrive/Desktop/CODING")

data<-read_xlsx("dataset_of_delhi_weather.xlsx")
ggplot(data, aes(x = date, y = meantemp)) +
  geom_point(color="blue")
  geom_line() +
  labs(title = "Mean Temperature Over Time",
       x = "Date",
       y = "Mean Temperature") +
  theme_minimal()


ggplot(data, aes(x = date, y = humidity)) +
  geom_bar(stat = "identity") +
  labs(title = "Humidity Over Time",
       x = "Date",
       y = "Humidity") +
  theme_minimal()

ggplot(data, aes(x = date)) +
  geom_line(aes(y = meantemp, color = "Temperature")) +
  geom_line(aes(y = humidity, color = "Humidity")) +
 
  labs(title = "Temperature and Humidity Over Time",
       x = "Date",
       y = "Value") +
  theme_minimal()

ggplot(data, aes(x = humidity, y = meantemp)) +
  geom_point() +
  labs(title = "Temperature vs Humidity",
       x = "Humidity",
       y = "Mean Temperature") +
  theme_minimal()

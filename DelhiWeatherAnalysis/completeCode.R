# Set working directory (change path to your folder)
setwd("D:/Downloads")

# Read CSV file
data <- read.csv("excel.csv")

# Convert date column to Date type (important)
data$date <- as.Date(data$date,format="%Y-%m-%d")

library(ggplot2)

# 1. Mean Temperature Over Time (scatter + line)
ggplot(data, aes(x = date, y = meantemp)) +
  geom_point(color = "blue") +
  geom_line() +
  labs(
    title = "Mean Temperature Over Time",
    x = "Date",
    y = "Mean Temperature"
  ) +
  theme_minimal()

# 2. Humidity Over Time (bar plot)
ggplot(data, aes(x = date, y = humidity)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Humidity Over Time",
    x = "Date",
    y = "Humidity"
  ) +
  theme_minimal()

# 3. Temperature and Humidity Over Time (combined line plot)
ggplot(data, aes(x = date)) +
  geom_line(aes(y = meantemp, color = "Temperature")) +
  geom_line(aes(y = humidity, color = "Humidity")) +
  labs(
    title = "Temperature and Humidity Over Time",
    x = "Date",
    y = "Value"
  ) +
  theme_minimal()

# 4. Scatter plot: Temperature vs Humidity
ggplot(data, aes(x = humidity, y = meantemp)) +
  geom_point() +
  labs(
    title = "Temperature vs Humidity",
    x = "Humidity",
    y = "Mean Temperature"
  ) +
  theme_minimal()
# Set working directory 
setwd("D:/Downloads")

# Read CSV file
data <- read.csv("excel.csv")

# Convert date column to Date Type
data$date <- as.Date(data$date, format="%Y-%m-%d")

# --------------------------- #
# 1. DATA CLEANING
# --------------------------- #
# Check missing values
colSums(is.na(data))

# Remove missing/NA rows
data <- na.omit(data)

# Remove duplicates
data <- data[!duplicated(data), ]

# Check structure
str(data)
summary(data)

# --------------------------- #
# 2. DESCRIPTIVE STATISTICS
# --------------------------- #
# Mean
mean_temp <- mean(data$meantemp)
mean_humidity <- mean(data$humidity)

# Median
median_temp <- median(data$meantemp)
median_humidity <- median(data$humidity)

# Mode function
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_temp <- getmode(data$meantemp)
mode_humidity <- getmode(data$humidity)

# Variance
var_temp <- var(data$meantemp)
var_humidity <- var(data$humidity)

# Standard Deviation
sd_temp <- sd(data$meantemp)
sd_humidity <- sd(data$humidity)

# Print results
mean_temp; mean_humidity
median_temp; median_humidity
mode_temp; mode_humidity
var_temp; var_humidity
sd_temp; sd_humidity

# --------------------------- #
# 3. NORMALIZATION
# --------------------------- #
data$Temp_norm <- (data$meantemp - min(data$meantemp)) / 
  (max(data$meantemp) - min(data$meantemp))

data$Hum_norm <- (data$humidity - min(data$humidity)) / 
  (max(data$humidity) - min(data$humidity))

# --------------------------- #
# 4. STANDARDIZATION
# --------------------------- #
data$Temp_std <- scale(data$meantemp)
data$Hum_std <- scale(data$humidity)

# --------------------------- #
# 5. CORRELATION & COVARIANCE
# --------------------------- #
correlation <- cor(data$humidity, data$meantemp)
covariance <- cov(data$humidity, data$meantemp)

correlation
covariance

# --------------------------- #
# 6. DATA VISUALIZATION
# --------------------------- #
library(ggplot2)

# (a) Mean Temperature over Time
ggplot(data, aes(x = date, y = meantemp)) +
  geom_point(color="blue") +
  geom_line() +
  labs(title="Mean Temperature Over Time",
       x="Date", y="Mean Temperature") +
  theme_minimal()

# (b) Humidity Over Time (Bar Plot)
ggplot(data, aes(x = date, y = humidity)) +
  geom_bar(stat="identity") +
  labs(title="Humidity Over Time",
       x="Date", y="Humidity") +
  theme_minimal()

# (c) Combined Line Plot
ggplot(data, aes(x=date)) +
  geom_line(aes(y=meantemp, color="Temperature")) +
  geom_line(aes(y=humidity, color="Humidity")) +
  labs(title="Temperature vs Humidity Over Time",
       x="Date", y="Value") +
  theme_minimal()

# (d) Scatter Plot
ggplot(data, aes(x=humidity, y=meantemp)) +
  geom_point() +
  labs(title="Temperature vs Humidity",
       x="Humidity", y="Mean Temperature") +
  theme_minimal()

# EXTRA VISUALIZATIONS

# (e) Histogram
ggplot(data, aes(meantemp)) +
  geom_histogram() +
  ggtitle("Histogram of Mean Temperature")

# (f) Boxplots for Outliers
boxplot(data$meantemp, main="Mean Temperature Boxplot")
boxplot(data$humidity, main="Humidity Boxplot")

# (g) Correlation Heatmap
library(corrplot)
cor_matrix <- cor(data[, c("meantemp","humidity")])
corrplot(cor_matrix, method="circle")

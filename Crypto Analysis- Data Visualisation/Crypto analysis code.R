# Load data
data <- read.csv("Bitcoin Historical Data.csv", stringsAsFactors = FALSE)

# View structure
str(data)
head(data)

data$Date <- as.Date(data$Date, format = "%b %d, %Y")
data$Price <- as.numeric(gsub(",", "", data$Price))
data$Open  <- as.numeric(gsub(",", "", data$Open))
data$High  <- as.numeric(gsub(",", "", data$High))
data$Low   <- as.numeric(gsub(",", "", data$Low))
data$Vol. <- gsub("K", "000", data$Vol.)
data$Vol. <- gsub("M", "000000", data$Vol.)
data$Vol. <- as.numeric(gsub(",", "", data$Vol.))
data$Change <- as.numeric(gsub("%", "", data$`Change %`))

plot(data$Date, data$Price,
     type = "l",
     col = "blue",
     lwd = 2,
     xlab = "Date",
     ylab = "Price (USD)",
     main = "Bitcoin Closing Price Over Time")


plot(data$Date, data$Open,
     type = "l",
     col = "green",
     lwd = 2,
     xlab = "Date",
     ylab = "Price",
     main = "Open vs Close Price")

lines(data$Date, data$Price, col = "red", lwd = 2)

legend("topleft",
       legend = c("Open", "Close"),
       col = c("green", "red"),
       lty = 1)

plot(data$Date, data$High,
     type = "l",
     col = "purple",
     lwd = 2,
     xlab = "Date",
     ylab = "Price",
     main = "High and Low Prices")

lines(data$Date, data$Low, col = "orange", lwd = 2)

legend("topleft",
       legend = c("High", "Low"),
       col = c("purple", "orange"),
       lty = 1)


plot(data$Date, data$Vol.,
     type = "l",
     col = "brown",
     lwd = 2,
     xlab = "Date",
     ylab = "Volume",
     main = "Bitcoin Trading Volume")


plot(data$Date, data$Change,
     type = "h",
     col = "darkcyan",
     xlab = "Date",
     ylab = "Daily Change (%)",
     main = "Daily Percentage Change in Bitcoin Price")


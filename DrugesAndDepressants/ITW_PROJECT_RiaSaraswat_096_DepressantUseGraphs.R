
library(readxl)# lib to read xslx file
library(ggplot2)# lib to plot graphs

setwd("C:/Users/mohit/OneDrive/Desktop/CODING")

data <- read_excel("dataset_drug_use.xlsx")
head(data)

barplot(height = data$pain_releiver_use,
        names.arg = data$age,
        col = "orange",
        xlab = "Age",
        ylab = "Pain Releiver Use (%)",
        main = "Pain Releiver Use by Age")
barplot(height = data$oxycontin_use,
        names.arg = data$age,
        col = "green",
        xlab = "Age",
        ylab = "Oxycontin Use (%)",
        main = "Oxycontin-use by Age")
barplot(height = data$tranquilizer_use,
        names.arg = data$age,
        col = "blue",
        xlab = "Age",
        ylab = "Tranquilizer Use (%)",
        main = "Tranquilizer Use by Age")

barplot(height = data$inhalant_use,
        names.arg = data$age,
        col = "red",
        xlab = "Age",
        ylab = "Inhalant Use (%)",
        main = "Inhalant Use by Age")

plot(data$age, data$sedative_use,
     type = "l",
     lwd = 5,
     col = "blue",
     xlab = "Age",
     ylab = "Sedative Use (%)",
     main = "Sedative Use by Age")


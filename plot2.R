# plot 2

# reading data
ElectricPowerConsumption <- read.csv("./R/ExploratoryDataAnalysis/household_power_consumption.txt", 
                                     sep=";",
                                     colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                                     na.strings="?")

# selecting the relevant dates
myElectricPowerConsumption <- subset(ElectricPowerConsumption, Date %in% c("1/2/2007","2/2/2007"))

## read in date and time info datetime format
dates <- myElectricPowerConsumption$Date
times <- myElectricPowerConsumption$Time
x <- paste(dates, times)
samplingTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#make the plot
plot(samplingTime,
     myElectricPowerConsumption$Global_active_power, 
     col="black",
     type = "l",
     xlab = "",
     ylab="Global Active Power (kilowatts)" 
)

#copy plot to a PNG file
dev.copy(png, file = "./ExData_Plotting1/plot2.png", width = 480, height = 480)

#close PNG device
dev.off()


# plot 4

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

#set the numer of plots - two columns and two rows
par(mfrow = c(2,2))

#make plot 1
plot(samplingTime,
     myElectricPowerConsumption$Global_active_power, 
     col="black",
     type = "l",
     xlab = "",
     ylab="Global Active Power" 
)

#make plot 2
plot(samplingTime,
     myElectricPowerConsumption$Voltage, 
     col="black",
     type = "l",
     xlab = "datetime",
     ylab="Voltage" 
)

#make plot 3
with(myElectricPowerConsumption,  
     plot(samplingTime, Sub_metering_1,
     type = "n",
     xlab = "",
     ylab="Energy sub metering" )
)

with(myElectricPowerConsumption, 
     lines(samplingTime,
           Sub_metering_1, 
           col="black")
)

with(myElectricPowerConsumption, 
     lines(samplingTime,
     Sub_metering_2, 
     col="red")
)

with(myElectricPowerConsumption, 
     lines(samplingTime,
           Sub_metering_3, 
           col="blue")
)

legend("topright",
       lty=c(1,1),
       lwd=c(2.5,2.5),
       col=c("black", "red", "blue"), 
       bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

#make plot 4
plot(samplingTime,
     myElectricPowerConsumption$Global_reactive_power, 
     col="black",
     type = "l",
     xlab = "datetime",
     ylab="Global_reactive_power" 
)

#copy plot to a PNG file
dev.copy(png, file = "./ExData_Plotting1/plot4.png", width = 480, height = 480)

#close PNG device
dev.off()


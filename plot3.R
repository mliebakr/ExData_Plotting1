# plot 3

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
with(myElectricPowerConsumption,  
     plot(samplingTime, Sub_metering_1, #Sub_metering_2,Sub_metering_3, 
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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

#copy plot to a PNG file
dev.copy(png, file = "./ExData_Plotting1/plot3.png", width = 480, height = 480)

#close PNG device
dev.off()


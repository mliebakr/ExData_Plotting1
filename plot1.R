# plot 1

# reading data
ElectricPowerConsumption <- read.csv("./R/ExploratoryDataAnalysis/household_power_consumption.txt", 
                                     sep=";",
                                     colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                                     na.strings="?")

# selecting the relevant dates
myElectricPowerConsumption <- subset(ElectricPowerConsumption, Date %in% c("1/2/2007","2/2/2007"))

#make the plot
hist(myElectricPowerConsumption$Global_active_power, 
     col="red",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power",
     breaks=12
     )

#copy plot to a PNG file
dev.copy(png, file = "./ExData_Plotting1/plot1.png", width = 480, height = 480)

#close PNG device
dev.off()

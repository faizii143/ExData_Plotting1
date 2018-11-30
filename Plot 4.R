#Coursea Data Science: Expolatory Data Analysis
#Course Project 1: Plot 1
#Faizan Ahmed Masood

#Find estimated No of memory usage
#No of col * no of Rows * 8 bytes
#2,075,259 rows and 9 columns 

#Estimated Memoery ==> 149418648 bytes
#Actual Memory => 149604992 bytes

#load Dataset into R
household_power_consumption <- read.table("E:/Fiverr/exdata/household_power_consumption.txt", header = T, stringsAsFactors = F, sep = ";", na.strings = "?")

# to check the no of NA"s
summary(household_power_consumption)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

#subsetting data using dates 2007-02-01 and 2007-02-02
Subset_Data <- subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(Subset_Data$Date, Subset_Data$Time)
Subset_Data$datetime <- as.POSIXct(datetime)


#plot 4
par(mfrow = c(2,2))
plot(Subset_Data$Global_active_power ~ Subset_Data$datetime , type = "l", ylab="Global Active Power (kilowatts)", xlab="")

plot(Subset_Data$Voltage ~ Subset_Data$datetime, type = "l", xlab = "DateTime", ylab = "Voltage")

plot(Subset_Data$Sub_metering_1 ~ Subset_Data$datetime, type = "l", xlab="",ylab="Energy sub metering")
lines(Subset_Data$Sub_metering_2 ~  Subset_Data$datetime, col = "red")
lines(Subset_Data$Sub_metering_3 ~ Subset_Data$datetime, col = "blue" )
legend(lty = 1,lwd =2, "topright" , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(Subset_Data$Global_reactive_power ~ Subset_Data$datetime , xlab="DateTime",ylab = "Global Reactive Power", type = "l")
par(mfrow = c(1,1))
dev.copy(png,file= "Plot 4.png")
dev.off()

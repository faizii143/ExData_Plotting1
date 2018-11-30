#Coursea Data Science: Expolatory Data Analysis
#Course Project 1: Plot 1
#Faizan Ahmed Masood
#Pakistan

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

hist(household_power_consumption$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, file="plot 1.png",height = 480, width = 480)
dev.off()

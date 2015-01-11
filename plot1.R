# read it

d <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# only two days required

reduced_set <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"), ]

# output plot to png

png("plot1.png", width = 480, height = 480)

hist(reduced_set$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")

dev.off()


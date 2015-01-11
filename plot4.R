# read it

d <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# only two days required

reduced_set <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"), ]

# get time

reduced_set$datetime <- strptime(paste(reduced_set$Date, reduced_set$Time), "%d/%m/%Y %H:%M:%S")

# correct locale to English

Sys.setlocale("LC_TIME", "English")

# output plot to png

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

with(reduced_set, {
    # 1, 1
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    # 1, 2
    plot(datetime, Voltage, type = "l", ylab = "Voltage")

    # 2, 1
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, type = "l", col = "red")
    lines(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty = 1, bty = "n")
    
    # 2, 2
    plot(datetime, Global_reactive_power, ylab="Global_reactive_power", type="l")        
})    

dev.off()

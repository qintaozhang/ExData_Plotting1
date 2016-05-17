filedirectory <-"C:\\qtzhang\\study\\Classes\\John Hopkins data science\\Exploratory Data Analysis with R\\week1"
filename<-paste(filedirectory,"\\household_power_consumption.txt",sep="")
data<-read.csv(filename,sep=";",header=TRUE,na.strings = "?",check.names=FALSE, stringsAsFactors=FALSE)
plot_data <-data[data["Date"]=="1/2/2007"|data["Date"]=="2/2/2007",]
rm(data)
plot_data_clean<-na.omit(plot_data)
rm(plot_data)

#as suggested in the assignment, change format
plot_data_clean$Date <- as.Date(plot_data_clean$Date, format = "%d/%m/%Y")

datetime <- paste(plot_data_clean$Date, plot_data_clean$Time)
plot_data_clean$Datetime <- as.POSIXct(datetime)


plot(plot_data_clean$Sub_metering_1~plot_data_clean$Datetime, ylab="Energy sub metering", xlab="", type="l")
lines(plot_data_clean$Sub_metering_2~plot_data_clean$Datetime, col="red")
lines(plot_data_clean$Sub_metering_3~plot_data_clean$Datetime, col="blue")

legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
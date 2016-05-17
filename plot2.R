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

plot(plot_data_clean$Global_active_power~plot_data_clean$Datetime, ylab="Global Active Power (kilowatts)",col="black", xlab="", type="l")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
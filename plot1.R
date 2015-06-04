setwd("C:/R/explory data analysis/week1")
i <- 1
while(i <= 200000){
        r <- read.table("household_power_consumption.txt",nrows=1,sep=";",
                        skip=i) 
        r1 <- strptime(r[,1],"%d/%m/%Y")
        if(r1>"2007-02-02"){
                j <- i
                break
        }
        i <- i+10000
}
r <- read.table("household_power_consumption.txt",nrows=10000,sep=";",
                skip=j-10000) 
r1 <- strptime(r[,1],"%d/%m/%Y")
r <- cbind(r1,r[,-1])
rn <- r[r[,1]=="2007-02-01"|r[,1]=="2007-02-02",]
colnames(rn) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intersity","sub_metering_1",
                  "sub_metering_2","sub_metering_3")
rn[,3] <- as.character(rn[,3])
rn[,3] <- as.numeric(rn[,3])
hist(rn[,3],main="Global Active Power",xlab="Global Active Power(kilowatts)",
     col="red")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()


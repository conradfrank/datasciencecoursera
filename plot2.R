library(readr)
library(dplyr)
assignment_file <- "./household_power_consumption.txt"
assignment_data <- read_delim(assignment_file, delim = ";", col_names = TRUE)
data1 <- assignment_data %>%
          filter(!is.na(Global_active_power)) %>%
          filter(Date %in% c("1/2/2007","2/2/2007")) %>%
          select(Date:Global_active_power)

  data1$Date <- as.Date(data1$Date,  "%d/%m/%Y")

  data1 <- data1 %>%
  mutate(datetime = as.POSIXct(paste(Date, Time)) )
  
  png(filename = "plot2.png", width = 480, height = 480)
  

  with(data1, plot(Global_active_power~datetime, type = "l", 
                   xlab = "",ylab = "Global Active Power (kilowatts)"))
       
dev.off()


#install.packages("readxl")
#install.packages("lubridate")
#install.packages("stringr")
library(readxl)
library(lubridate)
library(stringr)
library(ggplot2)
data <- read_excel("C:/Study/earthquake.xlsx")
data <- as.data.frame(data)

data <- data[, c("발생시각", "규모", "위도", "경도", "위치")]
names(data) <- c("time", "magnitude", "latitude", "longitude", "location")

#1
max_latitude_time <- as.numeric(gsub(" N", "", data$latitude)) %>% which.max(.) %>% data$time[.]
time_hm <- ymd_hms(max_latitude_time) %>% format(., "%H:%M")

#2
min_latitude_time <- as.numeric(gsub(" N", "", data$latitude)) %>% which.min(.) %>% data$time[.]
time_month <- ymd_hms(min_latitude_time) %>% format(., "%m")

#3
noon <- as.POSIXct("12:00:00", format="%H:%M:%S")
midnight <- as.POSIXct("23:59:59", format="%H:%M:%S")
time_list <- format(data$time, "%H:%M:%S") %>% as.POSIXct(., format = "%H:%M:%S")

afternoon_earthquakes <- data %>% filter(., time_list >= noon & time_list <= midnight)

magnitude_third_quantile <- quantile(afternoon_earthquakes$magnitude, probs = 0.75)

#4
gangwon_earthquakes <- data %>% filter(., str_detect(location, "강원"))

most_frequent_year <- year(gangwon_earthquakes$time) %>% table(.) %>% which.max(.)
names(table(year(gangwon_earthquakes$time)))[most_frequent_year]

year_counts <- table(year(gangwon_earthquakes$time))
most_frequent_year <- as.numeric(names(year_counts)[which.max(year_counts)])

#5
october_earthquakes <- data %>% filter(month(data$time) == 10)

hist(october_earthquakes$magnitude, 
     breaks = seq(2.0, 4.2, by = 0.22), 
     col = "orange", 
     xlab = "magnitude", 
     ylab = "Frequency", 
     main = "Histogram of Magnitude in October", 
     axes = FALSE)

axis(1, at = seq(2, 4.2, by = 0.22))
axis(2, at = seq(0, 38, by = 2))







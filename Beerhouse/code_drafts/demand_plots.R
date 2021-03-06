# This script creates the plots to illustrate the yearly demand trends
# It also munches the "visual friendly" yearly demand to a decent csv file
# that can be read directly as demand trend

wd <- "/Users/fernanda/Documents/Batmelon/ITAM/AprendizajeMaquina2/git_repo/Beerhouse/aux_documents/" ## where to find the
      ## excel files that contain demand trends for consumer
setwd(wd)

library(readxl)
library(ggplot2)

# Reading files ##############################################################
demands_no_noise <- read_excel("creating_consumer_trend.xlsx", sheet = 5,
                                 skip = 1)

days_of_every_month <- read_excel("creating_consumer_trend.xlsx", sheet = 2,
                                 skip = 0)

# Cleaning data ##############################################################
# Demands data frame ###############
# Some numbers come with a lot of decimal places because of number format
is.num <- sapply(demands_no_noise, is.numeric)
demands_no_noise[is.num] <- lapply(demands_no_noise[is.num], round, 2)
demands_no_noise <- as.data.frame(t(demands_no_noise),stringsAsFactors=FALSE)

# Managing the data frame. We want to end up with a month column, a day 
#   column and a demand column.

# Create an empty data frame named as the month
get_daily_demands <- function(row){
    df <- data.frame(Month = character(days_of_every_month$Days[row]),
                  Day = character(days_of_every_month$Days[row]),
                  Demand = numeric(days_of_every_month$Days[row]),
                  stringsAsFactors=FALSE)
    
    df$Month <- days_of_every_month$Month[row]
    df$Day <- 1:days_of_every_month$Days[row]
    df$Demand <- as.numeric(na.omit(as.vector(t(demands_no_noise[2:nrow(demands_no_noise),row]))))
    df
}

all_months_demands <- list()

# Create list of dataframes, 12 one for each month
for(i in 1:nrow(days_of_every_month)){
  all_months_demands[[i]] <- get_daily_demands(i)
}

# Get only one big dataframe
demands_no_noise <- do.call("rbind", all_months_demands)
# Clean up Month as factors to get the correct order
demands_no_noise$Month <- factor(demands_no_noise$Month,
                                 levels = c("January", "February", "March",
                                            "April", "May", "June", "July",
                                            "August", "September", "October",
                                            "November", "December" ))

# Plots ######################################################################


all_months <- ggplot(demands_no_noise, aes(x = Day, y = Demand, color = Demand)) + 
                          geom_line(size=1) +
                          facet_wrap( ~ Month) +
                          guides(color = "none") +
                          scale_colour_continuous(low = "darkgrey", high = "firebrick4") +
                          theme(panel.background = element_rect(fill = "gray95")) + 
                          labs(x = "Day", y = "Demand") +
                          ggtitle("Yearly Beer Demand")
all_months

example_month <- ggplot(subset(demands_no_noise, Month == "August"), aes(x = Day, y = Demand, color = Demand)) + 
                          geom_line(size=1) +
                          facet_wrap( ~ Month) +
                          guides(color = "none") +
                          scale_colour_continuous(low = "darkgrey", high = "firebrick4") +
                          theme(panel.background = element_rect(fill = "gray95")) +
                          scale_y_continuous(limits = c(0.5, 2)) + 
                          labs(x = "Day", y = "Demand") +
                          ggtitle("Example Normal Month")
example_month

# Anything below this line is not part of the code, erase if present

write.csv(demands_no_noise, "customer_trend.csv", row.names = FALSE)


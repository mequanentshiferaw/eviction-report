# Analysis script: compute values and create graphics of interest
library("dplyr")
#install.packages("ggplot2")
#install.packages("lubridate")

library("ggplot2")
library("lubridate")
library("tidyr")
library("ggmap")

# Load in your data
evictions <- read_csv("data/Eviction_Notices.csv", stringsAsFactors = FALSE)
# Compute some values of interest and store them in variables for the report

# How many evictions were there?
num_evic <- nrow(evictions)
num_fetures <- ncol(evictions)
# Create a table (data frame) of evictions by zip code (sort descending)
by_zip <- evictions %>% 
  group_by(Eviction_Notices.Source.Zipcode) %>% 
  count() %>% arrange(-n) %>%  top_n(10, wt = n)
# Create a plot of the number of evictions each month in the dataset
by_month <- evictions %>%  mutate(date = as.Date(file,date, format = "%M/%d/%y")) %>% 
  mutate(mounth = floor_date(date, unit = "month")) %>%  group_by(mounth) %>% 
  count() %>% 
  
  
  # Store plot in a variable
  ggplot(data = by_month) + geom_line(mapping = aes(x = month, y = n)) + 
  label_both(x = "Date", y = "Number", title = "evictions over time in SF")
# Map evictions in 2017 

# Format the lat/long variables, filter to 2017

# Create a maptile background

# Add a layer of points on top of the map tiles

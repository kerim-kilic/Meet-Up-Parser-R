# Author:   Kerim Kilic
# date:     04/2022

# Uncomment to install prerequisite packages
# install.packages("rjsonlite")
# install.packages("tidyverse")

library("jsonlite")
library("tidyverse")

data <- fromJSON("meetup_data.json")
data <- data["input"]
df <- data.frame(data)

i <- 0
while(i != nrow(df))
{
  edition <- df[i + 1, 1]
  name <- df[i + 1, 2]
  start_date <- df[i + 1, 3]
  end_date <- df[i + 1, 4]
  location <- df[i + 1, 5]
  if(!is.na(edition))
  {
    meetup_string <- paste(edition, name, "·", start_date)
  }
  else
  {
    meetup_string <- paste(name, "·", start_date)
  }
  if(!is.na(end_date))
  {
    meetup_string <- paste(meetup_string, "/", end_date, "·")
  }
  else
  {
    meetup_string <- paste(meetup_string, "·")
  }  
  i <- i + 1
  print(meetup_string)
}

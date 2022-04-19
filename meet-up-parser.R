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

final_string = c()
i <- 0
while(i != nrow(df))
{
  edition <- df[i + 1, 1]
  name <- df[i + 1, 2]
  start_date <- df[i + 1, 3]
  end_date <- df[i + 1, 4]
  location <- df[i + 1, 5]
  if(!is.na(edition)) # Check if edition is present
  {
    meetup_string <- paste0(edition, " ", name, " · ", start_date)
  }
  else
  {
    meetup_string <- paste0(name, " · ", start_date)
  }
  if(!is.na(end_date)) # Check if end_date is present
  {
    meetup_string <- paste0(meetup_string, " / ", end_date, " · ")
  }
  else
  {
    meetup_string <- paste0(meetup_string, " · ")
  }  
  a <- location[[1]]
  size <- nrow(location[[1]])
  j <- 0
  while(j < size)
  {
    if("city" %in% names(location[[1]]) && "state" %in% names(location[[1]]))
    {
      location_string <- paste0(location_string, a[j + 1,1], ", " , a[j + 1,2], ". ", a[j + 1,3])
    }
    else if("city" %in% names(location[[1]]) && !("state" %in% names(location[[1]])))
    {
      location_string <- paste0(location_string, a[j + 1,1], ", " , a[j + 1,2])
    }
    else if(!("city" %in% names(location[[1]])) && "state" %in% names(location[[1]]))
    {
      location_string <- paste0(location_string, a[j + 1,1], ", ", a[j + 1,2])
    }
    if(j == 0 && size > 1 && data_frame(a$country)[1,1] != data_frame(a$country)[2,1])
    {
      location_string <- paste0(location_string, " | ")
    }
    else if(j == 0 && size > 1 && data_frame(a$country)[1,1] == data_frame(a$country)[2,1])
    {
      if(!("state" %in% names(location[[1]])))
      {
        print("A")
        location_string <- str_replace(location_string, as.character(paste0(", ",data_frame(a$country)[1,1])), " | ")
      }
      else if("state" %in% names(location[[1]]) && data_frame(a$state)[1,1] == data_frame(a$state)[2,1])
      {
        print("B")
        location_string <- str_replace(location_string, as.character(paste0(", ", data_frame(a$state)[1,1], ". ", data_frame(a$country)[1,1] )), " | ")
      }
      else if("state" %in% names(location[[1]]) && data_frame(a$state)[1,1] != data_frame(a$state)[2,1])
      {
        print("B")
        location_string <- str_replace(location_string, as.character(paste0(". ", data_frame(a$country)[1,1] )), " | ")
      }
    }
    
    j <- j + 1
  }
  final_string <- append(final_string,paste0(meetup_string, location_string))
  location_string <- ""
  i <- i + 1
}
meetUps <- final_string

meetUps <- as.data.frame(meetUps)

x <- toJSON(meetUps, dataframe = "columns")
x <- prettify(x, indent = 2)
cat(x)
write(x, "output.json")
Assignment: ASSIGNMENT 5
# Name: Huynh, Linh
# Date: 2023-07-09

install.packages("openxlsx")  
library(openxlsx)  
houses <- read.xlsx("week-7-housing.xlsx", sheet = 1, detectDates = TRUE)


#1. Dplyr Package 
install.packages("dplyr")
library(dplyr)


houses %>%
  # Use the Group_by function to group the houses by the number of bedrooms
  group_by(bedrooms)
  #Use Summarize function to calculate the average price of houses in each group
houses %>%
  summarize(AvgPrice=mean(Sale.Price))
  #Use Select function to choose columns Sale.Date, Sale.Price and addr_full 
  #and Mutate function to add a column that indicates whether the house's price is above average or not
houses %>%
  select(Sale.Date, Sale.Price, addr_full) %>%
  mutate(Above_Average = ifelse(Sale.Price > median(Sale.Price), "Yes", "No")) %>%
  #Use Filter function to extract houses that price is above the average which means expensive
  select(Sale.Date, Sale.Price, addr_full, Is_Expensive='Above_Average') %>%
  filter(Is_Expensive=="Yes")
  #Use Arrange function to arrange the houses in descending order by Price
houses %>%
  select(Sale.Date, Sale.Price, addr_full) %>%
  arrange(desc(Sale.Price))

#2. Purrr Package
install.packages("tidyverse")
library(tidyverse) 
library(purrr)

# Filter data frame to keep only columns with class "Date"
  filtered_df <- purrr::keep(houses, ~inherits(.x, "Date"))
  head(filtered_df)
  
# Use compact() function to remove NULL values from ctyname
  housing_compact <- houses %>%  mutate(ctyname=compact(ctyname))
  head(housing_compact)


#3. Use the cbind and rbind function
# Use the cbind function to combine column "realtor" from "extra_info" spreadsheet
extra_info <- read.xlsx("extra_info.xlsx", sheet = "Sheet1")
realtor <- extra_info$Realtor
combined_column <- cbind(houses, realtor)
head(combined_column)
  
  
#Use rbind function 
install.packages("openxlsx")  
library(openxlsx) 
new_row <- read.xlsx("extra_row.xlsx", sheet = "Sheet1")
combine_row <- rbind(houses, new_row)
combine_row
  
  
#4. Split a string, then concatenate the results back together
# Sample string
my_string <- "Hello, My name is Linh!"
  
# Split the string
split_string <- strsplit(my_string, ",")[[1]]
split_string
  
# Concatenate the results
concatenated_string <- paste(split_string, collapse = "")
concatenated_string













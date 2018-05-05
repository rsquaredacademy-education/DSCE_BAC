#-----------------------------------------------------------------------
# load dplyr and readr packages
library(dplyr)
library(readr)
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# read data 
ecom <- read_csv('https://raw.githubusercontent.com/rsquaredacademy/datasets/master/web.csv')
ecom
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## AOV by Devices
ecom %>%
  filter(purchase == 'true') %>%
  select(device, order_value, order_items) %>%
  group_by(device) %>%
  summarise_all(funs(sum)) %>%
  mutate(
    aov = order_value / order_items
  ) %>%
  select(device, aov)
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## Step 1: Filter 
## filter all visits from mobile
filter(ecom, device == "mobile")

## filter all visits from mobile that converted
filter(ecom, device == "mobile", purchase == "true")

## filter all visits from mobile & visited > 5 pages 
filter(ecom, device == "mobile", n_pages > 5)

## Case Study: visits that converted
filter(ecom, purchase == "true")
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## Step 2: Select relevant columns
## Select device and purchase columns 
select(ecom, device, purchase)

## select all columns from device to purchase
select(ecom, device:purchase)

## select all columns excluding id and country
select(ecom, -id, -country)

## Case Study: Select
select(ecom, device, order_value, order_items)

## Case Study: Select
ecom1 <- filter(ecom, purchase == "true")
ecom2 <- select(ecom1, device, order_value, order_items)
ecom2
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## Step 3: Group data 
## Group data by referrer type 
group_by(ecom, referrer)

## Case Study: Group data by devices
ecom3 <- group_by(ecom2, device)
ecom3
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## Step 4: Total order value and order items
## Summarise
ecom4 <- summarise(ecom3, total_value = sum(order_value),
          total_items = sum(order_items))
ecom4

## Case Study: Summarise
ecom4 <- summarise_all(ecom3, funs(sum))
ecom4
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## Step 5: Compute AOV
ecom5 <- mutate(ecom4, aov = order_value / order_items)
ecom5
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## Step 6: Select relevant columns
ecom6 <- select(ecom5, device, aov)
ecom6
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
## AOV by Devices
ecom1 <- filter(ecom, purchase == "true")
ecom2 <- select(ecom1, device, order_value, order_items)
ecom3 <- group_by(ecom2, device)
ecom4 <- summarise_all(ecom3, funs(sum))
ecom5 <- mutate(ecom4, aov = order_value / order_items)
ecom6 <- select(ecom5, device, aov)
ecom6


# AOV by Devices
ecom %>%
  filter(purchase == 'true') %>%
  select(device, order_value, order_items) %>%
  group_by(device) %>%
  summarise_all(funs(sum)) %>%
  mutate(
    aov = order_value / order_items
  ) %>%
  select(device, aov)
#-----------------------------------------------------------------------

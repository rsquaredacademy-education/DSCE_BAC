# load packages
library(dplyr)
library(readr)

## read data
ecom <- read_csv('data/web.csv')
ecom

## Data Sanitization
## Traffic Sources
distinct(ecom, referrer)

## Device Types
distinct(ecom, device)

## Rename Columns
rename(ecom, time_on_site = duration)

## Sampling Data
sample_n(ecom, 700)
sample_frac(ecom, size = 0.7)


## Extract Device Column
pull(ecom, device)

## Extract First Column
pull(ecom, 1)

## Extract Last Column
pull(ecom, -1)

## Extract First 20 Rows
slice(ecom, 1:20)

## Extract Last Row
slice(ecom, n())

## Tabulate Referrers
ecom %>%
  group_by(referrer) %>%
  tally()

## Tabulate referrers and bouncers
ecom %>%
  group_by(referrer, bouncers) %>%
  tally()

## Tabulate referrers and purchasers
ecom %>%
  group_by(referrer, purchase) %>%
  tally()

## Tabulate Referrers & Converts
ecom %>%
  group_by(referrer, purchase) %>%
  tally() %>%
  filter(purchase == 'true')

## Count
count(ecom, referrer, purchase)

## Top 2 referrers by orders
ecom %>%
  count(referrer, purchase) %>%
  filter(purchase == 'true') %>%
  arrange(desc(n)) %>%
  top_n(n = 2)

## Between
ecom %>%
  pull(n_pages) %>%
  between(5, 15) 

## Case When
mtcars %>%
  select(mpg, disp, cyl, gear, carb) %>%
  mutate(
    type = case_when(
      disp > 200 ~ 'High',
      cyl == 8 ~ 'Eight',
      TRUE ~ 'True'
    )
  )

## Select First Observation
ecom %>%
  pull(referrer) %>%
  nth(1)

ecom %>%
  pull(referrer) %>%
  first()


## Select 1000th Observation
ecom %>%
  pull(referrer) %>%
  nth(1000)

## Select Last Observation
ecom %>%
  pull(referrer) %>%
  last()

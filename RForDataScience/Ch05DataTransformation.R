library(tidyverse)
library(nycflights13)

arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

df <- tibble(x = c(5, 2, NA))
arrange(df, x)
arrange(df, desc(x))

## Exercises
## 1
arrange(df, desc(is.na(x)))

## 2
arrange(flights, desc(arr_delay))

## 3
fast <- arrange(flights, desc(distance / air_time))

## 4
longest <- arrange(flights, distance)
shortest <- arrange(flights, desc(distance) )

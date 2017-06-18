library(tidyverse)
library(nycflights13)

## Arrange
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

## Select
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))
select(flights, starts_with("ye"), starts_with("d"), starw)
select(flights, matches("tail"))
rename(flights, tail_num = tailnum)
select(flights, tailnum, everything())

## Exercise

## 1
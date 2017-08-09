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
select(flights, starts_with("dep"), starts_with("arr"))
select(flights, matches("^(dep|arr)"))
select(flights, matches("(time|delay)$"))

## 2 multiple times, just show one time.
select(flights, dep_time, dep_time)

## 3
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))

## 4
select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))

## mutate

flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
mutate(flights_sml, gain = arr_delay - dep_delay, speed = distance / air_time * 60)
mutate(flights_sml, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain / 60)

transmute(flights_sml, gain = arr_delay - dep_delay, hours = air_time / 60, gain_per_hour = gain / 60)

## creation functions

(x <- 1:10)
lag(x)
lead(x)
x - lag(x)
cumsum(x)
cumprod(x)
cummean(x)

y <- c(1, 2, 2, NA, 3, 4)
min_rank(y)
min_rank(desc(y))

## Exercises

## 1
flights_sml <- select(flights, ends_with("dep_time"))
mutate(flights_sml, dep_time_min = dep_time %/% 100 * 60 + dep_time %% 100)

## 2
flights_sml <- select(flights, air_time, arr_time, dep_time)
mutate(flights_sml, air_time, diff = arr_time - dep_time)
mutate(flights_sml, dep = dep_time %/% 100 * 60 + dep_time %% 100,
       arr = arr_time %/%100 * 60 + arr_time %% 100,
       diff = arr - dep)

## 3
(flights_sml <- select(flights, dep_time, sched_dep_time, dep_delay))

## 4
(flights_sml <- select(flights, dep_time, sched_dep_time, dep_delay))
(flights_sml_new <- mutate(flights_sml, dep_delay_min_rank = min_rank(flights_sml$dep_delay)))
arrange(flights_sml_new, dep_delay_min_rank)[1:20,]

## 5
1:3 + 1:10

## summarise

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
         count = n(),
         dist = mean(distance, na.rm = TRUE),
         delay = mean(arr_delay, na.rm = TRUE)
         )
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

delay2 <- flights %>%
  group_by(dest) %>%
  summarise(count = n(), dist = mean(distance, na.rm = TRUE), delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(count > 20, dest != "HNL")

not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

delays %>%
  filter(n > 100) %>%
  ggplot(delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

library(Lahman)
batting <- as_tibble(Lahman::Batting)

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    avg_delay1 = mean(arr_delay),
    avg_delay2 = mean(arr_delay[arr_delay > 0])
  )

not_cancelled %>%
  group_by(dest) %>%
  summarise(
    distance_sd = sd(distance)
  ) %>%
  arrange(desc(distance_sd))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    first = min(dep_time),
    last  = max(dep_time)
  )

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    first_dep = first(dep_time),
    last_dep  = last(dep_time)
  )

flights %>%
  filter(month == 1, day == 3)

not_cancelled %>%
  select(year, month, day, dep_time) %>%
  group_by(year, month, day) %>%
  mutate(r = desc(dep_time), r_min_rank = min_rank(r)) %>%
  filter(r_min_rank %in% range(r_min_rank))

not_cancelled %>%
  group_by(dest) %>%
  summarise(carriers = n_distinct(carrier)) %>%
  arrange(desc(carriers))

not_cancelled %>%
  count(dest)

not_cancelled %>%
  count(tailnum, wt = distance) %>%
  arrange(desc(n))

daily <- group_by(flights, year, month, day)
(per_day <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year <- summarise(per_month, flights = sum(flights)))

daily %>%
  ungroup() %>%
  summarise(flights = n())

## Exercises

## 1.1
not_cancelled %>%
  group_by(tailnum) %>%
  summarise(min_arr_delay = quantile(arr_delay, 0.49), max_arr_delay = quantile(arr_delay, 0.50))

## 1.2
not_cancelled %>%
  group_by(tailnum) %>%
  summarise(min_arr_delay = min(arr_delay), max_arr_dely = max(arr_delay)) %>%
  filter(min_arr_delay == 10)

not_cancelled %>%
  filter(tailnum == "N801AW") %>%
  count()

## 1.4

not_cancelled %>%
  group_by(tailnum) %>%
  summarise(min_arr_delay = quantile(arr_delay, 0.99), max_arr_delay = max(arr_delay)) %>%
  filter(min_arr_delay <= 0) %>%
  arrange(desc(max_arr_delay))
  
# 2

not_cancelled %>%
  count(dest)

not_cancelled %>%
  group_by(dest) %>%
  summarise(n = n())

not_cancelled %>%
  count(tailnum, wt = distance)

not_cancelled %>%
  group_by(tailnum) %>%
  summarise(n = n(), total_distance = sum(distance))

# 3 Use dep_time would be better

cancelled <- flights %>%
  filter(is.na(arr_delay) | is.na(dep_delay))

# 4 

flights_data <- flights %>%
  group_by(year, month, day) %>%
  summarise(n = n(),
            num_cancelled = sum(is.na(dep_time)),
            num_non_cancelled = n - num_cancelled,
            cancelled_ratio = num_cancelled / n,
            avg_delay = mean(dep_delay, na.rm = TRUE))

ggplot(flights_data, mapping = aes(x = avg_delay, y = cancelled_ratio)) +
  geom_point(alpha = 0.1) +
  geom_smooth(se = FALSE)

# 5 Which carrier has the worst delays?

not_cancelled %>%
  group_by(carrier) %>%
  summarise(avg_dep_delay = mean(dep_delay)) %>%
  arrange(desc(avg_dep_delay))

not_cancelled %>%
  group_by(carrier, dest) %>%
  summarise(n(), avg_arr_delay = mean(arr_delay)) %>%
  arrange(desc(avg_arr_delay))
  
# 6

not_cancelled %>%
  count(carrier, sort = TRUE)

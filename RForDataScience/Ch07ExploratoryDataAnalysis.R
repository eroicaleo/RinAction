library(tidyverse)
library(nycflights13)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

diamonds %>%
  count(cut)

diamonds %>%
  group_by(cut) %>%
  summarise(n = n())

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

diamonds %>%
  count(cut_width(carat, 0.5))

smaller <- diamonds %>%
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.25)

# 7.3.3

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  select(price, x, y, z) %>%
  arrange(y)

# Exercises

# 1 From the following 3 distribution, looks like "z" is the height, the majority is between 2.5 - 5.0
# While x, y are between 5.0 - 7.5

ggplot(data = diamonds, mapping = aes(x = x)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(xlim = c(0, 10))

ggplot(data = diamonds, mapping = aes(x = y)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(xlim = c(0, 10))

ggplot(data = diamonds, mapping = aes(x = z)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(xlim = c(0, 10))

# 2 Looks like there is nothing around $1500

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 100)

price_unusual <- diamonds %>%
  filter(price < 2000)
ggplot(data = price_unusual, mapping = aes(x = price)) +
  geom_histogram(binwidth = 10)

# 3 How many diamonds are 0.99 carat?
# How many are 1 carat? What do you think is the cause of the difference?

# I think it might be the cutting errors. What they want is 1.0 carat,
# but due to manufactuer errors, they are less than 1.0

diamonds

diamonds %>%
  filter(carat == 0.99) %>%
  count()

diamonds %>%
  filter(carat == 1.00) %>%
  count()

# 4 Compare and contrast coord_cartesian() vs xlim() or ylim()
# when zooming in on a histogram. What happens if you leave binwidth
# unset? What happens if you try and zoom so only half a bar shows?

# The ylim drops the data, so we probably shouldn't use it for our purpose.

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  ylim(0, 50)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y)) +
  ylim(0, 500)

# 7.4

diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

diamonds2 %>%
  filter(is.na(y))

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point()

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point(na.rm = TRUE)

flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>%
  ggplot(mapping = aes(x = sched_dep_time)) +
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)

# Exercises

# 1 Looks to me, they all got removed ...

diamonds %>%
  filter(y < 3)

diamonds2 <- diamonds %>%
  mutate(cut = ifelse(cut == "Very Good", NA, cut))

ggplot(data = diamonds2, mapping = aes(x = cut)) +
  geom_bar()

ggplot(data = diamonds, mapping = aes(x = cut)) +
  geom_bar()

diamonds3 <- diamonds %>%
  mutate(y = ifelse(y < 5, NA, y))

ggplot(data = diamonds3, mapping = aes(x = y)) +
  geom_histogram(binwidth = 0.5)

# 2 

v <- c(1, 2, 3, NA)
sum(v, na.rm = TRUE)
mean(v, na.rm = TRUE)

# 7.5.1

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) + 
  geom_boxplot() +
  coord_flip()

# exercises

# 1. Use what you’ve learned to improve the visualisation of
# the departure times of cancelled vs. non-cancelled flights.

flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>%
  ggplot(mapping = aes(x = sched_dep_time, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)

flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>%
  ggplot(mapping = aes(x = cancelled, y = sched_dep_time)) +
  geom_boxplot()

## 2. What variable in the diamonds dataset is most important for predicting the price of a diamond?
## How is that variable correlated with cut? Why does the combination of those two relationships
## lead to lower quality diamonds being more expensive?

# So I think the bigger diamond tends to be lower quality, but they are more expensive.

diamonds

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point(mapping = aes(colour = cut))

ggplot(data = diamonds, mapping = aes(x = carat, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour = cut))

ggplot(data = diamonds, mapping = aes(x = cut, y = carat)) +
  geom_boxplot()

## 
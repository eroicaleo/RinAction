library(tidyverse)

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

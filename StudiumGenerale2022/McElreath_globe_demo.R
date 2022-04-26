# Small worlds demo from Richard McElreath
# R code from https://bookdown.org/content/4857/small-worlds-and-large-worlds.html#bayesian-updating.

# Much more detail on the globe / water activity can be found here: https://www.youtube.com/watch?v=guTdrfycW2Q
# The globe part starts at around 20:00, but it would help to watch from the beginning.
# Also, I didn't mention it by name in class, but what I mentioned in class about looking at previous research and building on that
# rather than starting with a flat null hypothesis prior each time is an example of the Bayseian updating discussed in the video.

# clear the workspace
rm(list = ls())

# load the tidyverse library for plotting
pacman::p_load(tidyverse)

# record the number times we hit water
number_water <- 7

# record the total number of samples (spins of the globe)
spins = 10

# plot the probability distribution for hitting water on any given sample 
#(assuming we are sampling the globe completely at random, which we weren't)


tibble(prob = seq(from = 0, to = 1, by = .01)) %>% 
  ggplot(aes(x = prob, y = dbinom(x = number_water, size = spins, prob = prob))) +
  geom_line() +
  labs(x = "probability",
       y = "binomial likelihood")
  #theme(panel.grid = element_blank())


  
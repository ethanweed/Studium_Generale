rm(list = ls())

pacman::p_load(tidyverse,
               ggrepel,
               sjPlot,
               cowplot)
setwd("/Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/Slides/Images")

df <- read.csv(url("https://raw.githubusercontent.com/ethanweed/ethanweed.github.io/master/r-tutorials/data/nettle_1998.csv"), sep = ";")


# Nettle reports the population data in 1000's, probably to save room in the data table, but that is an unusual number to think about population in, so let's convert to millions. While we're at it, let's convert km2 to millions, so that the number doesn't appear in scientific notation on the x-axis
df$Population <- df$Population*1000/1000000
df$Area <- df$Area/1000000

# For purposes of plotting, let's convert to a log scale
df$Population_log <- log(df$Population)
df$Area_log <- log(df$Area)
df$Languages_log <- log(df$Languages)

# Area
p1 <- 
ggplot(df, aes(Area_log, Languages_log, label = Country)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  theme_classic() +
  geom_label_repel(max.overlaps = 35) +
  labs(y = "Number of languages (log)",
       x = (bquote('Area ((log) million km'^2*')')),
       title = "Number of Languages vs. Area")


# Population
p2 <- 
ggplot(df, aes(Population_log, Languages_log, label = Country)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  theme_classic() +
  geom_label_repel(max.overlaps = 35) +
  labs(y = "Number of languages (log)",
       x = (bquote('Population ((log) millions)')),
       title = "Number of Languages vs. Population")


# Mean Growing Season
p3 <- 
ggplot(df, aes(MGS, Languages_log, label = Country)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  theme_classic() +
  geom_label_repel(max.overlaps = 35) +
  labs(y = "Number of languages (log)",
       x = "Mean Growing Season (months)",
       title = "Number of Languages vs. Mean Growing Season")

png(filename = "Nettle_1_Area.png")
plot(p1)
dev.off()


png(filename = "Nettle_2_Population.png")
plot(p2)
dev.off()


png(filename = "Nettle_3_MGS.png")
plot(p3)
dev.off()

mod1 <- lm(data = df, 
           Languages ~ Area)
mod2 <- lm(data = df, 
           Languages ~ Area + Population)
mod3 <- lm(data = df, 
           Languages ~ Area + Population + MGS)


tab_model(mod1, show.intercept = FALSE, show.aic = TRUE, file = "Nettle_1_Area.html")
tab_model(mod2, show.intercept = FALSE, show.aic = TRUE, file = "Nettle_2_Population.html")
tab_model(mod3, show.intercept = FALSE, show.aic = TRUE, file = "Nettle_3_MGS.html")

p4 <- 
ggplot(df) +
  geom_smooth(aes(scale(Area_log), Languages_log), method = "lm", color = "red") +
  geom_smooth(aes(scale(Population_log), Languages_log), method = "lm", color = "blue") +
  geom_smooth(aes(scale(MGS), Languages_log), method = "lm", color = "yellow") +
  geom_point(aes(scale(MGS), Languages_log)) +
  geom_label_repel(aes(scale(MGS), Languages_log, label = Country), max.overlaps = 50) +
  theme_cowplot() +
  labs(x = " ")

png(filename = "Nettle_4_all.png")
plot(p4)
dev.off()


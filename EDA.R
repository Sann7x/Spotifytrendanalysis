library(tidyverse)


spotify <- read_csv("SpotifyFeatures.csv", show_col_types = FALSE)


spotify <- spotify %>% mutate(duration_min = duration_ms / 60000)


lm_model <- lm(popularity ~ duration_min, data = spotify)
summary(lm_model)


lm_quad <- lm(popularity ~ duration_min + I(duration_min^2), data = spotify)
summary(lm_quad)











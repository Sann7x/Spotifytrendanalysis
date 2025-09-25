library(tidyverse)

# Load dataset
spotify_data <- read_csv("data/spotify_sample.csv")

# Linear regression: Duration -> Popularity
spotify_data <- spotify_data %>%
  mutate(duration_min = duration_ms / 60000)  # convert to minutes

lm_model <- lm(popularity ~ duration_min, data = spotify_data)
summary(lm_model)

# Optional: Quadratic term for non-linear effect
lm_quad <- lm(popularity ~ duration_min + I(duration_min^2), data = spotify_data)
summary(lm_quad)

# Visualize regression
ggplot(spotify_data, aes(x = duration_min, y = popularity)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Linear Regression: Duration vs Popularity", x = "Duration (minutes)", y = "Popularity")

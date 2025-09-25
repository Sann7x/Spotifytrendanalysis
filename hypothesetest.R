library(tidyverse)

# Load dataset
spotify_data <- read_csv("data/spotify_sample.csv")

# High vs Low Energy
spotify_data <- spotify_data %>%
  mutate(energy_group = ifelse(energy > 0.7, "High", "Low"))

t_test_result <- t.test(popularity ~ energy_group, data = spotify_data)
print(t_test_result)

# Chi-square test for Acousticness vs Popularity Category
spotify_data <- spotify_data %>%
  mutate(pop_category = ifelse(popularity >= 60, "High", "Low"),
         acoustic_cat = case_when(
           acousticness < 0.1 ~ "Low",
           acousticness >= 0.1 & acousticness <= 0.5 ~ "Medium",
           TRUE ~ "High"
         ))

chisq_table <- table(spotify_data$acoustic_cat, spotify_data$pop_category)
chi_result <- chisq.test(chisq_table)
print(chi_result)

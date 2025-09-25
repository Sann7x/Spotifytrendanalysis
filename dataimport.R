# Load required libraries
library(tidyverse)

# Set working directory to the folder where CSV is located
# setwd("your/path/here")

# Import dataset
spotify_data <- read_csv("spotify_dataset.csv", show_col_types = FALSE)

# Inspect first rows
head(spotify_data)

# Summary of dataset
glimpse(spotify_data)
summary(spotify_data)

# Save a sample for reproducibility (optional)
spotify_sample <- spotify_data %>% sample_n(1000)
write_csv(spotify_sample, "data/spotify_sample.csv")

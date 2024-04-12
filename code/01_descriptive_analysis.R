here::i_am("code/01_descriptive_analysis.R")

data <- readRDS(
  file = here::here("output/data.rds")
)

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(gplots)

# 1. Bar Plot for Team Distribution within the Conference
bar_plot <- ggplot(data, aes(x = team)) +
  geom_bar(fill = "steelblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Number of Players per Team", x = "Team", y = "Number of Players")

# 2. Box Plot for Player Performance by Team (e.g., points per game)
box_plot <- ggplot(data, aes(x = team, y = pts, fill = team)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Player Performance (Points per Game) by Team", x = "Team", y = "Points per Game")

# 3. Histogram for Points Distribution
hist_plot <- ggplot(data, aes(x = pts)) +
  geom_histogram(binwidth = 5, fill = "cornflowerblue", color = "black") +
  labs(title = "Distribution of Points per Game", x = "Points per Game", y = "Frequency")

# 4. Scatter Plot for Points vs. Rebounds
scatter_plot <- ggplot(data, aes(x = pts, y = rebounds_total, color = team)) +
  geom_point() +
  labs(title = "Player Performance: Points vs. Total Rebounds", x = "Points per Game", y = "Total Rebounds per Game") +
  scale_color_viridis_d()

# Save the plots to the 'output' directory
ggsave(filename = here::here("output", "bar_plot_team_distribution.png"), plot = bar_plot, device = "png", width = 10, height = 6)
ggsave(filename = here::here("output", "box_plot_performance_by_team.png"), plot = box_plot, device = "png", width = 10, height = 6)
ggsave(filename = here::here("output", "histogram_pts_distribution.png"), plot = hist_plot, device = "png", width = 10, height = 6)
ggsave(filename = here::here("output", "scatter_plot_pts_vs_rebounds.png"), plot = scatter_plot, device = "png", width = 10, height = 6)
ggsave(filename = here::here("output", "points_per_game_by_conference.png"), plot = box_plot, device = "png", width = 10, height = 6)


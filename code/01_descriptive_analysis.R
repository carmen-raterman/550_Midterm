here::i_am("code/01_descriptive_analysis.R")

data <- readRDS(
  file = here::here("output/data.rds")
)

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(gplots)


# Map teams to their respective conferences
team_to_conference <- c(
  # Eastern Conference
  'ATL' = 'East', 'BOS' = 'East', 'BKN' = 'East', 'CHA' = 'East', 'CHI' = 'East',
  'CLE' = 'East', 'DET' = 'East', 'IND' = 'East', 'MIA' = 'East', 'MIL' = 'East',
  'NYK' = 'East', 'ORL' = 'East', 'PHI' = 'East', 'TOR' = 'East', 'WAS' = 'East',
  # Western Conference
  'DAL' = 'West', 'DEN' = 'West', 'GSW' = 'West', 'HOU' = 'West', 'LAC' = 'West',
  'LAL' = 'West', 'MEM' = 'West', 'MIN' = 'West', 'NOP' = 'West', 'OKC' = 'West',
  'PHX' = 'West', 'POR' = 'West', 'SAC' = 'West', 'SAS' = 'West', 'UTA' = 'West',
  'TOT' = 'Multiple'
)

data$conference <- team_to_conference[data$team]

# Filter out 'Multiple' for clear analysis
conference_data <- data[data$conference %in% c('East', 'West'),]

# 1. Bar Plot for Conference Distribution
bar_plot<- ggplot(conference_data, aes(x=conference)) +
  geom_bar(aes(fill=conference), show.legend = FALSE) +
  labs(title="Distribution of NBA Players by Conference", x="Conference", y="Number of Players") +
  scale_fill_manual(values=c("East"="blue", "West"="red"))

# 2. Box Plot for Player Performance by Conference
box_plot <- ggplot(conference_data, aes(x=conference, y=pts, fill=conference)) +
  geom_boxplot() +
  labs(title="Player Performance (Points per Game) by Conference", x="Conference", y="Points per Game") +
  scale_fill_manual(values=c("East"="blue", "West"="red"))

# 3. Histograms for the Distribution of Player Performance in Each Conference
# Eastern Conference
hist_plot_east <- ggplot(subset(conference_data, conference == "East"), aes(x=pts)) +
  geom_histogram(bins=20, fill="blue", color="black") +
  labs(title="Player Performance Distribution in the Eastern Conference", x="Points per Game", y="Frequency")

# Western Conference
hist_plot_west <- ggplot(subset(conference_data, conference == "West"), aes(x=pts)) +
  geom_histogram(bins=20, fill="red", color="black") +
  labs(title="Player Performance Distribution in the Western Conference", x="Points per Game", y="Frequency")

# 4. Scatter plot for Player Performance by Conference
scatter_plot <- ggplot(conference_data, aes(x=pts, y=rebounds_total, color=conference)) +
  geom_point() +
  labs(title="Player Performance: Points vs. Total Rebounds by Conference", x="Points per Game", y="Total Rebounds per Game") +
  scale_color_manual(values=c("East"="blue", "West"="red"))


# Save the bar plot
ggsave(filename = here::here("output", "bar_plot_conference_distribution.png"), plot = bar_plot, device = "png", width = 8, height = 6)

# Save the box plot
ggsave(filename = here::here("output", "box_plot_points_distribution.png"), plot = box_plot, device = "png", width = 8, height = 6)

# Save the histogram plot
ggsave(filename = here::here("output", "histogram_plot_east.png"), plot = hist_plot_east, device = "png", width = 8, height = 6)
ggsave(filename = here::here("output", "histogram_plot_west.png"), plot = hist_plot_west, device = "png", width = 8, height = 6)

# Save the scatter plot
ggsave(filename = here::here("output", "scatter_plot.png"), plot = scatter_plot, device = "png", width = 8, height = 6)

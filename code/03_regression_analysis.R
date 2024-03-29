here::i_am("code/03_regression_analysis.R")

data <- readRDS(
  file = here::here("output/data.rds")
)

# Load necessary packages
pacman::p_load(tidyverse, #general data handling
               ggplot2,   #plotting
               magrittr)  #pipe operator

# Filter data (note, no missing observations)
data <- data %>% 
  select(rank,
         rebounds_offensive,
         rebounds_defensive,
         steals,
         blocks,
         turnovers, 
         fouls)

# Fit the regression model (rank ~ rebound, steal, block, turnover, foul)
model <- lm(rank ~ rebounds_offensive + rebounds_defensive + steals + blocks +  turnovers + fouls, data = data)

summary <- summary(model)


# Plotting the regression results
regression3_results <- ggplot(data.frame(), aes(x = data$rank, y = fitted(model))) +
  geom_point(color = "blue") +
  geom_abline(intercept = coef(model)[1], slope = coef(model)[2], color = "red", linetype = "dashed") +
  labs(title = "Actual vs. Predicted Rank",
       x = "Actual Rank",
       y = "Predicted Rank") +
  theme_minimal()

print(regression3_results)

# Save the plot
ggsave(
  here::here("output/regression3_results.png"),
  plot = regression3_results,
  device = "png")

output <- capture.output(summary(model))
writeLines(output, "output/regression3_output.txt")

here::i_am("code/02regressionanalysis.R")

data <- readRDS(
  file = here::here("output/data.rds")
)

# Load necessary libraries
library(ggplot2)
library(magrittr)
library(dplyr)

# Fit the regression model
data_pts <- data %>%
  filter(field_goal_pct != is.na(field_goal_pct), three_pt_pct != is.na(three_pt_pct),
         free_throw_pct != is.na(three_pt_pct)) %>%
  select(`pts`, `field_goal_pct`, `three_pt_pct`, `free_throw_pct`)

model <- lm(pts ~ field_goal_pct + three_pt_pct + free_throw_pct, data = data_pts)

summary <- summary(model)

print(summary)

# Plotting the regression results
regression2_results <- ggplot(data_pts, aes(x = pts, y = fitted(model))) +
  geom_point(color = "blue") +
  geom_abline(intercept = coef(model)[1], slope = coef(model)[2], color = "red", linetype = "dashed") +
  labs(title = "Actual vs. Predicted Points",
       x = "Actual Points",
       y = "Predicted Points") +
  theme_minimal()

print(regression2_results)

# Save the plot
ggsave(
  here::here("output/regression2_results.png"),
  plot = regression2_results,
  device = "png")

output <- capture.output(summary(model))
writeLines(output, "output/regression_output.txt")




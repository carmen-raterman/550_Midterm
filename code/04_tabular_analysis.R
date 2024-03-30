here::i_am("code/04_tabular_analysis.R")

data <- readRDS(
  file = here::here("output/data.rds")
)

# loading packages
pacman::p_load(dplyr, gt, labelled)

# Defining teams by conference 
east <- c("BOS", "BRK", "NYK", "PHI", "TOR", "CHI", "CLE", "DET", "IND", "MIL", "ATL", "MIA", "ORL", "WAS", "CHO")
west <- c("DEN", "MIN", "OKC", "POR", "UTA", "GSW", "LAC", "LAL", "SAC", "DAL", "HOU", "MEM", "NOP", "SAS", "PHO")

data$conference <- ifelse(data$team %in% east, "East",
                       ifelse(data$team %in% west, "West", NA))

# counting pointss and rebounds for 36 mins
data1 <- data %>%
  mutate(
    pts_per_36 = (pts / mins_played) * 36,
    reb_per_36 = (rebounds_total / mins_played) * 36
  )

# table label 
table1 <- data1 %>%
  group_by(conference) %>%
  summarise(
    Avg_Points_Per_36 = round(mean(pts_per_36, na.rm = TRUE), 2),
    Median_Points_Per_36 = round(median(pts_per_36, na.rm = TRUE), 2),
    Avg_Rebounds_Per_36 = round(mean(reb_per_36, na.rm = TRUE), 2),
    Median_Rebounds_Per_36 = round(median(reb_per_36, na.rm = TRUE), 2)
  ) %>%
  gt() %>%
  tab_header(
    title = "Tabular Analysis of NBA Player Performance by Conference",
    subtitle = "Points and Rebounds per 36 Minutes"
  ) %>%
  cols_label(
    Avg_Points_Per_36 = "Average Points",
    Median_Points_Per_36 = "Median Points",
    Avg_Rebounds_Per_36 = "Average Rebounds",
    Median_Rebounds_Per_36 = "Median Rebounds"
  ) %>%
  fmt_number(
    columns = c(Avg_Points_Per_36, Median_Points_Per_36, Avg_Rebounds_Per_36, Median_Rebounds_Per_36),
    decimals = 2
  )

print(table1)

# saving 
gt::gtsave(table1, filename = here("output", "NBA_Player_Performance_Table.png"))

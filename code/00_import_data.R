here::i_am("code/00_import_data.R")
absolute_path_to_data <- here::here("raw_data", "nba_feb24.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)


saveRDS(
  data,
  file = here::here("output/data.rds")
)
here::i_am("code/00_import_data.R")
absolute_path_to_data <- here::here("raw_data", "nba_feb24.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

#load packages
pacman::p_load(tidyverse) #general data handling


#list of east teams (WHICH_CONFIG = default)
east<-c("BOS",
        "BRK", 
        "NYK",
        "PHI",
        "TOR",
        "CHI",
        "CLE",
        "DET",
        "IND",
        "MIL",
        "ATL",
        "MIA",
        "ORL",
        "WAS",
        "CHO")

#list of west teams (WHICH_CONFIG = west)
west<-c("DEN",
        "MIN",
        "OKC",
        "POR",
        "UTA",
        "GSW",
        "LAC",
        "LAL",
        "SAC",
        "DAL",
        "HOU",
        "MEM",
        "NOP",
        "SAS",
        "PHO")

#creating division variable
data <- data %>% 
  mutate(division = case_when(
    team %in% east ~ 1,
    team %in% west ~ 0,
    team == "TOT" ~ NA # "TOT" means the player played for more than 1 team that year
  ))

#filtering team list based on our config file
WHICH_CONFIG <- Sys.getenv("WHICH_CONFIG")
config_list <- config::get(
  config = WHICH_CONFIG
)

#filtering based on division 
#note: config_list, doesn't work with tidy grammar, need line below or data <- data[data$division == config_list$division, ] 
data <- data %>% 
  filter(data$division == config_list$division) 


data <- data[data$division == config_list$division, ] 

saveRDS(
  data,
  file = here::here("output/data.rds")
)

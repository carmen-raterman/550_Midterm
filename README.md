# Data 550 NBA Player Stats Project

This project focuses on analyzing the ranking of top NBA players based on per 36-minute statistics as of February 24, 2024. The dataset used for this analysis is sourced from the NBA (2024). The main data file is nba_feb24.csv, and the accompanying data dictionary can be found in the table below under "Additional Notes".

## Code Structure

The project directory contains three relevant folders:

-   code: This folder contains R scripts for various stages of the data analysis process.
-   output: This folder stores the output files generated during the analysis.
-   raw_data: This folder stores the raw data of nba_feb24.csv.

## Getting Started

To replicate the analysis:

1\. Fork and clone this repository to your local machine.

2\. Navigate to the project directory.

3\. Run `make` in your command line to execute data processing and to generate the report.

## Setting Environment Variables

This project uses environment variables to configure settings such as the division (e.g., East or West). To set these environment variables, follow these steps:

1\. Choose Configuration: Determine which configuration you want to use. This project provides three configurations: `default`, `west`, and `east`.

2\. Set Environment Variable: From the command line, use the export command to set the WHICH_CONFIG environment variable to the desired configuration. For example: `export WHICH_CONFIG="west"`

3\. After setting the environment variable, run the `make` command to execute data processing and generate the report.

## Additional Notes

-   Clean the project directory by running `make clean` to remove generated output files.
-   Codebook contents can be seen in the table below:

| Variable Name      | Description                                |
|--------------------|--------------------------------------------|
| rank               | Rank                                       |
| player             | Player                                     |
| position           | Position                                   |
| age                | Player's age on February 1 of the season   |
| team               | Team                                       |
| games              | Games                                      |
| games_started      | Games Started                              |
| mins_played        | Minutes Played                             |
| field_goal         | Field Goals Per 36 Minutes                 |
| field_goal_atmpts  | Field Goal Attempts Per 36 Minutes         |
| field_goal_pct     | Field Goal Percentage                      |
| three_pt           | 3-Point Field Goals Per 36 Minutes         |
| three_pt_atmpts    | 3-Point Field Goal Attempts Per 36 Minutes |
| three_pt_pct       | 3-Point Field Goal Percentage              |
| two_pt             | 2-Point Field Goals Per 36 Minutes         |
| two_pt_atmpts      | 2-Point Field Goal Attempts Per 36 Minutes |
| two_pt_pct         | 2-Point Field Goal Percentage              |
| free_throw         | Free Throws Per 36 Minutes                 |
| free_throw_atmpts  | Free Throw Attempts Per 36 Minutes         |
| free_throw_pct     | Free Throw Percentage                      |
| rebounds_offensive | Offensive Rebounds Per 36 Minutes          |
| rebounds_defensive | Defensive Rebounds Per 36 Minutes          |
| rebounds_total     | Total Rebounds Per 36 Minutes              |
| assists            | Assists Per 36 Minutes                     |
| steals             | Steals Per 36 Minutes                      |
| blocks             | Blocks Per 36 Minutes                      |
| turnovers          | Turnovers Per 36 Minutes                   |
| fouls              | Personal Fouls Per 36 Minutes              |
| pts                | Points Per 36 Minutes                      |

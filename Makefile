report.html: code/05_render_report.R report.Rmd descriptive_analysis regression_analysis
	Rscript code/05_render_report.R

output/data.rds: code/00_import_data.R raw_data/nba_feb24.csv
	Rscript code/00_import_data.R

output/table.png: code/04_tabular_analysis.R output/data.rds
	Rscript code/04_tabular_analysis.R

output/bar_plot_team_distribution.png: code/01_descriptive_analysis.R output/data.rds
	Rscript code/01_descriptive_analysis.R
	
output/box_plot_performance_by_team.png: code/01_descriptive_analysis.R output/data.rds
	Rscript code/01_descriptive_analysis.R

output/histogram_pts_distribution.png: code/01_descriptive_analysis.R output/data.rds
	Rscript code/01_descriptive_analysis.R

output/scatter_plot_pts_vs_rebounds.png: code/01_descriptive_analysis.R output/data.rds
	Rscript code/01_descriptive_analysis.R

output/points_per_game_by_conference.png: code/01_descriptive_analysis.R output/data.rds
	Rscript code/01_descriptive_analysis.R

output/regression2_results.png: code/02_regression_analysis.R output/data.rds
	Rscript code/02_regression_analysis.R

output/regression_output.txt: code/02_regression_analysis.R output/data.rds
	Rscript code/02_regression_analysis.R

output/regression3_results.png: code/03_regression_analysis.R output/data.rds
	Rscript code/03_regression_analysis.R

output/regression3_output.txt: code/03_regression_analysis.R output/data.rds
	Rscript code/03_regression_analysis.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html rm -f output/*.txt

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
.PHONY: descriptive_analysis
descriptive_analysis: output/table.png output/bar_plot_team_distribution.png output/box_plot_performance_by_team.png output/histogram_pts_distribution.png output/scatter_plot_pts_vs_rebounds.png output/points_per_game_by_conference.png

.PHONY: regression_analysis
regression_analysis: output/regression2_results.png output/regression_output.txt output/regression3_results.png output/regression3_output.txt


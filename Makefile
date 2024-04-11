output/data.rds: code/00_import_data.R raw_data/nba_feb24.csv
	Rscript code/00_import_data.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
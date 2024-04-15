here::i_am("code/05_render_report.R") #location of this script

library(rmarkdown)
# rendering a report in production mode
render(input = here::here("./report.Rmd"), #location of report .rmd file
       output_file = here::here("./report.html")) #output of .rmd file

print("render report complete!")
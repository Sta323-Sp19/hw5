hw5.html: data/dennys.rds data/lq.rds hw5.Rmd
	Rscript -e "library(rmarkdown); render('hw5.Rmd')"

data/dennys.rds: parse_dennys.R data/dennys/*.html
	Rscript parse_dennys.R

data/lq.rds: parse_lq.R data/lq/*.html
	Rscript parse_lq.R
	
data/dennys/*.html: get_dennys.R
	Rscript get_dennys.R
	
data/lq/*.html: get_lq.R
	Rscript get_lq.R

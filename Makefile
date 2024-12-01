chronic_kidney_module5.html:chronic_kidney_module5.Rmd code/01_ckd_render_report.R  output/characteristics_summary_kidney.rds  output/numeric_summary.rds  output/ckd_plot_corr.rds  
	Rscript code/01_ckd_render_report.R
		
output/characteristics_summary_kidney.rds: code/01_ckd_output.R
	Rscript code/01_ckd_output.R
	
output/numeric_summary.rds: code/01_ckd_output.R
	Rscript code/01_ckd_output.R
		
output/ckd_plot_corr.rds: code/01_ckd_output.R
	Rscript code/01_ckd_output.R

.PHONY: clean install
clean:
	rm -f final_report.html && rm -f output/*.png $$ rm -f output/*.rds
install:
	Rscript -e "renv::restore(prompt=FALSE)"
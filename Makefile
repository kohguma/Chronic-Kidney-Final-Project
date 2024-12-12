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
	
#Docker associated rules:
PROJECTFILES = chronic_kidney_module5.Rmd code/01_ckd_output.R code/01_ckd_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

#Rule to build da image
ckd_docker: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t kohguma/ckd_docker .
	touch $@
	
#Rule to make final report.. please istg
final_report/chronic_kidney_module5.html: ckd_docker
	docker run -v "/$$(pwd)/final_report":/Chronic-Kidney-Final-Project/final_report kohguma/ckd_docker
	
	